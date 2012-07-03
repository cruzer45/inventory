
<%@ page import="inventory.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'employee.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'employee.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'employee.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="extension" title="${message(code: 'employee.extension.label', default: 'Extension')}" />
					
						<g:sortableColumn property="workPhone" title="${message(code: 'employee.workPhone.label', default: 'Work Phone')}" />
					
						<g:sortableColumn property="officeLocation" title="${message(code: 'employee.officeLocation.label', default: 'Office Location')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "extension")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "workPhone")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "officeLocation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
