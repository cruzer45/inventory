
<%@ page import="inventory.Maintenance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maintenance.label', default: 'Maintenance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maintenance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-maintenance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="maintenance.asset.label" default="Asset" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'maintenance.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'maintenance.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="performedBy" title="${message(code: 'maintenance.performedBy.label', default: 'Performed By')}" />
					
						<g:sortableColumn property="cost" title="${message(code: 'maintenance.cost.label', default: 'Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maintenanceInstanceList}" status="i" var="maintenanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maintenanceInstance.id}">${fieldValue(bean: maintenanceInstance, field: "asset")}</g:link></td>
					
						<td><g:formatDate date="${maintenanceInstance.date}" /></td>
					
						<td>${fieldValue(bean: maintenanceInstance, field: "notes")}</td>
					
						<td>${fieldValue(bean: maintenanceInstance, field: "performedBy")}</td>
					
						<td>${fieldValue(bean: maintenanceInstance, field: "cost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maintenanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
