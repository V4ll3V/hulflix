<%@ page import="hulflix.Playlist" %>



<div class="fieldcontain ${hasErrors(bean: playlistInstance, field: 'playlistName', 'error')} ">
	<label for="playlistName">
		<g:message code="playlist.playlistName.label" default="Playlist Name" />
		
	</label>
	<g:textField name="playlistName" maxlength="45" value="${playlistInstance?.playlistName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playlistInstance, field: 'playlistentry', 'error')} ">
	<label for="playlistentry">
		<g:message code="playlist.playlistentry.label" default="Playlistentry" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${playlistInstance?.playlistentry?}" var="p">
    <li><g:link controller="playlistentry" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="playlistentry" action="create" params="['playlist.id': playlistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'playlistentry.label', default: 'Playlistentry')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: playlistInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="playlist.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${hulflix.User.list()}" optionKey="id" required="" value="${playlistInstance?.user?.id}" class="many-to-one"/>
</div>

