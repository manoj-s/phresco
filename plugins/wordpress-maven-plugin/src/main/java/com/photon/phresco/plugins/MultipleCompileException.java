/*
 * ###
 * wordpress-maven-plugin Maven Mojo
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
package com.photon.phresco.plugins;

import java.util.ArrayList;

public class MultipleCompileException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final ArrayList<Exception> exceptions;
	public MultipleCompileException(ArrayList<Exception> exceptions){
		this.exceptions = exceptions;
		
	}
	@Override
	public String getMessage() {
		StringBuffer message = new StringBuffer(); 
		for (int i = 0; i < exceptions.size(); i++) {
			message.append(exceptions.get(i).getMessage()+" \n");
		}
		return message.toString();
	}


}
