<%@ page import="inventory.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="employee.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${employeeInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="employee.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${employeeInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="employee.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${employeeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'extension', 'error')} ">
	<label for="extension">
		<g:message code="employee.extension.label" default="Extension" />
		
	</label>
	<g:textField name="extension" value="${employeeInstance?.extension}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'workPhone', 'error')} ">
	<label for="workPhone">
		<g:message code="employee.workPhone.label" default="Work Phone" />
		
	</label>
	<g:textField name="workPhone" value="${employeeInstance?.workPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'officeLocation', 'error')} ">
	<label for="officeLocation">
		<g:message code="employee.officeLocation.label" default="Office Location" />
		
	</label>
	<g:textField name="officeLocation" value="${employeeInstance?.officeLocation}"/>
</div>

