<%@ page import="hulflix.Playlistentry" %>



<div class="fieldcontain ${hasErrors(bean: playlistentryInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="playlistentry.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="content" name="content.id" from="${hulflix.Content.list()}" optionKey="id" required="" value="${playlistentryInstance?.content?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playlistentryInstance, field: 'playlist', 'error')} required">
	<label for="playlist">
		<g:message code="playlistentry.playlist.label" default="Playlist" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="playlist" name="playlist.id" from="${hulflix.Playlist.list()}" optionKey="id" required="" value="${playlistentryInstance?.playlist?.id}" class="many-to-one"/>
</div>

