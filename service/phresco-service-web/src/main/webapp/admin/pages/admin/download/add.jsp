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

<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">
	function findError(data) {
		if(data.nameError != undefined) {
			showError($("#nameControl"), $("#nameError"), data.nameError);
		} else {
			hideError($("#nameControl"), $("#nameError"));
		}
		
		if(data.verError != undefined) {
			showError($("#verControl"), $("#verError"), data.verError);
		} else {
			hideError($("#verControl"), $("#verError"));
		}
		
		if(data.appltError != undefined) {
			showError($("#appltControl"), $("#appltError"), data.appltError);
		} else {
			hideError($("#appltControl"), $("#appltError"));
		}
		
		if(data.groupError != undefined) {
			showError($("#groupControl"), $("#groupError"), data.groupError);
		} else {
			hideError($("#groupControl"), $("#groupError"));
		}
	}
	
	function showDiv() {
	    $('#othersDiv').show();
	}
	
	function hideDiv(){
	    $('#othersDiv').hide();
	}
</script>

<form class="form-horizontal customer_list">
	<h4><s:label for="description" key="lbl.hdr.adm.dwnlad.title" theme="simple"/></h4>	
	<div class="content_adder">
		<div class="control-group" id="nameControl">
			<label for="input01" class="control-label labelbold">
				<span class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.adm.name'/>
			</label>
			<div class="controls">
				<input id="input01" placeholder="Download Name" class="input-xlarge" type="text" name="name">
				<span class="help-inline" id="nameError"></span>
			</div>
		</div>
			
		<div class="control-group">
			<label for="input01" class="control-label labelbold">
				<s:text name='lbl.hdr.adm.desc'/>
			</label>
			<div class="controls">
				<input id="input01"  placeholder="Description" class="input-xlarge" type="text">
			</div>
		</div>
		
		<div class="control-group">
			<label for="input01" class="control-label labelbold">
				<s:text name='lbl.hdr.adm.dwnld.fle'/>
			</label>
			<div class="controls">
				<input class="input-xlarge" type="file" id="fileArc" name="fileArc">
			</div>
		</div>
		
		<div class="control-group" id="appltControl">
			<label for="input01" class="control-label labelbold">
				<span class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.adm.dwnld.appltfrm'/>
			</label>
			<div class="controls">
				<select id="multiSelect" multiple="multiple" name="application">
					<option  value="WN">Windows</option>
					<option  value="LN">Linux</option>
					<option  value="MC">Mac</option>
					<option  value="SL">Solaris</option>
				</select>
				<span class="help-inline applyerror" id="appltError"></span>
			</div>
		</div>
			
		<div class="control-group">
			<label for="input01" class="control-label labelbold">
				<s:text name='lbl.hdr.adm.dwnld.icon'/>
			</label>
			<div class="controls">
				<input class="input-xlarge" type="file" id="iconArc" name="iconArc">
			</div>
		</div>
			
		<div class="control-group" id="verControl">
			<label for="input01" class="control-label labelbold">
				<span class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.adm.dwnld.ver'/>
			</label>
			<div class="controls">
				<input id="input01" placeholder="Version" class="input-xlarge" type="text" name="version">
				<span class="help-inline" id="verError"></span>
			</div>
		</div>
			
		<div class="control-group" id="groupControl">
			<label for="input01" class="control-label labelbold">
				<span class="mandatory">*</span>&nbsp;<s:text name='lbl.hdr.adm.dwnld.group'/>
			</label>	
			<div class="controls">
				<select id="select01" name="group">
					<option value="" onclick="javascript:hideDiv();">- select -</option>
					<option value="DB" onclick="javascript:hideDiv();">Database</option>
					<option value="SR" onclick="javascript:hideDiv();">Servers</option>
					<option value="ED" onclick="javascript:hideDiv();">Editors</option>
                    <option value="OT" onclick="javascript:showDiv();">Others</option>
				</select>
				<span class="help-inline" id="groupError"></span>
			</div>
		</div>
        
        <div class="control-group popupalign" id="othersDiv">
			<%-- <s:label for="input01" cssClass="control-label labelbold" theme="simple"/> --%>
			<label for="input01" class="control-label labelbold">
				<span class="mandatory">*</span>
			</label>
			<div class="controls">
				<input id="input01" placeholder="Others" class="input-xlarge" type="text" name="others">
				<span class="help-inline" id="othersError"></span>
			</div>
		</div>
	</div>

	<div class="bottom_button">
		<input type="hidden" name="fromPage" value="add" />
		<input type="button" id="downloadSave" class="btn btn-primary" onclick="formSubmitFileUpload('downloadSave', 'fileArc,iconArc', $('#subcontainer'), 'Creating Download');" value="<s:text name='lbl.hdr.comp.save'/>"/>
		<input type="button" id="downloadCancel" class="btn btn-primary" onclick="loadContent('downloadCancel', $('#subcontainer'));" value="<s:text name='lbl.hdr.comp.cancel'/>"/>
	</div>
</form>