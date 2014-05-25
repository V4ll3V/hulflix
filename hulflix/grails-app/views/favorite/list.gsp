
<%@ page import="hulflix.Favorite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'favorite.label', default: 'Favorite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-favorite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-favorite" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="favorite.genre.label" default="Genre" /></th>
					
						<th><g:message code="favorite.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${favoriteInstanceList}" status="i" var="favoriteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${favoriteInstance.id}">${fieldValue(bean: favoriteInstance, field: "genre")}</g:link></td>
					
						<td>${fieldValue(bean: favoriteInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${favoriteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
