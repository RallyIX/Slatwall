/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC
	
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
	
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
	
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
	
    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your 
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms 
    of your choice, provided that you follow these specific guidelines: 

	- You also meet the terms and conditions of the license of each 
	  independent module 
	- You must not alter the default display of the Slatwall name or logo from  
	  any part of the application 
	- Your custom code must not alter or create any files inside Slatwall, 
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets 
	the above guidelines as a combined work under the terms of GPL for this program, 
	provided that you include the source code of that other code when and as the 
	GNU GPL requires distribution of source code.
    
    If you modify this program, you may extend this exception to your version 
    of the program, but you are not obligated to do so.

Notes:

*/
component output="false" accessors="true" extends="HibachiProcess" {
	
	// Injected Entity
	property name="orderPayment";
	
	// Data Properties
	property name="amount";
	property name="transactionType" hb_formFieldType="select";
	
	// Option Properties
	property name="transactionTypeOptions";
	
	public array function getTransactionTypeOptions() {
		if(!structKeyExists(variables, "transactionTypeOptions")) {
			
			variables.transactionTypeOptions = [];
			
			if(getOrderPayment().getPaymentMethod().getPaymentMethodType() eq "creditCard") {
				arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.credit'), value="credit"});
				if(getOrderPayment().getOrderPaymentType().getSystemCode() eq "optCharge") {
					if(getOrderPayment().getAmountAuthorized() gt getOrderPayment().getAmountReceived()) {
						arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.chargePreAuthorization'), value="chargePreAuthorization"});	
					}
					if(getOrderPayment().getCreditCardOrProviderTokenExistsFlag()) {
						arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.authorizeAndCharge'), value="authorizeAndCharge"});
						arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.authorize'), value="authorize"});
						arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.generateToken'), value="generateToken"});	
					}
				}
			} else {
				arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.credit'), value="credit"});
				arrayAppend(variables.transactionTypeOptions, {name=rbKey('define.receive'), value="receive"});
			}
			
		}
		return variables.transactionTypeOptions;
	}
	
	public string function getTransactionType() {
		if(!structKeyExists(variables, "transactionType")) {
			if(getOrderPayment().getOrderPaymentType().getSystemCode() eq "optCharge") {
				variables.transactionType = 'receive';
				if(getOrderPayment().getPaymentMethod().getPaymentMethodType() eq "creditCard" && getOrderPayment().getAmountAuthorized() gt getOrderPayment().getAmountReceived()) {
					variables.transactionType = 'chargePreAuthorization';
				} else if (getOrderPayment().getPaymentMethod().getPaymentMethodType() eq "creditCard" && getOrderPayment().getAmountReceived() lt getAmount()) {
					variables.transactionType = 'authorizeAndCharge';
				} else if (getOrderPayment().getPaymentMethod().getPaymentMethodType() eq "creditCard" && getOrderPayment().getAmountReceived() gt getAmount()) {
					variables.transactionType = 'credit';
				}
			} else if (getOrderPayment().getOrderPaymentType().getSystemCode() eq "optCredit") {
				variables.transactionType = 'credit';
			}
		}
		return variables.transactionType;
	}
	
	public numeric function getAmount() {
		if(!structKeyExists(variables, "amount")) {
			if(!isNull(getTransactionType()) && listFindNoCase("receive,authorizeAndCharge,chargePreAuthorization", getTransactionType())) {
				variables.amount = getOrderPayment().getAmountUnreceived();
			} else if (!isNull(getTransactionType()) && listFindNoCase("credit", getTransactionType())) {
				variables.amount = getOrderPayment().getAmountUncredited();
			} else {
				variables.amount = 0;
			}
		}
		return variables.amount;
	}
	
}
