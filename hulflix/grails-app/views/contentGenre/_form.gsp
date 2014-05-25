<%@ page import="hulflix.ContentGenre" %>



<div class="fieldcontain ${hasErrors(bean: contentGenreInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="contentGenre.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="content" name="content.id" from="${hulflix.Content.list()}" optionKey="id" required="" value="${contentGenreInstance?.content?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentGenreInstance, field: 'genre', 'error')} required">
	<label for="genre">
		<g:message code="contentGenre.genre.label" default="Genre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="genre" name="genre.id" from="${hulflix.Genre.list()}" optionKey="id" required="" value="${contentGenreInstance?.genre?.id}" class="many-to-one"/>
</div>

