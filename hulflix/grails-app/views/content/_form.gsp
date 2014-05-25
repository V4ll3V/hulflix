<%@ page import="hulflix.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentTitle', 'error')} ">
	<label for="contentTitle">
		<g:message code="content.contentTitle.label" default="Content Title" />
		
	</label>
	<g:textField name="contentTitle" maxlength="45" value="${contentInstance?.contentTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentDescription', 'error')} ">
	<label for="contentDescription">
		<g:message code="content.contentDescription.label" default="Content Description" />
		
	</label>
	<g:textArea name="contentDescription" cols="40" rows="5" maxlength="500" value="${contentInstance?.contentDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentLength', 'error')} required">
	<label for="contentLength">
		<g:message code="content.contentLength.label" default="Content Length" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="contentLength" precision="minute"  value="${contentInstance?.contentLength}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentPath', 'error')} ">
	<label for="contentPath">
		<g:message code="content.contentPath.label" default="Content Path" />
		
	</label>
	<g:textField name="contentPath" maxlength="45" value="${contentInstance?.contentPath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentType', 'error')} ">
	<label for="contentType">
		<g:message code="content.contentType.label" default="Content Type" />
		
	</label>
	<g:textField name="contentType" maxlength="45" value="${contentInstance?.contentType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'seasonID', 'error')} required">
	<label for="seasonID">
		<g:message code="content.seasonID.label" default="Season ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seasonID" name="seasonID.id" from="${hulflix.Season.list()}" optionKey="id" required="" value="${contentInstance?.seasonID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentGenre', 'error')} ">
	<label for="contentGenre">
		<g:message code="content.contentGenre.label" default="Content Genre" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contentInstance?.contentGenre?}" var="c">
    <li><g:link controller="contentGenre" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contentGenre" action="create" params="['content.id': contentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contentGenre.label', default: 'ContentGenre')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'contentPicture', 'error')} ">
	<label for="contentPicture">
		<g:message code="content.contentPicture.label" default="Content Picture" />
		
	</label>
	<g:textField name="contentPicture" value="${contentInstance?.contentPicture}"/>
</div>

