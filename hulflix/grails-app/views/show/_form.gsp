<%@ page import="hulflix.Show" %>



<div class="fieldcontain ${hasErrors(bean: showInstance, field: 'showTitle', 'error')} ">
	<label for="showTitle">
		<g:message code="show.showTitle.label" default="Show Title" />
		
	</label>
	<g:textField name="showTitle" maxlength="45" value="${showInstance?.showTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: showInstance, field: 'showDescription', 'error')} ">
	<label for="showDescription">
		<g:message code="show.showDescription.label" default="Show Description" />
		
	</label>
	<g:textArea name="showDescription" cols="40" rows="5" maxlength="500" value="${showInstance?.showDescription}"/>
</div>

