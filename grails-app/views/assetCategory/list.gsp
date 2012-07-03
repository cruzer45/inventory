
<%@ page import="inventory.AssetCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assetCategory.label', default: 'AssetCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-assetCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-assetCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="category" title="${message(code: 'assetCategory.category.label', default: 'Category')}" />
					
						<g:sortableColumn property="deleted" title="${message(code: 'assetCategory.deleted.label', default: 'Deleted')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assetCategoryInstanceList}" status="i" var="assetCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assetCategoryInstance.id}">${fieldValue(bean: assetCategoryInstance, field: "category")}</g:link></td>
					
						<td><g:formatBoolean boolean="${assetCategoryInstance.deleted}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assetCategoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
