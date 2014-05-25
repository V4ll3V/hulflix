<%@ page import="hulflix.Favorite" %>



<div class="fieldcontain ${hasErrors(bean: favoriteInstance, field: 'genre', 'error')} required">
	<label for="genre">
		<g:message code="favorite.genre.label" default="Genre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="genre" name="genre.id" from="${hulflix.Genre.list()}" optionKey="id" required="" value="${favoriteInstance?.genre?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: favoriteInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="favorite.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${hulflix.User.list()}" optionKey="id" required="" value="${favoriteInstance?.user?.id}" class="many-to-one"/>
</div>

