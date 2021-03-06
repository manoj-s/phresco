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

<%@ include file="errorReport.jsp" %>
<%@ include file="description_dialog.jsp" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.commons.collections.CollectionUtils" %>
<%@ page import="org.apache.commons.collections.MapUtils" %>
<%@ page import="com.photon.phresco.commons.FrameworkConstants" %>
<%@ page import="com.photon.phresco.framework.api.Project" %>
<%@ page import="com.photon.phresco.model.ApplicationType" %>
<%@ page import="com.photon.phresco.model.ProjectInfo" %>
<%@ page import="com.photon.phresco.model.Technology" %>
<%@ page import="com.photon.phresco.model.ModuleGroup" %>
<%@ page import="com.photon.phresco.model.Module" %>
<%@page import="com.photon.phresco.model.Documentation.DocumentationType"%>

<style>
	.twipsy {
		margin-top: -5px;
		width: 30%; 
	}
	
	.twipsy.bootstrap-right {
		left: 0;
		margin-top: 6px;
		top: 0;
	}
	
	.twipsy-inner {
		margin-left: 5px;
		margin-top: -14px;
		padding: 3px 8px;
		width: 65%;
	}
	
	 .twipsy-arrow {
		position: relative;
		left: 0;
		margin-top: 6px;
		top: 0;
	} 
	
	.external_features_wrapper {
		border: 1px solid #a3a3a3;
		border-radius : 6px; 
		float: left; 
		width: 98%;
		height: 85%;
	}
	
	.custommodule_accordion_container {
		height: 72%;
    	width: 99.4%;
	}
	
	#coremodule_accordion_container {
		height:84%;
	}
	
</style>

<script type="text/javascript" src="js/loading.js"></script>
<script type="text/javascript" src="js/home-header.js"></script>
<!-- Feature js -->
<script type="text/javascript" src="js/feature.js"></script>

<%
	String appType = "";
	String disabled = "disabled";
    
    List<ModuleGroup> modules = (List<ModuleGroup>) request.getAttribute(FrameworkConstants.REQ_FEATURES_LEFT_MODULES);
    String moduleHdr = (String)request.getAttribute(FrameworkConstants.REQ_FEATURES_FIRST_MDL_CAT);
    String moduleType = "";
    if (FrameworkConstants.REQ_CUSTOM_FEATURES.equals(moduleHdr)) {
    	moduleType = FrameworkConstants.REQ_CUSTOM_MODULE;
    }
    
    if (FrameworkConstants.REQ_EXTERNAL_FEATURES.equals(moduleHdr)) {
    	moduleType = FrameworkConstants.REQ_CORE_MODULE;
    }

    if (FrameworkConstants.REQ_JS_LIBS.equals(moduleHdr)) {
    	moduleType = FrameworkConstants.REQ_JSLIB_MODULE;
    }
    
    Map<String, String> pilotModules = (Map<String, String>) request.getAttribute(FrameworkConstants.REQ_PILOTS_IDS);
    Map<String, String> alreadySelectedModules = (Map<String, String>) request.getAttribute(FrameworkConstants.REQ_ALREADY_SELECTED_MODULES);

    Map<String, String> pilotJsLibs = (Map<String, String>) request.getAttribute(FrameworkConstants.REQ_PILOT_JSLIBS);
    Map<String, String> alreadySelectedJsLibs = (Map<String, String>) request.getAttribute(FrameworkConstants.REQ_ALREADY_SELECTED_JSLIBS);
    
    Map<String, String> selectedModules = (Map<String, String>) request.getAttribute(FrameworkConstants.REQ_TEMP_SELECTEDMODULES);
    Map<String, String> selectedJsLibs = (Map<String, String>) request.getAttribute(FrameworkConstants.REQ_TEMP_SELECTED_JSLIBS);

    String fromPage = (String) request.getAttribute(FrameworkConstants.REQ_FROM_PAGE);
    ProjectInfo projectInfo = (ProjectInfo) request.getAttribute(FrameworkConstants.REQ_PROJECT_INFO);
    String projectCode = "";
    String techId = "";
    if (projectInfo != null) {
        techId = projectInfo.getTechnology().getId();
        session.setAttribute(projectInfo.getCode(), projectInfo);
        projectCode = projectInfo.getCode();
    }
    
    String configServerNames = (String) request.getAttribute(FrameworkConstants.REQ_CONFIG_SERVER_NAMES);
    String configDbNames = (String) request.getAttribute(FrameworkConstants.REQ_CONFIG_DB_NAMES);
    
    if (StringUtils.isEmpty(fromPage)) {
    	fromPage = "";
    	disabled = "";
%>
    
    <form id="createProjectForm" action="save" method="post" autocomplete="off" class="app_features_form">
<% 
	} else {
%>
    <form action="#" method="post" autocomplete="off" class="app_features_form">
<% } %>

	<div class="clearfix" style="margin: 5px 0 0 5px;">
	    <label for="xlInput" style="width: auto;"><s:text name="label.select.pilot.project"/></label>
	
	    <!--  Pilot projects are loaded here starts-->
	    <div class="input">
	    	<%
	    		String pilotProject = "None";
	    		if(StringUtils.isNotEmpty(projectInfo.getPilotProjectName())) {
	    			pilotProject = projectInfo.getPilotProjectName();
	    		}
	    	%>
	    	<input type="text" class="medium" id="selectedPilotProject" name="selectedPilotProject" disabled="disabled" value="<%= pilotProject %>">
	    </div>
	    <!--  Pilot projects are loaded here ends -->
	</div>
	
    <div class="featuresScrollDiv"> <!-- Pilot Projects Combo Box -->
    	<% 
		    String checkedStr = "";
		    String disabledStr = "";
			if (CollectionUtils.isEmpty(modules)) {
		%>
			<div class="alert-message block-message warning">
				<center><label class="errorMsgLabel"><s:text name="label.feature.not.avail"/></label></center>
			</div>
			
		<% } else { 
				if (CollectionUtils.isNotEmpty(modules)) {
		%>		
				<div class="tblheader">
					<table class="zebra-striped">
						<tr>
							<th class="editFeatures_th1">
								<input type="checkbox"	value="AllJsLibs" id="checkAllJsLibs" name="<%= moduleType %>" onchange="selectAllChkBoxClk('<%= moduleType %>', this)">
							</th>
							<th class="editFeatures_th2"><%= moduleHdr %></th>
						</tr>
					</table>
				</div>
				<div class="theme_accordion_container jsLib_accordion_container">
				    <section class="accordion_panel_wid">
				        <div class="accordion_panel_inner">
				            <section class="lft_menus_container">
				            <%
								for (ModuleGroup module : modules) {
									disabledStr = "";
									checkedStr = "";

									String pilotVersion = "";
									if (moduleHdr.equals(FrameworkConstants.REQ_JS_LIBS)) {
										if (MapUtils.isNotEmpty(alreadySelectedJsLibs) && StringUtils.isNotEmpty(alreadySelectedJsLibs.get(module.getId()))) {
											pilotVersion = alreadySelectedJsLibs.get(module.getId());
											checkedStr = "checked";
											disabledStr = "disabled";
										}
										if (MapUtils.isNotEmpty(selectedJsLibs) && selectedJsLibs.get(module.getId()) != null) {
											checkedStr = "checked";
										}
									} else {
										if (MapUtils.isNotEmpty(alreadySelectedModules) && StringUtils.isNotEmpty(alreadySelectedModules.get(module.getId()))) {
											pilotVersion = alreadySelectedModules.get(module.getId());
											checkedStr = "checked";
											disabledStr = "disabled";
										}
										if (MapUtils.isNotEmpty(selectedModules) && selectedModules.get(module.getId()) != null) {
											checkedStr = "checked";
										}
									}
							%>
				                <span class="siteaccordion closereg">
				                	<span>
					                	<% if (moduleHdr.equals(FrameworkConstants.REQ_JS_LIBS)) { %>
					                		<input type="checkbox" class="<%= FrameworkConstants.REQ_JSLIB_MODULE %>" name="<%= FrameworkConstants.REQ_SELECTED_JSLIBS %>" value="<%= module.getId()%>" <%=disabledStr %> 
						                		<%= checkedStr %> id="<%= module.getId()%>checkBox">
					                	<% } else if (moduleHdr.equals(FrameworkConstants.REQ_CUSTOM_FEATURES)) { %>
					                		<input type="checkbox" class="<%= FrameworkConstants.REQ_CUSTOM_MODULE %>" name="<%= FrameworkConstants.REQ_SELECTEDMODULES %>" 
						                		value="<%= module.getId()%>" <%=disabledStr %> <%= checkedStr %> id="<%= module.getId()%>checkBox">
					                	<% } else { %>
					                		<input type="checkbox" class="<%= FrameworkConstants.REQ_CORE_MODULE %>" name="<%= FrameworkConstants.REQ_SELECTEDMODULES %>" 
					                			id="<%= module.getId()%>checkBox" value="<%= module.getId()%>" <%=disabledStr %> <%= checkedStr %>>
					                	<% } %>
				                		&nbsp;&nbsp;<%= module.getName() %>&nbsp;&nbsp;
				                		<p id="<%= module.getId()%>version" class="version versionDisplay_JSLib"></p>
				                	</span>
				                </span>
				                <div class="mfbox siteinnertooltiptxt" style="display: none;">
				                    <div class="scrollpanel">
				                        <section class="scrollpanel_inner">
				                        	<table class="download_tbl">
					                        	<!-- <thead>
					                            	<tr class="download_tbl_header">
					                            		<th>#</th>
				                            			<th>Name</th>
				                            			<th>Version</th>
				                            		</tr>
					                            </thead> -->
					                            <tbody>
					                            <% 
					                            String descContent = "";
												if (module.getDoc(DocumentationType.DESCRIPTION) != null) { 
												  	descContent = module.getDoc(DocumentationType.DESCRIPTION).getContent();
												}
												  
												String helpTextContent = "";
												if (module.getDoc(DocumentationType.HELP_TEXT) != null) { 
												  	helpTextContent = module.getDoc(DocumentationType.HELP_TEXT).getContent();
												}
												
										    	List<Module> versions = module.getVersions();
										    	if (CollectionUtils.isNotEmpty(versions)) {
													for (Module moduleVersion : versions) {
														checkedStr = "";
														if (moduleHdr.equals(FrameworkConstants.REQ_JS_LIBS)) {
															if (MapUtils.isNotEmpty(selectedJsLibs)) {
																String selectedVersion = selectedJsLibs.get(module.getId());
																if (StringUtils.isNotEmpty(selectedVersion) && moduleVersion.getVersion().equals(selectedVersion)) {
																	checkedStr = "checked";
																} 
															}
														} else {
															if (MapUtils.isNotEmpty(selectedModules)) {
																String selectedVersion = selectedModules.get(module.getId());
																if (StringUtils.isNotEmpty(selectedVersion) && moduleVersion.getVersion().equals(selectedVersion)) {
																	checkedStr = "checked";
																} 
															}
															if (StringUtils.isNotEmpty(pilotVersion) && moduleVersion.getVersion().equals(pilotVersion)) {
																checkedStr = "checked";
															}
														}
															
												%>
													<tr>
														<td class="editFeatures_td1">
															<input type="radio" name="<%= module.getId() %>" 
																value="<%= moduleVersion.getVersion() %>" <%=disabledStr %> <%= checkedStr %> 
																onclick="selectCheckBox('<%= module.getId()%>', '<%= moduleType %>', this);">
														</td>
														<td class="editFeatures_td2">
														<% descContent = descContent.replaceAll("\"","&quot;"); %>
															<a href="#" name="ModuleDesc" title="<%= descContent %>" class="<%= module.getId()%>" id="<%= helpTextContent %>"><%= module.getName() %></a>
														</td>
														<td class="editFeatures_td4"><%= moduleVersion.getVersion() %></td>
													</tr>
													<%	} %>
										    	<% } %>
					                            </tbody>
				                        	</table>
				                        </section>
				                    </div>
				                </div>
				                <% 		
									}
								%>	
				            </section>  
				        </div>
				    </section>
				</div>
		<% 	  	}
				
			} %>
	</div>
	<div class="features_actions">
		<a id="previous" href="#" class="primary btn"><s:text name="label.previous"/></a>
		<%
			if(StringUtils.isNotEmpty(fromPage)) {
		%>
			<input id="update" type="button" value="<s:text name="label.update"/>" class="primary btn createProject_btn">
		<% } else { %>
			<input id="finish" type="button" value="<s:text name="label.finish"/>" class="primary btn createProject_btn">
		<% } %>
			<input type="button" id="cancel" value="<s:text name="label.cancel"/>" class="primary btn">
			<!-- tech id value for dependency check call -->
			<input type="hidden" id="technology" name="techId" value="<%= techId %>">
			<input type="hidden" id="configServerNames" name="configServerNames" value="<%= configServerNames %>">
			<input type="hidden" id="configDbNames" name="configDbNames" value="<%= configDbNames %>">
			<input type="hidden" name="fromTab" value="features">
	</div>
    </form>
    
<!-- Tool tip div -->
<div class="twipsy bootstrap-right" id="toolTipDiv" style="display: none;">
	<div class="twipsy-arrow" id="arrow"></div>
	<div class="twipsy-inner"></div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		enableScreen();
	});
	$('#projectCode').val('<%= projectCode %>'); //this is for changing the sub-tab.
	$('#fromPage').val('<%= fromPage %>'); //this is for changing the sub-tab.
</script>