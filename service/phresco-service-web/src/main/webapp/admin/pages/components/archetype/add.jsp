<%--
  ###
  Service Web Archive
  
  Copyright (C) 1999 - 2012 Photon Infotech Inc.
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
       http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  ###
  --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.photon.phresco.model.Technology"%>
<%@ page import="java.util.List"%>
<%@ page import="com.photon.phresco.model.ApplicationType"%>
<%
	Technology technology = (Technology)request.getAttribute("technology");
	String fromPage = (String) request.getAttribute("fromPage");
	List<ApplicationType> appTypes = (List<ApplicationType>)request.getAttribute("appTypes");
%>
<script type="text/javascript">
	function findError(data) {
		if (data.nameError != undefined) {
			showError($("#nameControl"), $("#nameError"), data.nameError);
		} else {
			hideError($("#nameControl"), $("#nameError"));
		}

		if (data.verError != undefined) {
			showError($("#verControl"), $("#verError"), data.verError);
		} else {
			hideError($("#verControl"), $("#verError"));
		}
		if (data.appError != undefined) {
			showError($("#appControl"), $("#appError"), data.appError);
		} else {
			hideError($("#appControl"), $("#appError"));
		}

		if (data.fileError != undefined) {
			showError($("#fileControl"), $("#fileError"), data.fileError);
		} else {
			hideError($("#fileControl"), $("#fileError"));
		}
	}
</script>
<form class="form-horizontal customer_list">
	<h4 class="hdr">
		<%
			if (StringUtils.isNotEmpty(fromPage)) {
		%>
		<s:label for="description" key="lbl.hdr.comp.arhtyp.edit.title"
			theme="simple" />
		<%
			} else {
		%>
		<s:label for="description" key="lbl.hdr.comp.arhtyp.title"
			theme="simple" />
		<%
			}
		%>
	</h4>
	<div class="content_adder">
		<div class="control-group" id="nameControl">
			<label for="input01" class="control-label labelbold"> <span
				class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.comp.name' />
			</label>
			<div class="controls">
				<input id="input01" placeholder="Archetype Name"
					class="input-xlarge" type="text" name="name"
					value="<%=technology != null ? technology.getName() : ""%>">
				<span class="help-inline" id="nameError"></span>
			</div>
		</div>

		<div class="control-group">
			<label for="input01" class="control-label labelbold"> <s:text
					name='lbl.hdr.comp.desc' /> </label>
			<div class="controls">
				<input id="input01" placeholder="Description" class="input-xlarge"
					type="text" name="description"
					value="<%=technology != null ? technology.getDescription() : ""%>">
			</div>
		</div>

		<div class="control-group" id="verControl">
			<label for="input01" class="control-label labelbold"> <span
				class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.comp.version' />
			</label>
			<div class="controls">
				<input id="input01" placeholder="Version" class="input-xlarge"
					type="text" name="version"
					value="<%=technology != null ? technology.getVersions() : ""%>">
				<span class="help-inline" id="verError"></span>
			</div>
		</div>

		<div class="control-group">
			<label for="input01" class="control-label labelbold"> <s:text
					name='lbl.hdr.com.vercmnt' /> </label>
			<div class="controls">
				<textarea id="input01" placeholder="Version Comment"
					class="input-xlarge" rows="2" cols="10"
					value="<%=technology != null ? technology.getVersionComment() : ""%>"></textarea>
			</div>
		</div>

		<div class="control-group apptype" id="appControl">
			<label for="input01" class="control-label labelbold"> <span
				class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.comp.apptype' />
			</label>
			<div class="controls">
				<select id="select01" name="apptype">
					<%
						if (appTypes != null)  {
						               for(ApplicationType appType : appTypes){
					%>
					<option value="<%=appType.getName()%>"><%=appType.getName()%></option>
					<%
						} }
					%>

				</select> <span class="help-inline" id="appError"></span>
			</div>
		</div>

		<div class="control-group" id="fileControl">
			<label for="input01" class="control-label labelbold"> <span
				class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.comp.applnjar' />
			</label>
			<div class="controls">
				<input class="input-xlarge" type="file" id="applnArc"
					name="applnArc"> <span class="help-inline" id="fileError"></span>
			</div>
		</div>

		<div id="jar">
			<div class="control-group">
				<label for="input01" class="control-label labelbold"> <s:text
						name='lbl.hdr.comp.pluginjar' /> </label>
				<div class="controls">
					<input class="input-xlarge" type="file" id="pluginArc"
						name="pluginArc"> <a><img src="images/add_icon.png"
						class="addplugin imagealign" onclick="javascript:addpluginjar();">
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="bottom_button">
		<%
			if (StringUtils.isNotEmpty(fromPage)) {
		%>
		<input type="button" id="archetypeUpdate" class="btn btn-primary"
			onclick="formSubmitFileUpload('archetypeSave', 'applnArc,pluginArc', $('#subcontainer'), 'Updating Archetype');"
			value="<s:text name='lbl.hdr.comp.update'/>" />
		<%
			} else {
		%>
		<%
			}
		%>
		<input type="button" id="archetypeSave" class="btn btn-primary"
			onclick="formSubmitFileUpload('archetypeSave', 'applnArc,pluginArc', $('#subcontainer'), 'Creating Archetype');"
			value="<s:text name='lbl.hdr.comp.save'/>" /> <input type="button"
			id="archetypeCancel" class="btn btn-primary"
			onclick="loadContent('archetypeCancel', $('#subcontainer'));"
			value="<s:text name='lbl.hdr.comp.cancel'/>" />
	</div>
</form>

<script type="text/javascript">
	$(document).ready(function() {
		$('.del').live('click', function() {
			$(this).parent().parent().remove();
		});

		/* $(document).on('click', '.addplugin', function(){ 
		
		$('.addplugin').live('click',function(){ 	
			var appendTxt = "<div id='jar'><div id='input1' class='clonedInput'><div class='control-group'><label class='control-label labelbold' for='input01'>Plugin jar</label><div class='controls'><input id='input01' class='input-xlarge' type='file'>&nbsp;<img src='images/add_icon.png' class='addplugin imagealign'>&nbsp;<img src='images/minus_icon.png' class='del imagealign'></div></div></div></div>";
			$("div[id='jar']:last").after(appendTxt);			
			}); */

	});
	function addpluginjar() {
		var appendTxt = "<div id='jar'><div id='input1' class='clonedInput'><div class='control-group'><label class='control-label labelbold' for='input01'>Plugin jar</label><div class='controls'><input id='input01' class='input-xlarge' type='file'>&nbsp;<img src='images/add_icon.png' class='addplugin imagealign' onclick='addpluginjar();'>&nbsp;<img src='images/minus_icon.png' class='del imagealign'></div></div></div></div>";
		$("div[id='jar']:last").after(appendTxt);
	}
</script>