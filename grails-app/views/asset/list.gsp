
<%@ page import="inventory.Asset" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asset" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="asset.assetCategory.label" default="Asset Category" /></th>
					
						<g:sortableColumn property="make" title="${message(code: 'asset.make.label', default: 'Make')}" />
					
						<g:sortableColumn property="model" title="${message(code: 'asset.model.label', default: 'Model')}" />
					
						<g:sortableColumn property="serialNumber" title="${message(code: 'asset.serialNumber.label', default: 'Serial Number')}" />
					
						<g:sortableColumn property="details" title="${message(code: 'asset.details.label', default: 'Details')}" />
					
						<g:sortableColumn property="assetTag" title="${message(code: 'asset.assetTag.label', default: 'Asset Tag')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assetInstanceList}" status="i" var="assetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assetInstance.id}">${fieldValue(bean: assetInstance, field: "assetCategory")}</g:link></td>
					
						<td>${fieldValue(bean: assetInstance, field: "make")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "model")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "serialNumber")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "details")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "assetTag")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
