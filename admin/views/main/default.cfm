<!---

    Slatwall - An Open Source eCommerce Platform
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

--->
<cfparam name="rc.orderSmartList" type="any" />
<cfparam name="rc.productSmartList" type="any" />
<cfparam name="rc.productReviewSmartList" type="any" />
<cfparam name="rc.vendorOrderSmartList" type="any" />

<cfoutput>
	<cf_HibachiMessageDisplay />
	
	<div class="row-fluid">
		<div class="span6">
			<h5>#request.slatwallScope.rbKey("admin.main.dashboard.neworders")#</h5>
			<cf_HibachiListingDisplay smartList="#rc.orderSmartList#" 
					recordDetailAction="admin:entity.detailorder">
				<cf_HibachiListingColumn propertyIdentifier="orderNumber" />
				<cf_HibachiListingColumn tdclass="primary" propertyIdentifier="account.fullName" />
				<cf_HibachiListingColumn propertyIdentifier="orderOpenDateTime" />
				<cf_HibachiListingColumn propertyIdentifier="calculatedTotal" />
			</cf_HibachiListingDisplay>
		</div>
		<div class="span6">
			<h5>#request.slatwallScope.rbKey("admin.main.dashboard.recentproductupdates")#</h5>
			<cf_HibachiListingDisplay smartList="#rc.productSmartList#" 
					recordDetailAction="admin:entity.detailproduct">
				<cf_HibachiListingColumn propertyIdentifier="brand.brandName" />
				<cf_HibachiListingColumn tdclass="primary" propertyIdentifier="productName" />
				<cf_HibachiListingColumn propertyIdentifier="modifiedDateTime" />
				<cf_HibachiListingColumn propertyIdentifier="modifiedByAccount.fullname" />
			</cf_HibachiListingDisplay>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<h5>#request.slatwallScope.rbKey("admin.main.dashboard.recentvendororderupdates")#</h5>
			<cf_HibachiListingDisplay smartList="#rc.vendorOrderSmartList#" 
					recordDetailAction="admin:entity.detailvendororder">
				<cf_HibachiListingColumn propertyIdentifier="vendorOrderNumber" />
				<cf_HibachiListingColumn tdclass="primary" propertyIdentifier="vendor.vendorName" />
				<cf_HibachiListingColumn propertyIdentifier="modifiedDateTime" />
				<cf_HibachiListingColumn propertyIdentifier="modifiedByAccount.fullname" />
			</cf_HibachiListingDisplay>
		</div>
		<div class="span6">
			<h5>#request.slatwallScope.rbKey("admin.main.dashboard.recentproductreviews")#</h5>
			<cf_HibachiListingDisplay smartList="#rc.productReviewSmartList#" 
					recordDetailAction="admin:entity.detailproductreview">
				<cf_HibachiListingColumn tdclass="primary" propertyIdentifier="product.calculatedTitle" />
				<cf_HibachiListingColumn propertyIdentifier="reviewerName" />
				<cf_HibachiListingColumn propertyIdentifier="reviewTitle" />
			</cf_HibachiListingDisplay>
		</div>
	</div>
</cfoutput>