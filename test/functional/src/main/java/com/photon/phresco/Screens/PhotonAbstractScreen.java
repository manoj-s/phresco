package com.photon.phresco.Screens;

import java.io.IOException;

public class PhotonAbstractScreen extends WebDriverAbstractBaseScreen {

	// public PhrescoUiConstantsXml phrescoXml;

	
	public PhotonAbstractScreen(String host, int port, String browser,
			String url, String speed, String context) throws IOException,
			Exception {
		super(host, port, browser, url, speed, context);
	}

	public PhotonAbstractScreen() {

	}

}
