<cfif thisTag.executionMode is "start">
	<cfparam name="attributes.propertyIdentifier" type="string" />
	<cfparam name="attributes.title" type="string" default="" />
	<cfparam name="attributes.tdclass" type="string" default="" />
	<cfparam name="attributes.search" type="boolean" default="false" />
	<cfparam name="attributes.sort" type="boolean" default="true" />
	<cfparam name="attributes.filter" type="boolean" default="false" />
	<cfparam name="attributes.range" type="boolean" default="false" />
	
	<cfassociate basetag="cf_HibachiListingDisplay" datacollection="columns">
</cfif>