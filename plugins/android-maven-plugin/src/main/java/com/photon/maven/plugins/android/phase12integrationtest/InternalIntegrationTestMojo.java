/*
 * ###
 * Android Maven Plugin - android-maven-plugin
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
/*
 * Copyright (C) 2009 Jayway AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.photon.maven.plugins.android.phase12integrationtest;

import com.photon.maven.plugins.android.AbstractInstrumentationMojo;

import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;

/**
 * Internal. Do not use.<br/>
 * Called automatically when the lifecycle reaches phase <code>integration-test</code>. Figures out whether to
 * call goals in this phase; and if so, calls <code>android:instrument</code>.
 *
 * @goal internal-integration-test
 * @phase integration-test
 */
public class InternalIntegrationTestMojo extends AbstractInstrumentationMojo {

    public void execute() throws MojoExecutionException, MojoFailureException {
        if (isEnableIntegrationTest()) {
            instrument();
        }
    }

}
