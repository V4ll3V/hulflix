
<%@ page import="hulflix.Season" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'season.label', default: 'Season')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-season" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-season" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="seasonTitle" title="${message(code: 'season.seasonTitle.label', default: 'Season Title')}" />
					
						<g:sortableColumn property="seasonDescription" title="${message(code: 'season.seasonDescription.label', default: 'Season Description')}" />
					
						<th><g:message code="season.showID.label" default="Show ID" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${seasonInstanceList}" status="i" var="seasonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${seasonInstance.id}">${fieldValue(bean: seasonInstance, field: "seasonTitle")}</g:link></td>
					
						<td>${fieldValue(bean: seasonInstance, field: "seasonDescription")}</td>
					
						<td>${fieldValue(bean: seasonInstance, field: "showID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${seasonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
