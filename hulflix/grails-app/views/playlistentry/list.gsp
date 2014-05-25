
<%@ page import="hulflix.Playlistentry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'playlistentry.label', default: 'Playlistentry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-playlistentry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-playlistentry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="playlistentry.content.label" default="Content" /></th>
					
						<th><g:message code="playlistentry.playlist.label" default="Playlist" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${playlistentryInstanceList}" status="i" var="playlistentryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${playlistentryInstance.id}">${fieldValue(bean: playlistentryInstance, field: "content")}</g:link></td>
					
						<td>${fieldValue(bean: playlistentryInstance, field: "playlist")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${playlistentryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
