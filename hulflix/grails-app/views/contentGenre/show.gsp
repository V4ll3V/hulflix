
<%@ page import="hulflix.ContentGenre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentGenre.label', default: 'ContentGenre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contentGenre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contentGenre" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contentGenre">
			
				<g:if test="${contentGenreInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="contentGenre.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:link controller="content" action="show" id="${contentGenreInstance?.content?.id}">${contentGenreInstance?.content?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentGenreInstance?.genre}">
				<li class="fieldcontain">
					<span id="genre-label" class="property-label"><g:message code="contentGenre.genre.label" default="Genre" /></span>
					
						<span class="property-value" aria-labelledby="genre-label"><g:link controller="genre" action="show" id="${contentGenreInstance?.genre?.id}">${contentGenreInstance?.genre?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentGenreInstance?.id}" />
					<g:link class="edit" action="edit" id="${contentGenreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
