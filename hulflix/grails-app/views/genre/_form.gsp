<%@ page import="hulflix.Genre" %>



<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'genreName', 'error')} ">
	<label for="genreName">
		<g:message code="genre.genreName.label" default="Genre Name" />
		
	</label>
	<g:textField name="genreName" maxlength="45" value="${genreInstance?.genreName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'genreDescription', 'error')} ">
	<label for="genreDescription">
		<g:message code="genre.genreDescription.label" default="Genre Description" />
		
	</label>
	<g:textField name="genreDescription" maxlength="45" value="${genreInstance?.genreDescription}"/>
</div>

