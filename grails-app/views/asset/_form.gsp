<%@ page import="inventory.Asset" %>



<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'assetCategory', 'error')} required">
	<label for="assetCategory">
		<g:message code="asset.assetCategory.label" default="Asset Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assetCategory" name="assetCategory.id" from="${inventory.AssetCategory.list()}" optionKey="id" required="" value="${assetInstance?.assetCategory?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'make', 'error')} required">
	<label for="make">
		<g:message code="asset.make.label" default="Make" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="make" required="" value="${assetInstance?.make}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'model', 'error')} required">
	<label for="model">
		<g:message code="asset.model.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="model" required="" value="${assetInstance?.model}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'serialNumber', 'error')} ">
	<label for="serialNumber">
		<g:message code="asset.serialNumber.label" default="Serial Number" />
		
	</label>
	<g:textField name="serialNumber" value="${assetInstance?.serialNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'details', 'error')} ">
	<label for="details">
		<g:message code="asset.details.label" default="Details" />
		
	</label>
	<g:textField name="details" value="${assetInstance?.details}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'assetTag', 'error')} ">
	<label for="assetTag">
		<g:message code="asset.assetTag.label" default="Asset Tag" />
		
	</label>
	<g:textField name="assetTag" value="${assetInstance?.assetTag}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'aquired', 'error')} ">
	<label for="aquired">
		<g:message code="asset.aquired.label" default="Aquired" />
		
	</label>
	<g:datePicker name="aquired" precision="day"  value="${assetInstance?.aquired}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="asset.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${inventory.Status.list()}" optionKey="id" required="" value="${assetInstance?.status?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="asset.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${inventory.Department.list()}" optionKey="id" required="" value="${assetInstance?.department?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'employee', 'error')} ">
	<label for="employee">
		<g:message code="asset.employee.label" default="Employee" />
		
	</label>
	<g:select id="employee" name="employee.id" from="${inventory.Employee.list()}" optionKey="id" value="${assetInstance?.employee?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'sold', 'error')} ">
	<label for="sold">
		<g:message code="asset.sold.label" default="Sold" />
		
	</label>
	<g:datePicker name="sold" precision="day"  value="${assetInstance?.sold}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'purchasePrice', 'error')} required">
	<label for="purchasePrice">
		<g:message code="asset.purchasePrice.label" default="Purchase Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="purchasePrice" step="0.01" required="" value="${assetInstance.purchasePrice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'expectedLife', 'error')} required">
	<label for="expectedLife">
		<g:message code="asset.expectedLife.label" default="Expected Life" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="expectedLife" required="" value="${assetInstance.expectedLife}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'currentValue', 'error')} required">
	<label for="currentValue">
		<g:message code="asset.currentValue.label" default="Current Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="currentValue" step="0.01" required="" value="${assetInstance.currentValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="asset.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${assetInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'nextScheduledMaintenance', 'error')} ">
	<label for="nextScheduledMaintenance">
		<g:message code="asset.nextScheduledMaintenance.label" default="Next Scheduled Maintenance" />
		
	</label>
	<g:datePicker name="nextScheduledMaintenance" precision="day"  value="${assetInstance?.nextScheduledMaintenance}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'salvageValue', 'error')} required">
	<label for="salvageValue">
		<g:message code="asset.salvageValue.label" default="Salvage Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="salvageValue" step="any" required="" value="${assetInstance.salvageValue}"/>
</div>

