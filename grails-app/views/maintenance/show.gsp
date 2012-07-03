
<%@ page import="inventory.Maintenance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maintenance.label', default: 'Maintenance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-maintenance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-maintenance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maintenance">
			
				<g:if test="${maintenanceInstance?.asset}">
				<li class="fieldcontain">
					<span id="asset-label" class="property-label"><g:message code="maintenance.asset.label" default="Asset" /></span>
					
						<span class="property-value" aria-labelledby="asset-label"><g:link controller="asset" action="show" id="${maintenanceInstance?.asset?.id}">${maintenanceInstance?.asset?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maintenanceInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="maintenance.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${maintenanceInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${maintenanceInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="maintenance.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${maintenanceInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maintenanceInstance?.performedBy}">
				<li class="fieldcontain">
					<span id="performedBy-label" class="property-label"><g:message code="maintenance.performedBy.label" default="Performed By" /></span>
					
						<span class="property-value" aria-labelledby="performedBy-label"><g:fieldValue bean="${maintenanceInstance}" field="performedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maintenanceInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="maintenance.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${maintenanceInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${maintenanceInstance?.id}" />
					<g:link class="edit" action="edit" id="${maintenanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
