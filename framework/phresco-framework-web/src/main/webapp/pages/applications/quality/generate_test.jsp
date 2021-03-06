<%--
  ###
  Framework Web Archive
  
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

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.photon.phresco.commons.FrameworkConstants"%>
<%@ page import="com.photon.phresco.commons.BuildInfo"%>
<%@ page import="com.photon.phresco.model.SettingsInfo"%>
<%@ page import="com.photon.phresco.framework.api.Project" %>
<%@ page import="com.photon.phresco.util.Constants"%>
<%@ page import="com.photon.phresco.configuration.Environment"%>
<%@ page import="org.apache.commons.collections.CollectionUtils" %>

<script src="js/reader.js" ></script>
<script src="js/select-envs.js"></script>

<%
	Project project = (Project) request.getAttribute(FrameworkConstants.REQ_PROJECT);
	String projectCode = (String)project.getProjectInfo().getCode();
	String testType = (String) request.getAttribute(FrameworkConstants.REQ_TEST_TYPE);
    List<BuildInfo> buildInfos = (List<BuildInfo>) request.getAttribute(FrameworkConstants.REQ_TEST_BUILD_INFOS);
    if(buildInfos == null) {
        buildInfos = new ArrayList<BuildInfo>();
    }

    List<String> projectModules = (List<String>) request.getAttribute(FrameworkConstants.REQ_PROJECT_MODULES);
    Map<String, String> browserMap = (Map<String, String>)request.getAttribute(FrameworkConstants.REQ_TEST_BROWSERS);
    List<Environment> environments = (List<Environment>) request.getAttribute(FrameworkConstants.REQ_ENVIRONMENTS);
%>
<div id="tests" style="display:block">
<form action="functional" method="post" autocomplete="off" class="build_form">
	<div class="popup_Modal" id="generateTest">
		<div class="modal-header">
			<h3><s:text name="label.functional.test"/></h3>
			<a class="close" href="#" id="close">&times;</a>
		</div>
		
		<div class="modal-body">
            <fieldset class="popup-fieldset">
                <!-- Show Settings -->
                <div class="clearfix">
                    <div class="xlInput">
                        <ul class="inputs-list">
                            <li class="popup-li"> 
                                <input type="radio" id="showBuild" name="testAgainst" value="<%= FrameworkConstants.REQ_BUILD %>" checked>
                                <span class="textarea_span popup-span"><s:text name="label.against.build"/></span>
                                <input type="radio" id="showServer" name="testAgainst" value="<%= FrameworkConstants.REQ_DEPLOY_SERVER %>" >
                                <span class="textarea_span popup-span"><s:text name="label.against.server"/></span>
                                <input type="radio" id="showrelease" name="testAgainst" value="<%= FrameworkConstants.REQ_RELEASE %>" disabled="disabled">
                                <span class="textarea_span popup-span"><s:text name="label.against.release"/></span>
                            </li>
                        </ul>
                    </div>  
                </div>
            </fieldset>
            
            <div id="agnBuildid"  class="build">
				<!--  Build No -->
				<div class="clearfix">
					<label for="xlInput" class="xlInput popup-label"><s:text name="label.buil.id"/></label>
					<div class="input">
						<select id="buildId" name="<%= FrameworkConstants.REQ_TEST_BUILD_ID %>" class="xlarge">
						   <%
						       for(BuildInfo buildInfo : buildInfos) {
						   %>
								<option value="<%= buildInfo.getBuildNo()%>"> <%= buildInfo.getBuildNo() %></option>
						   <% } %>
							  
						</select>
					</div>
				</div>
			</div>
			
			 <div id="agnBrowser" class="build server">
				<!-- Browser -->
				<div class="clearfix">
					<label for="xlInput" class="xlInput popup-label"><s:text name="label.browser"/></label>
					<div class="input">
						<select id="browser" name="browser" class="xlarge" >
						<%
							Iterator browsers = browserMap.entrySet().iterator();
							while (browsers.hasNext()) {
							    Map.Entry entry = (Map.Entry) browsers.next();
							    String key = (String)entry.getKey();
							    String value = (String)entry.getValue();
						%>
								<option value="<%=key%>"><%=value%></option>
						<%	    
							}
						%>
						</select>
					</div>
				</div>
            </div>
            
            <div>
            	<div class="clearfix" id="agnBuild" style="display: none;">
				    <label for="xlInput" class="xlInput popup-label"><span class="red">*</span> <s:text name="label.environment"/></label>
				    <div class="input">
				        <select id="environments" name="environment" class="xlarge agnBuildEnv">
				        
				        </select>
					</div>
				</div>
            </div>
            
            <div id="agnServer" class="server" style="display: none;">
	            <div class="clearfix">
				    <label for="xlInput" class="xlInput popup-label"><span class="red">*</span> <s:text name="label.environment"/></label>
				    <div class="input">
				        <select id="environments" name="environment" class="xlarge agnServerEnv">
				        	<optgroup label="Configurations" class="optgrplbl">
							<%
								String defaultEnv = "";
								String selectedStr = "";
								if(environments != null) {
									for (Environment environment : environments) {
										if(environment.isDefaultEnv()) {
											defaultEnv = environment.getName();
											selectedStr = "selected";
										} else {
											selectedStr = "";
										}
							%>
									<option value="<%= environment.getName() %>" <%= selectedStr %>><%= environment.getName() %></option>
							<% 		} 
								}
							%>
							</optgroup>
						</select>
					</div>
				</div>
			
	           	<div id="showSetting">
	                 <!-- Server -->
	                <div class="clearfix">
	                    <label for="xlInput" class="xlInput popup-label"><s:text name="label.show.setting"/></label>
	                    <div class="input" style="padding-top: 6px;">
	                        <input type="checkbox" name="showSettings" id="showSettings" value="showSettings">
	                    </div>
	                </div>
				</div>
            </div>

            <% if (CollectionUtils.isNotEmpty(projectModules)) {  %>
            <div id="agnBrowser" class="build server">
				<!-- Modules -->
				<div class="clearfix">
					<label for="xlInput" class="xlInput popup-label"><s:text name="label.modules"/></label>
					<div class="input">
						<select id="testModule" name="testModule" class="xlarge" >
						 <%
						       for(String projectModule : projectModules) {
						 %>
								<option value="<%= projectModule%>"> <%= projectModule %></option>
						 <% } %>
						</select>
					</div>
				</div>
            </div>
            <% } %>

		</div>
		
		<div class="modal-footer">
		    <div class="action popup-action">
		    	<div id="errMsg" style="width:72%; text-align: left;"></div>
	        	<input type="button" class="btn primary" value="<s:text name="label.cancel"/>" id="cancel">
	        	<input type="button" id="test" class="btn primary" value="<s:text name="label.test"/>">
	        </div>
		</div>
	</div>
</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		if ($('#buildId').val() == null){
			$('#showBuild').attr('disabled', 'disabled');
			$('#showServer').prop('checked', true);
			$(".agnServerEnv").prop("id", "environments");
			$(".agnBuildEnv").prop("id", "");
			hideAll();
			$('.server').show();
			$('#agnServer').show();
			$('#agnBuild').hide();
		} else {
			$(".agnServerEnv").prop("id", "");
			$(".agnBuildEnv").prop("id", "environments");
			$('#agnBuild').show();
			$('#agnServer').hide();
			showBuildEnvs();
		}
		
		$('#close, #cancel').click(function() {
			showParentPage();
		});
		
		$(('input:radio[name=testAgainst]')).click(function() {
			hideAll();
			$('.'+ $(this).val()).show();
		    if($(this).val() == "release") {
		    	hideAll();
            }
		    if($(this).val() == "build") {
		    	$(".agnServerEnv").prop("id", "");
				$(".agnBuildEnv").prop("id", "environments");
		    	$('#agnBuild').show();
				$('#agnServer').hide();
		    	showBuildEnvs();
            }
		    if($(this).val() == "server") {
		    	$(".agnServerEnv").prop("id", "environments");
				$(".agnBuildEnv").prop("id", "");
		    	$('#agnBuild').hide();
				$('#agnServer').show();
            }
	    });

		$("#buildId").change(function() {
			showBuildEnvs();
		});

		$('#test').click(function() {
			checkForConfigType('<%= Constants.SETTINGS_TEMPLATE_SERVER %>');
		});
		
		showPopup();
	});

	function showBuildEnvs() {
    	var params = "projectCode=";
    	params = params.concat('<%= projectCode %>');
    	params = params.concat("&buildId=");
    	params = params.concat($('#buildId').val());
    	performAction("fetchBuildInfoEnvs", params, '', true);
    }

	function successEnvValidation(data) {
		if(data.hasError == true) {
			showError(data);
		} else {
			$('#tests').show().css("display","none");
		    $('#build-outputOuter').show().css("display","block");
		    getCurrentCSS();
		    functional();
		}
	}

	function hideAll() {
        $('.build').hide();
        $('.browser').hide();
        $('.server').hide();
	}

    function functional(envs) {
        var params = "envs=";
        params = params.concat(getSelectedEnvs());
        readerHandlerSubmit('functional', '<%= projectCode %>', '<%= FrameworkConstants.FUNCTIONAL %>', params);
	}

    function checkObj(obj) {
		if(obj == "null" || obj == undefined) {
			return "";
		} else {
			return obj;
		}
	}
</script>