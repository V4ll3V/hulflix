<%@ page import="hulflix.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" maxlength="45" value="${userInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'favorite', 'error')} ">
	<label for="favorite">
		<g:message code="user.favorite.label" default="Favorite" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.favorite?}" var="f">
    <li><g:link controller="favorite" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="favorite" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'favorite.label', default: 'Favorite')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userPassword', 'error')} ">
	<label for="userPassword">
		<g:message code="user.userPassword.label" default="User Password" />
		
	</label>
	<g:textField name="userPassword" value="${userInstance?.userPassword}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userPicture', 'error')} ">
	<label for="userPicture">
		<g:message code="user.userPicture.label" default="User Picture" />
		
	</label>
	<g:textField name="userPicture" value="${userInstance?.userPicture}"/>
</div>

