<%@ page import="inventory.Maintenance" %>



<div class="fieldcontain ${hasErrors(bean: maintenanceInstance, field: 'asset', 'error')} required">
	<label for="asset">
		<g:message code="maintenance.asset.label" default="Asset" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asset" name="asset.id" from="${inventory.Asset.list()}" optionKey="id" required="" value="${maintenanceInstance?.asset?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maintenanceInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="maintenance.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${maintenanceInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: maintenanceInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="maintenance.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${maintenanceInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maintenanceInstance, field: 'performedBy', 'error')} ">
	<label for="performedBy">
		<g:message code="maintenance.performedBy.label" default="Performed By" />
		
	</label>
	<g:textField name="performedBy" value="${maintenanceInstance?.performedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maintenanceInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="maintenance.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cost" step="any" required="" value="${maintenanceInstance.cost}"/>
</div>

