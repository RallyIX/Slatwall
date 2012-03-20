<!---

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

--->
<cfif thisTag.executionMode is "start">
	<cfparam name="attributes.object" type="any" />
	<cfparam name="attributes.saveaction" type="string" default="#request.context.saveaction#" />
	<cfparam name="attributes.edit" type="boolean" default="false" />
	
	<cfif attributes.edit>
		<cfoutput>
			<form method="post" action="?update=1">
				<input type="hidden" name="slatAction" value="#attributes.saveaction#" />
				<input type="hidden" name="#attributes.object.getPrimaryIDPropertyName()#" value="#attributes.object.getPrimaryIDValue()#" />
				<cfif structKeyExists(request.context, "modal") and request.context.modal>
					<div class="modal-header">
						<cfset pageTitle = request.context.$.slatwall.rbKey(replace(request.context.slatAction,':','.','all')) />
						<cfif right(pageTitle, 8) eq "_missing">
							<cfif left(listLast(request.context.slatAction, "."), 4) eq "list">
								<cfset pageTitle = replace(request.context.$.slatwall.rbKey('admin.define.list'), "${itemEntityName}", request.context.$.slatwall.rbKey('entity.#request.context.itemEntityName#')) />
							<cfelseif left(listLast(request.context.slatAction, "."), 4) eq "edit">
								<cfset pageTitle = replace(request.context.$.slatwall.rbKey('admin.define.edit'), "${itemEntityName}", request.context.$.slatwall.rbKey('entity.#request.context.itemEntityName#')) />
							<cfelseif left(listLast(request.context.slatAction, "."), 6) eq "create">
								<cfset pageTitle = replace(request.context.$.slatwall.rbKey('admin.define.create'), "${itemEntityName}", request.context.$.slatwall.rbKey('entity.#request.context.itemEntityName#')) />
							<cfelseif left(listLast(request.context.slatAction, "."), 6) eq "detail">
								<cfset pageTitle = replace(request.context.$.slatwall.rbKey('admin.define.detail'), "${itemEntityName}", request.context.$.slatwall.rbKey('entity.#request.context.itemEntityName#')) />
							</cfif>
						</cfif>
						<a class="close" data-dismiss="modal">x</a>
						<h3>#pageTitle#</h3>
					</div>
					<div class="modal-body">
				</cfif>
		</cfoutput>
	</cfif>
<cfelse>
	<cfif attributes.edit>
		<cfoutput>
				<cfif structKeyExists(request.context, "modal") and request.context.modal>
					</div>
					<div class="modal-footer">
						<div class="btn-group">
							<a href="##" class="btn close" data-dismiss="modal">#request.context.$.slatwall.rbKey('define.cancel')#</a>
							<button type="submit" class="btn btn-success">#request.context.$.slatwall.rbKey('define.save')#</button>
						</div>
					</div>
				</cfif>
			</form>
		</cfoutput>
	</cfif>
</cfif>