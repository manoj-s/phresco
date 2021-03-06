/*
 * ###
 * Phresco Pom
 * 
 * Copyright (C) 1999 - 2012 Photon Infotech Inc.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ###
 */
package com.phresco.pom.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBException;

import org.apache.log4j.Logger;

import com.phresco.pom.exception.PhrescoPomException;
import com.phresco.pom.model.ReportPlugin;
import com.phresco.pom.model.ReportPlugin.ReportSets;
import com.phresco.pom.model.ReportSet;
import com.phresco.pom.site.ReportCategories;
import com.phresco.pom.site.Reports;

/**
 * @author suresh_ma
 *
 */
public class SiteConfigurator {
	
	private static final Logger LOGGER = Logger.getLogger(SiteConfigurator.class);

	/**
	 * 
	 */
	private ReportPlugin reportPlugin = null;
	/**
	 * @param reports
	 * @param file
	 * @return
	 */
	public ReportPlugin addReportPlugin(Reports reports,File file) {
		try {
			PomProcessor processor = new PomProcessor(file);
			if(processor.getSitePlugin(PomConstants.SITE_PLUGIN_ARTIFACT_ID)== null) {
				processor.addSitePlugin();
			}
			reportPlugin = new ReportPlugin();
			reportPlugin.setGroupId(reports.getGroupId());
			reportPlugin.setArtifactId(reports.getArtifactId());
			reportPlugin.setVersion(reports.getVersion());
			processor.siteReportConfig(reportPlugin);
			processor.save();
			
		} catch (JAXBException e) {
			LOGGER.debug(e);
		} catch (IOException e) {
			LOGGER.debug(e);
		} catch (PhrescoPomException e) {
			LOGGER.debug(e);
		}
		return reportPlugin;
	}


	/**
	 * @param reportCategories
	 * @param file
	 */
	public void addInfoReportPlugin(List<ReportCategories> reportCategories,File file) {

		try{
			PomProcessor processor = new PomProcessor(file);
			if(processor.getSitePlugin(PomConstants.SITE_PLUGIN_ARTIFACT_ID)==null){
				processor.addSitePlugin();
			}
			reportPlugin = new ReportPlugin();
			reportPlugin.setGroupId(Reports.PROJECT_INFO.getGroupId());
			reportPlugin.setArtifactId(Reports.PROJECT_INFO.getArtifactId());
			reportPlugin.setVersion(Reports.PROJECT_INFO.getVersion());
			processor.siteReportConfig(reportPlugin);
			ReportSets reportSets = reportPlugin.getReportSets();
			ReportSet reportSet = new ReportSet();
			com.phresco.pom.model.ReportSet.Reports repo = new com.phresco.pom.model.ReportSet.Reports();
			if(reportSets == null){
				reportPlugin.setReportSets(new ReportSets());
				for (ReportCategories reportCategories2 : reportCategories) {
					reportSet.setReports(repo);		
					reportSet.getReports().getReport().add(reportCategories2.getName());
				} reportPlugin.getReportSets().getReportSet().add(reportSet);
				processor.save();
			} 
		}catch (JAXBException e) {
			LOGGER.debug(e);
		} catch (IOException e) {
			LOGGER.debug(e);
		} catch (PhrescoPomException e) {
			LOGGER.debug(e);
		}
	}


	/**
	 * @param reports
	 * @param file
	 */
	public void addReportPlugin(List<Reports> reports,File file){
		for (Reports iterateReport : reports) {
			addReportPlugin(iterateReport,file);
		}
	}
	
	/**
	 * @param reports
	 * @param file
	 */
	public void removeReportPlugin(List<Reports> reports,File file) {

		try {
			PomProcessor processor = new PomProcessor(file);
			for (Reports iterateReports : reports) {
				String groupId = iterateReports.getGroupId();
				String artifactId = iterateReports.getArtifactId();
				processor.removeSitePlugin(groupId,artifactId);
				processor.save();
			}
		} catch (JAXBException e) {
			LOGGER.debug(e);
		} catch (IOException e) {
			LOGGER.debug(e);
		}
	}
	
	/**
	 * @param file
	 * @return
	 */
	public List<Reports> getReports(File file) {
		try {
			PomProcessor processor = new PomProcessor(file);
			List<ReportPlugin> reportPlugin = processor.getReportPlugin();
			if(reportPlugin != null) {
			List<Reports> reports = new ArrayList<Reports>();
			List<ReportCategories> categories = new ArrayList<ReportCategories>();
			Reports reports1 = new Reports();
			ReportCategories reportCategories = new ReportCategories();
				for (ReportPlugin reportPlugin2 : reportPlugin) {
					reports1.setGroupId(reportPlugin2.getGroupId());
					reports1.setArtifactId(reportPlugin2.getArtifactId());
					List<String> projectInfoReportCategories = processor.getProjectInfoReportCategories();
					if(projectInfoReportCategories != null) {
						for (String name : projectInfoReportCategories) {
							reportCategories.setName(name);
							categories.add(reportCategories);
							reports1.setReportCategories(categories);
						}
					}
					reports.add(reports1);
				}
				return reports;
			}
		} catch (JAXBException e) {
			LOGGER.debug(e);
		} catch (IOException e) {
			LOGGER.debug(e);
		}
		return null;
	}
	
	/**
	 * @param file
	 * @param reportCategories
	 */
	public void removeReportCategory(File file,List<ReportCategories> reportCategories){
		try {
			PomProcessor processor = new PomProcessor(file);
			processor.removeProjectInfoReportCategory(reportCategories);
			processor.save();
		} catch (JAXBException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
