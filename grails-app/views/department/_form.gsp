<%@ page import="inventory.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="department.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="department" required="" value="${departmentInstance?.department}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'deleted', 'error')} ">
	<label for="deleted">
		<g:message code="department.deleted.label" default="Deleted" />
		
	</label>
	<g:checkBox name="deleted" value="${departmentInstance?.deleted}" />
</div>

