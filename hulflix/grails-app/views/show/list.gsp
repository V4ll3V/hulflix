
<%@ page import="hulflix.Show" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'show.label', default: 'Show')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-show" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-show" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="showTitle" title="${message(code: 'show.showTitle.label', default: 'Show Title')}" />
					
						<g:sortableColumn property="showDescription" title="${message(code: 'show.showDescription.label', default: 'Show Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${showInstanceList}" status="i" var="showInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${showInstance.id}">${fieldValue(bean: showInstance, field: "showTitle")}</g:link></td>
					
						<td>${fieldValue(bean: showInstance, field: "showDescription")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${showInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
