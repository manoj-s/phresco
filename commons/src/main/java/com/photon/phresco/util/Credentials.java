/*
 * ###
 * Phresco Commons
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
package com.photon.phresco.util;

import javax.xml.bind.annotation.XmlRootElement;


@SuppressWarnings("restriction")
@XmlRootElement
public class Credentials {
	
	String username;
	String password;
	
	public Credentials() {
		//for jaxb
	}

	public Credentials(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/*public static final String encode(Credentials cred) {
		String authString = cred.getUsername() + Constants.STR_COLON + cred.getPassword();		
		byte[] authEncBytes = Base64.encodeBase64(authString.getBytes());
		return new String(authEncBytes);
	}
	
	public static final Credentials decode(String data) {
		byte[] decodedBytes = Base64.decodeBase64(data);
		String decodedStr = new String(decodedBytes);
		int indexOf = decodedStr.indexOf(Constants.STR_COLON);
		String username = decodedStr.substring(0, indexOf);
		String password = decodedStr.substring(indexOf + 1);		
		return new Credentials(username, password);	
	}
	
	public static void main(String args[])	{
		Credentials cred = new Credentials("Phresco", "photon");
		String encode = Credentials.encode(cred);
		System.out.println("Encrypted " + encode);
		
		Credentials decode = Credentials.decode(encode);
		System.out.println("Decrypted " + decode);
	}*/
}
