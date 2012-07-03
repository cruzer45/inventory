
<%@ page import="inventory.Asset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-asset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-asset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list asset">
			
				<g:if test="${assetInstance?.assetCategory}">
				<li class="fieldcontain">
					<span id="assetCategory-label" class="property-label"><g:message code="asset.assetCategory.label" default="Asset Category" /></span>
					
						<span class="property-value" aria-labelledby="assetCategory-label"><g:link controller="assetCategory" action="show" id="${assetInstance?.assetCategory?.id}">${assetInstance?.assetCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.make}">
				<li class="fieldcontain">
					<span id="make-label" class="property-label"><g:message code="asset.make.label" default="Make" /></span>
					
						<span class="property-value" aria-labelledby="make-label"><g:fieldValue bean="${assetInstance}" field="make"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="asset.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${assetInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.serialNumber}">
				<li class="fieldcontain">
					<span id="serialNumber-label" class="property-label"><g:message code="asset.serialNumber.label" default="Serial Number" /></span>
					
						<span class="property-value" aria-labelledby="serialNumber-label"><g:fieldValue bean="${assetInstance}" field="serialNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="asset.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${assetInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.assetTag}">
				<li class="fieldcontain">
					<span id="assetTag-label" class="property-label"><g:message code="asset.assetTag.label" default="Asset Tag" /></span>
					
						<span class="property-value" aria-labelledby="assetTag-label"><g:fieldValue bean="${assetInstance}" field="assetTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.aquired}">
				<li class="fieldcontain">
					<span id="aquired-label" class="property-label"><g:message code="asset.aquired.label" default="Aquired" /></span>
					
						<span class="property-value" aria-labelledby="aquired-label"><g:formatDate date="${assetInstance?.aquired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="asset.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show" id="${assetInstance?.status?.id}">${assetInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="asset.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:link controller="department" action="show" id="${assetInstance?.department?.id}">${assetInstance?.department?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="asset.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${assetInstance?.employee?.id}">${assetInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.sold}">
				<li class="fieldcontain">
					<span id="sold-label" class="property-label"><g:message code="asset.sold.label" default="Sold" /></span>
					
						<span class="property-value" aria-labelledby="sold-label"><g:formatDate date="${assetInstance?.sold}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.purchasePrice}">
				<li class="fieldcontain">
					<span id="purchasePrice-label" class="property-label"><g:message code="asset.purchasePrice.label" default="Purchase Price" /></span>
					
						<span class="property-value" aria-labelledby="purchasePrice-label"><g:fieldValue bean="${assetInstance}" field="purchasePrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.expectedLife}">
				<li class="fieldcontain">
					<span id="expectedLife-label" class="property-label"><g:message code="asset.expectedLife.label" default="Expected Life" /></span>
					
						<span class="property-value" aria-labelledby="expectedLife-label"><g:fieldValue bean="${assetInstance}" field="expectedLife"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.currentValue}">
				<li class="fieldcontain">
					<span id="currentValue-label" class="property-label"><g:message code="asset.currentValue.label" default="Current Value" /></span>
					
						<span class="property-value" aria-labelledby="currentValue-label"><g:fieldValue bean="${assetInstance}" field="currentValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="asset.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${assetInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.nextScheduledMaintenance}">
				<li class="fieldcontain">
					<span id="nextScheduledMaintenance-label" class="property-label"><g:message code="asset.nextScheduledMaintenance.label" default="Next Scheduled Maintenance" /></span>
					
						<span class="property-value" aria-labelledby="nextScheduledMaintenance-label"><g:formatDate date="${assetInstance?.nextScheduledMaintenance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.salvageValue}">
				<li class="fieldcontain">
					<span id="salvageValue-label" class="property-label"><g:message code="asset.salvageValue.label" default="Salvage Value" /></span>
					
						<span class="property-value" aria-labelledby="salvageValue-label"><g:fieldValue bean="${assetInstance}" field="salvageValue"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${assetInstance?.id}" />
					<g:link class="edit" action="edit" id="${assetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
