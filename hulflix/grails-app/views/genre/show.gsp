
<%@ page import="hulflix.Genre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'genre.label', default: 'Genre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-genre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-genre" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list genre">
			
				<g:if test="${genreInstance?.genreName}">
				<li class="fieldcontain">
					<span id="genreName-label" class="property-label"><g:message code="genre.genreName.label" default="Genre Name" /></span>
					
						<span class="property-value" aria-labelledby="genreName-label"><g:fieldValue bean="${genreInstance}" field="genreName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${genreInstance?.genreDescription}">
				<li class="fieldcontain">
					<span id="genreDescription-label" class="property-label"><g:message code="genre.genreDescription.label" default="Genre Description" /></span>
					
						<span class="property-value" aria-labelledby="genreDescription-label"><g:fieldValue bean="${genreInstance}" field="genreDescription"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${genreInstance?.id}" />
					<g:link class="edit" action="edit" id="${genreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
