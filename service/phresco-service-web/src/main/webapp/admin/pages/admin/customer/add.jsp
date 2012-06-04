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

<script type="text/javascript">
function findError(data) {
	if(data.nameError != undefined) {
		showError($("#nameControl"), $("#nameError"), data.nameError);
	} else {
		hideError($("#nameControl"), $("#nameError"));
	}
	
	if(data.mailError != undefined) {
		showError($("#mailControl"), $("#mailError"), data.mailError);
	} else {
		hideError($("#mailControl"), $("#mailError"));
	}
	
	if(data.addressError != undefined) {
		showError($("#addresControl"), $("#addresError"), data.addressError);
	} else {
		hideError($("#addresControl"), $("#addresError"));
	}
	
	if(data.zipError != undefined) {
		showError($("#zipControl"), $("#zipError"), data.zipError);
	} else {
		hideError($("#zipControl"), $("#zipError"));
	}
	
	if(data.numError != undefined) {
		showError($("#numControl"), $("#numError"), data.numError);
	} else {
		hideError($("#numControl"), $("#numError"));
	}
	
	if(data.faxError != undefined) {
		showError($("#faxControl"), $("#faxError"), data.faxError);
	} else {
		hideError($("#faxControl"), $("#faxError"));
	}
	
	if(data.conError != undefined) {
		showError($("#conControl"), $("#conError"), data.conError);
	} else {
		hideError($("#conControl"), $("#conError"));
	}
	
	if(data.licenError != undefined) {
		showError($("#licenControl"), $("#licenError"), data.licenError);
	} else {
		hideError($("#licenControl"), $("#licenError"));
	}
}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		// Date picker
		document.getElementById('fromdate').value = '';
		$(function() {
			$("#fromdate").datepicker({
				showOn : "button",
				buttonImage : "images/calendar.gif",
				buttonImageOnly : true
			});
			document.getElementById('todate').value = '';
			$("#todate").datepicker({
				showOn : "button",
				buttonImage : "images/calendar.gif",
				buttonImageOnly : true
			});

		});
	});
	
</script>

<form class="form-horizontal customer_list">
	<h4>
		<s:label for="description" key="lbl.header.admin.cust.tilte"
			theme="simple" />
	</h4>
	<div class="content_adder">
		<div class="control-group" id ="nameControl">
			<s:label for="input01" key="lbl.header.admin.name" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<input id="input01" placeholder="Customer Name" class="input-xlarge" name="name" type="text">
					<span class="help-inline" id="nameError"></span>
			</div>
		</div>

		<div class="control-group">
			<s:label for="input01" key="lbl.header.admin.desc" cssClass="control-label labelbold" theme="simple"/>
			<div class="controls">
				<input id="input01" placeholder="Description" class="input-xlarge"
					type="text">
			</div>
		</div>

		<div class="control-group" id ="mailControl">
			<s:label for="input01" key="lbl.header.admin.cust.mail" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"> <i class="icon-envelope"></i> </span> <input
						id="inputIcon" class="span2" type="text" name="email">
						<span class="help-inline" id="mailError"></span>
				</div>
			</div>
		</div>

		<div class="control-group" id="addresControl">
			<s:label for="input01" key="lbl.header.admin.cust.adrs" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<textarea id="textarea" placeholder="Address" class="input-xlarge"
					rows="3" name="address"></textarea>
					<span class="help-inline" id="addresError"></span>
			</div>
		</div>

		<div class="control-group" id="conControl">
			<s:label for="input01" key="lbl.header.admin.cust.cntry" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<select id="combobox" name="country">
					<option value="">- select -</option>
					<option value="AF">Afghanistan</option>
					<option value="AL">Albania</option>
					<option value="DZ">Algeria</option>
					<option value="AS">American Samoa</option>
					<option value="AD">Andorra</option>
					<option value="AG">Angola</option>
					<option value="AI">Anguilla</option>
					<option value="AG">Antigua &amp; Barbuda</option>
					<option value="AR">Argentina</option>
					<option value="AA">Armenia</option>
					<option value="AW">Aruba</option>
					<option value="AU">Australia</option>
					<option value="AT">Austria</option>
					<option value="AZ">Azerbaijan</option>
					<option value="BS">Bahamas</option>
					<option value="BH">Bahrain</option>
					<option value="BD">Bangladesh</option>
					<option value="BB">Barbados</option>
					<option value="BY">Belarus</option>
					<option value="BE">Belgium</option>
					<option value="BZ">Belize</option>
					<option value="BJ">Benin</option>
					<option value="BM">Bermuda</option>
					<option value="BT">Bhutan</option>
					<option value="BO">Bolivia</option>
					<option value="BL">Bonaire</option>
					<option value="BA">Bosnia &amp; Herzegovina</option>
					<option value="BW">Botswana</option>
					<option value="BR">Brazil</option>
					<option value="BC">British Indian Ocean Ter</option>
					<option value="BN">Brunei</option>
					<option value="BG">Bulgaria</option>
					<option value="BF">Burkina Faso</option>
					<option value="BI">Burundi</option>
					<option value="KH">Cambodia</option>
					<option value="CM">Cameroon</option>
					<option value="CA">Canada</option>
					<option value="IC">Canary Islands</option>
					<option value="CV">Cape Verde</option>
					<option value="KY">Cayman Islands</option>
					<option value="CF">Central African Republic</option>
					<option value="TD">Chad</option>
					<option value="CD">Channel Islands</option>
					<option value="CL">Chile</option>
					<option value="CN">China</option>
					<option value="CI">Christmas Island</option>
					<option value="CS">Cocos Island</option>
					<option value="CO">Colombia</option>
					<option value="CC">Comoros</option>
					<option value="CG">Congo</option>
					<option value="CK">Cook Islands</option>
					<option value="CR">Costa Rica</option>
					<option value="CT">Cote D'Ivoire</option>
					<option value="HR">Croatia</option>
					<option value="CU">Cuba</option>
					<option value="CB">Curacao</option>
					<option value="CY">Cyprus</option>
					<option value="CZ">Czech Republic</option>
					<option value="DK">Denmark</option>
					<option value="DJ">Djibouti</option>
					<option value="DM">Dominica</option>
					<option value="DO">Dominican Republic</option>
					<option value="TM">East Timor</option>
					<option value="EC">Ecuador</option>
					<option value="EG">Egypt</option>
					<option value="SV">El Salvador</option>
					<option value="GQ">Equatorial Guinea</option>
					<option value="ER">Eritrea</option>
					<option value="EE">Estonia</option>
					<option value="ET">Ethiopia</option>
					<option value="FA">Falkland Islands</option>
					<option value="FO">Faroe Islands</option>
					<option value="FJ">Fiji</option>
					<option value="FI">Finland</option>
					<option value="FR">France</option>
					<option value="GF">French Guiana</option>
					<option value="PF">French Polynesia</option>
					<option value="FS">French Southern Ter</option>
					<option value="GA">Gabon</option>
					<option value="GM">Gambia</option>
					<option value="GE">Georgia</option>
					<option value="DE">Germany</option>
					<option value="GH">Ghana</option>
					<option value="GI">Gibraltar</option>
					<option value="GB">Great Britain</option>
					<option value="GR">Greece</option>
					<option value="GL">Greenland</option>
					<option value="GD">Grenada</option>
					<option value="GP">Guadeloupe</option>
					<option value="GU">Guam</option>
					<option value="GT">Guatemala</option>
					<option value="GN">Guinea</option>
					<option value="GY">Guyana</option>
					<option value="HT">Haiti</option>
					<option value="HW">Hawaii</option>
					<option value="HN">Honduras</option>
					<option value="HK">Hong Kong</option>
					<option value="HU">Hungary</option>
					<option value="IS">Iceland</option>
					<option value="IN">India</option>
					<option value="ID">Indonesia</option>
					<option value="IA">Iran</option>
					<option value="IQ">Iraq</option>
					<option value="IR">Ireland</option>
					<option value="IM">Isle of Man</option>
					<option value="IL">Israel</option>
					<option value="IT">Italy</option>
					<option value="JM">Jamaica</option>
					<option value="JP">Japan</option>
					<option value="JO">Jordan</option>
					<option value="KZ">Kazakhstan</option>
					<option value="KE">Kenya</option>
					<option value="KI">Kiribati</option>
					<option value="NK">Korea North</option>
					<option value="KS">Korea South</option>
					<option value="KW">Kuwait</option>
					<option value="KG">Kyrgyzstan</option>
					<option value="LA">Laos</option>
					<option value="LV">Latvia</option>
					<option value="LB">Lebanon</option>
					<option value="LS">Lesotho</option>
					<option value="LR">Liberia</option>
					<option value="LY">Libya</option>
					<option value="LI">Liechtenstein</option>
					<option value="LT">Lithuania</option>
					<option value="LU">Luxembourg</option>
					<option value="MO">Macau</option>
					<option value="MK">Macedonia</option>
					<option value="MG">Madagascar</option>
					<option value="MY">Malaysia</option>
					<option value="MW">Malawi</option>
					<option value="MV">Maldives</option>
					<option value="ML">Mali</option>
					<option value="MT">Malta</option>
					<option value="MH">Marshall Islands</option>
					<option value="MQ">Martinique</option>
					<option value="MR">Mauritania</option>
					<option value="MU">Mauritius</option>
					<option value="ME">Mayotte</option>
					<option value="MX">Mexico</option>
					<option value="MI">Midway Islands</option>
					<option value="MD">Moldova</option>
					<option value="MC">Monaco</option>
					<option value="MN">Mongolia</option>
					<option value="MS">Montserrat</option>
					<option value="MA">Morocco</option>
					<option value="MZ">Mozambique</option>
					<option value="MM">Myanmar</option>
					<option value="NA">Nambia</option>
					<option value="NU">Nauru</option>
					<option value="NP">Nepal</option>
					<option value="AN">Netherland Antilles</option>
					<option value="NL">Netherlands (Holland, Europe)</option>
					<option value="NV">Nevis</option>
					<option value="NC">New Caledonia</option>
					<option value="NZ">New Zealand</option>
					<option value="NI">Nicaragua</option>
					<option value="NE">Niger</option>
					<option value="NG">Nigeria</option>
					<option value="NW">Niue</option>
					<option value="NF">Norfolk Island</option>
					<option value="NO">Norway</option>
					<option value="OM">Oman</option>
					<option value="PK">Pakistan</option>
					<option value="PW">Palau Island</option>
					<option value="PS">Palestine</option>
					<option value="PA">Panama</option>
					<option value="PG">Papua New Guinea</option>
					<option value="PY">Paraguay</option>
					<option value="PE">Peru</option>
					<option value="PH">Philippines</option>
					<option value="PO">Pitcairn Island</option>
					<option value="PL">Poland</option>
					<option value="PT">Portugal</option>
					<option value="PR">Puerto Rico</option>
					<option value="QA">Qatar</option>
					<option value="ME">Republic of Montenegro</option>
					<option value="RS">Republic of Serbia</option>
					<option value="RE">Reunion</option>
					<option value="RO">Romania</option>
					<option value="RU">Russia</option>
					<option value="RW">Rwanda</option>
					<option value="NT">St Barthelemy</option>
					<option value="EU">St Eustatius</option>
					<option value="HE">St Helena</option>
					<option value="KN">St Kitts-Nevis</option>
					<option value="LC">St Lucia</option>
					<option value="MB">St Maarten</option>
					<option value="PM">St Pierre &amp; Miquelon</option>
					<option value="VC">St Vincent &amp; Grenadines</option>
					<option value="SP">Saipan</option>
					<option value="SO">Samoa</option>
					<option value="AS">Samoa American</option>
					<option value="SM">San Marino</option>
					<option value="ST">Sao Tome &amp; Principe</option>
					<option value="SA">Saudi Arabia</option>
					<option value="SN">Senegal</option>
					<option value="SC">Seychelles</option>
					<option value="SL">Sierra Leone</option>
					<option value="SG">Singapore</option>
					<option value="SK">Slovakia</option>
					<option value="SI">Slovenia</option>
					<option value="SB">Solomon Islands</option>
					<option value="OI">Somalia</option>
					<option value="ZA">South Africa</option>
					<option value="ES">Spain</option>
					<option value="LK">Sri Lanka</option>
					<option value="SD">Sudan</option>
					<option value="SR">Suriname</option>
					<option value="SZ">Swaziland</option>
					<option value="SE">Sweden</option>
					<option value="CH">Switzerland</option>
					<option value="SY">Syria</option>
					<option value="TA">Tahiti</option>
					<option value="TW">Taiwan</option>
					<option value="TJ">Tajikistan</option>
					<option value="TZ">Tanzania</option>
					<option value="TH">Thailand</option>
					<option value="TG">Togo</option>
					<option value="TK">Tokelau</option>
					<option value="TO">Tonga</option>
					<option value="TT">Trinidad &amp; Tobago</option>
					<option value="TN">Tunisia</option>
					<option value="TR">Turkey</option>
					<option value="TU">Turkmenistan</option>
					<option value="TC">Turks &amp; Caicos Is</option>
					<option value="TV">Tuvalu</option>
					<option value="UG">Uganda</option>
					<option value="UA">Ukraine</option>
					<option value="AE">United Arab Emirates</option>
					<option value="GB">United Kingdom</option>
					<option value="US">United States of America</option>
					<option value="UY">Uruguay</option>
					<option value="UZ">Uzbekistan</option>
					<option value="VU">Vanuatu</option>
					<option value="VS">Vatican City State</option>
					<option value="VE">Venezuela</option>
					<option value="VN">Vietnam</option>
					<option value="VB">Virgin Islands (Brit)</option>
					<option value="VA">Virgin Islands (USA)</option>
					<option value="WK">Wake Island</option>
					<option value="WF">Wallis &amp; Futana Is</option>
					<option value="YE">Yemen</option>
					<option value="ZR">Zaire</option>
					<option value="ZM">Zambia</option>
					<option value="ZW">Zimbabwe</option>
				</select>
				<span class="help-inline" id="conError"></span>
			</div>
		</div>

		<div class="control-group">
			<s:label for="input01" key="lbl.header.admin.cust.state" cssClass="control-label labelbold" theme="simple"/>
			<div class="controls">
				<input id="input01" placeholder="State" class="input-xlarge"
					type="text">
			</div>
		</div>

		<div class="control-group" id= "zipControl">
			<s:label for="input01" key="lbl.header.admin.cust.zipecode" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<input id="input01" placeholder="Zipcode" class="input-xlarge"
					type="text" name="zipcode">
					<span class="help-inline" id="zipError"></span>
			</div>
		</div>

		<div class="control-group" id= "numControl">
			<s:label for="input01" key="lbl.header.admin.cust.cont" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<input id="input01" placeholder="Contact Number"
					class="input-xlarge" type="text" name="number">
					<span class="help-inline" id="numError"></span>
			</div>
		</div>

		<div class="control-group" id= "faxControl">
			<s:label for="input01" key="lbl.header.admin.cust.fax" cssClass="control-label labelbold" theme="simple"/>
			<span class="mandatory">*</span>
			<div class="controls">
				<input id="input01" placeholder="Fax Number" class="input-xlarge"
					type="number" name="fax">
					<span class="help-inline" id="faxError"></span>
			</div>
		</div>

		<div class="control-group">
		<s:label for="input01" key="lbl.header.admin.cust.hlptxt" cssClass="control-label labelbold" theme="simple"/>
			<div class="controls">
				<input id="input01" placeholder="Help text" class="input-xlarge"
					type="text">
			</div>
		</div>

		<div class="control-group" id="licenControl">
		<s:label for="input01" key="lbl.header.admin.cust.linctype" cssClass="control-label labelbold" theme="simple"/>
		<span class="mandatory">*</span>
			<div class="controls">
				<select id="select01" name="licence">
					<option value="">- select -</option>
					<option value="GD">Gold</option>
					<option value="PN">Platinum</option>
					<option value="SL">silver</option>
				</select>
				<span class="help-inline" id="licenError"></span>
			</div>
		</div>

		<div class="control-group">
		<s:label for="input01" key="lbl.header.admin.cust.Vlddatefrom" cssClass="control-label labelbold" theme="simple"/>
			<div class="controls">
				<input id="fromdate" class="datealign" type="text" value="">

			</div>
		</div>

		<div class="control-group">
		<s:label for="input01" key="lbl.header.admin.cust.vlddateto" cssClass="control-label labelbold" theme="simple"/>
			<div class="controls">
				<input id="todate" class="datealign" type="text" value="">

			</div>
		</div>

		<div class="control-group">
		<s:label for="input01" key="lbl.header.admin.cust.url" cssClass="control-label labelbold" theme="simple"/>
			<div class="controls">
				<input id="repUrl" class="datealign" type="text" value="">
			</div>
		</div>

	</div>

	<div class="bottom_button">
		<input type="button" id="customerSave" class="btn btn-primary" onclick="loadContent('customerSave', $('#subcontainer'));" value="<s:text name='lbl.header.comp.save'/>"/>
		<input type="button" id="customerCancel" class="btn btn-primary" onclick="loadContent('customerCancel', $('#subcontainer'));" value="<s:text name='lbl.header.comp.cancel'/>"/>
	</div>
</form>