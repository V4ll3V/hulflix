
<%@ page import="hulflix.Show" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'show.label', default: 'Show')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-show" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-show" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list show">
			
				<g:if test="${showInstance?.showTitle}">
				<li class="fieldcontain">
					<span id="showTitle-label" class="property-label"><g:message code="show.showTitle.label" default="Show Title" /></span>
					
						<span class="property-value" aria-labelledby="showTitle-label"><g:fieldValue bean="${showInstance}" field="showTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${showInstance?.showDescription}">
				<li class="fieldcontain">
					<span id="showDescription-label" class="property-label"><g:message code="show.showDescription.label" default="Show Description" /></span>
					
						<span class="property-value" aria-labelledby="showDescription-label"><g:fieldValue bean="${showInstance}" field="showDescription"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${showInstance?.id}" />
					<g:link class="edit" action="edit" id="${showInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
