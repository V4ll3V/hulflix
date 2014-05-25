
<%@ page import="hulflix.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="contentTitle" title="${message(code: 'content.contentTitle.label', default: 'Content Title')}" />
					
						<g:sortableColumn property="contentDescription" title="${message(code: 'content.contentDescription.label', default: 'Content Description')}" />
					
						<g:sortableColumn property="contentLength" title="${message(code: 'content.contentLength.label', default: 'Content Length')}" />
					
						<g:sortableColumn property="contentPath" title="${message(code: 'content.contentPath.label', default: 'Content Path')}" />
					
						<g:sortableColumn property="contentType" title="${message(code: 'content.contentType.label', default: 'Content Type')}" />
					
						<th><g:message code="content.seasonID.label" default="Season ID" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentInstanceList}" status="i" var="contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean: contentInstance, field: "contentTitle")}</g:link></td>
					
						<td>${fieldValue(bean: contentInstance, field: "contentDescription")}</td>
					
						<td><g:formatDate date="${contentInstance.contentLength}" /></td>
					
						<td>${fieldValue(bean: contentInstance, field: "contentPath")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "contentType")}</td>
					
						<td>${fieldValue(bean: contentInstance, field: "seasonID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
