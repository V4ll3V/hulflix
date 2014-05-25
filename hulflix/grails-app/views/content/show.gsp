
<%@ page import="hulflix.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list content">
			
				<g:if test="${contentInstance?.contentTitle}">
				<li class="fieldcontain">
					<span id="contentTitle-label" class="property-label"><g:message code="content.contentTitle.label" default="Content Title" /></span>
					
						<span class="property-value" aria-labelledby="contentTitle-label"><g:fieldValue bean="${contentInstance}" field="contentTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.contentDescription}">
				<li class="fieldcontain">
					<span id="contentDescription-label" class="property-label"><g:message code="content.contentDescription.label" default="Content Description" /></span>
					
						<span class="property-value" aria-labelledby="contentDescription-label"><g:fieldValue bean="${contentInstance}" field="contentDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.contentLength}">
				<li class="fieldcontain">
					<span id="contentLength-label" class="property-label"><g:message code="content.contentLength.label" default="Content Length" /></span>
					
						<span class="property-value" aria-labelledby="contentLength-label"><g:formatDate date="${contentInstance?.contentLength}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.contentPath}">
				<li class="fieldcontain">
					<span id="contentPath-label" class="property-label"><g:message code="content.contentPath.label" default="Content Path" /></span>
					
						<span class="property-value" aria-labelledby="contentPath-label"><g:fieldValue bean="${contentInstance}" field="contentPath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.contentType}">
				<li class="fieldcontain">
					<span id="contentType-label" class="property-label"><g:message code="content.contentType.label" default="Content Type" /></span>
					
						<span class="property-value" aria-labelledby="contentType-label"><g:fieldValue bean="${contentInstance}" field="contentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.seasonID}">
				<li class="fieldcontain">
					<span id="seasonID-label" class="property-label"><g:message code="content.seasonID.label" default="Season ID" /></span>
					
						<span class="property-value" aria-labelledby="seasonID-label"><g:link controller="season" action="show" id="${contentInstance?.seasonID?.id}">${contentInstance?.seasonID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.contentGenre}">
				<li class="fieldcontain">
					<span id="contentGenre-label" class="property-label"><g:message code="content.contentGenre.label" default="Content Genre" /></span>
					
						<g:each in="${contentInstance.contentGenre}" var="c">
						<span class="property-value" aria-labelledby="contentGenre-label"><g:link controller="contentGenre" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.contentPicture}">
				<li class="fieldcontain">
					<span id="contentPicture-label" class="property-label"><g:message code="content.contentPicture.label" default="Content Picture" /></span>
					
						<span class="property-value" aria-labelledby="contentPicture-label"><g:fieldValue bean="${contentInstance}" field="contentPicture"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentInstance?.id}" />
					<g:link class="edit" action="edit" id="${contentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
