<%@ page import="hulflix.Season" %>



<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'seasonTitle', 'error')} ">
	<label for="seasonTitle">
		<g:message code="season.seasonTitle.label" default="Season Title" />
		
	</label>
	<g:textField name="seasonTitle" maxlength="45" value="${seasonInstance?.seasonTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'seasonDescription', 'error')} ">
	<label for="seasonDescription">
		<g:message code="season.seasonDescription.label" default="Season Description" />
		
	</label>
	<g:textArea name="seasonDescription" cols="40" rows="5" maxlength="500" value="${seasonInstance?.seasonDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'showID', 'error')} required">
	<label for="showID">
		<g:message code="season.showID.label" default="Show ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="showID" name="showID.id" from="${hulflix.Show.list()}" optionKey="id" required="" value="${seasonInstance?.showID?.id}" class="many-to-one"/>
</div>

