<%@ page import="inventory.AssetCategory" %>



<div class="fieldcontain ${hasErrors(bean: assetCategoryInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="assetCategory.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="category" required="" value="${assetCategoryInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetCategoryInstance, field: 'deleted', 'error')} ">
	<label for="deleted">
		<g:message code="assetCategory.deleted.label" default="Deleted" />
		
	</label>
	<g:checkBox name="deleted" value="${assetCategoryInstance?.deleted}" />
</div>

