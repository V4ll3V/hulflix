
<%@ page import="hulflix.Season" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'season.label', default: 'Season')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-season" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-season" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list season">
			
				<g:if test="${seasonInstance?.seasonTitle}">
				<li class="fieldcontain">
					<span id="seasonTitle-label" class="property-label"><g:message code="season.seasonTitle.label" default="Season Title" /></span>
					
						<span class="property-value" aria-labelledby="seasonTitle-label"><g:fieldValue bean="${seasonInstance}" field="seasonTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seasonInstance?.seasonDescription}">
				<li class="fieldcontain">
					<span id="seasonDescription-label" class="property-label"><g:message code="season.seasonDescription.label" default="Season Description" /></span>
					
						<span class="property-value" aria-labelledby="seasonDescription-label"><g:fieldValue bean="${seasonInstance}" field="seasonDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seasonInstance?.showID}">
				<li class="fieldcontain">
					<span id="showID-label" class="property-label"><g:message code="season.showID.label" default="Show ID" /></span>
					
						<span class="property-value" aria-labelledby="showID-label"><g:link controller="show" action="show" id="${seasonInstance?.showID?.id}">${seasonInstance?.showID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${seasonInstance?.id}" />
					<g:link class="edit" action="edit" id="${seasonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
