/*
    Slatwall - An e-commerce plugin for Mura CMS
    Copyright (C) 2011 ten24, LLC

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
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

*/
component displayname="AccountLoyalty" entityname="SlatwallAccountLoyalty" table="SlatwallAccountLoyalty" persistent="true"  extends="HibachiEntity" cacheuse="transactional" hb_serviceName="loyaltyService" hb_permission="this" {
	
	// Persistent Properties
	property name="accountLoyaltyID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="accountLoyaltyNumber" ormtype="string";

	// Related Entities
	property name="loyalty" cfc="loyalty" fieldtype="many-to-one" fkcolumn="loyaltyID";
	property name="account" cfc="Account" fieldtype="many-to-one" fkcolumn="accountID";
	
	// Audit Properties
	property name="createdDateTime" ormtype="timestamp";
	property name="createdByAccount" cfc="Account" fieldtype="many-to-one" fkcolumn="createdByAccountID";
	property name="modifiedDateTime" ormtype="timestamp";
	property name="modifiedByAccount" cfc="Account" fieldtype="many-to-one" fkcolumn="modifiedByAccountID";
	
	// Non-Persistent Properties

	
	// ============ START: Non-Persistent Property Methods =================
	
	// ============  END:  Non-Persistent Property Methods =================
		
	// ============= START: Bidirectional Helper Methods ===================
	
	// Account (many-to-one)
	public void function setAccount(required any account) {
		variables.account = arguments.account;
		if(isNew() or !arguments.account.hasAccountLoyalty( this )) {
			arrayAppend(arguments.account.getAccountLoyalties(), this);
		}
	}
	public void function removeAccount(any account) {
		if(!structKeyExists(arguments, "account")) {
			arguments.account = variables.account;
		}
		var index = arrayFind(arguments.account.getAccountLoyalty(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.account.getAccountLoyalty(), index);
		}
		structDelete(variables, "account");
	}
	
	// Loyalty (many-to-one)    	
	public void function setLoyalty(required any promotion) {    
		variables.loyalty = arguments.loyalty;    
		if(isNew() or !arguments.loyalty.hasLoyaltyAccount( this )) {    
			arrayAppend(arguments.loyalty.getLoyaltyAccounts(), this);    
		}    
	}  
	 
	public void function removeLoyalty(any loyalty) {    
		if(!structKeyExists(arguments, "loyalty")) {    
			arguments.loyalty = variables.loyalty;    
		}    
		var index = arrayFind(arguments.loyalty.getLoyaltyAccounts(), this);    
		if(index > 0) {    
			arrayDeleteAt(arguments.account.getLoyaltyAccounts(), index);    
		}    
		structDelete(variables, "loyalty");    
	}
	
	// =============  END:  Bidirectional Helper Methods ===================

	// =============== START: Custom Validation Methods ====================
	
	// ===============  END: Custom Validation Methods =====================
	
	// =============== START: Custom Formatting Methods ====================
	
	// ===============  END: Custom Formatting Methods =====================
	
	// ============== START: Overridden Implicet Getters ===================
	
	// ==============  END: Overridden Implicet Getters ====================

	// ================== START: Overridden Methods ========================
	
	// ==================  END:  Overridden Methods ========================
	
	// =================== START: ORM Event Hooks  =========================
	
	// ===================  END:  ORM Event Hooks  =========================
	
	// ================== START: Deprecated Methods ========================
	
	// ==================  END:  Deprecated Methods ========================
}