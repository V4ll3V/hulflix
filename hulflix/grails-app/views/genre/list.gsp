
<%@ page import="hulflix.Genre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'genre.label', default: 'Genre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-genre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-genre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="genreName" title="${message(code: 'genre.genreName.label', default: 'Genre Name')}" />
					
						<g:sortableColumn property="genreDescription" title="${message(code: 'genre.genreDescription.label', default: 'Genre Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${genreInstanceList}" status="i" var="genreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${genreInstance.id}">${fieldValue(bean: genreInstance, field: "genreName")}</g:link></td>
					
						<td>${fieldValue(bean: genreInstance, field: "genreDescription")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${genreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
