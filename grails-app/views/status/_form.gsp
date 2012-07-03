<%@ page import="inventory.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="status.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${statusInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'deleted', 'error')} ">
	<label for="deleted">
		<g:message code="status.deleted.label" default="Deleted" />
		
	</label>
	<g:checkBox name="deleted" value="${statusInstance?.deleted}" />
</div>

