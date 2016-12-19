<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="<c:url value="/resources/styles/bootstrap/3.3.5/css/bootstrap.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/styles/bootstrap/3.3.5/css/bootstrap-theme.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/styles/pivotal.css" />" />
	<title>security-solution: Edit Account Details</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<a title="Spring IO" href="http://www.spring.io"> 
							<img src="<c:url value="/resources/images/spring-trans-dark.png"/>" height="50"/>
						</a>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="http://www.pivotal.io">
									<img alt="Pivotal" title="Pivotal" height="20" src="<c:url value="/resources/images/pivotal-logo-600.png" />" />
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		
		<div class="row">

			<h1>Edit Account Details</h1>
			
			<form:form modelAttribute="account" action="${accountUrl}" method="PUT"  role="form" class="form-horizontal">
				<fieldset>
					<div class="form-group">
						<label class="control-label col-sm-2" for="number">
							Number				
						</label>
						<div class="col-sm-4">
							<form:input path="number" class="form-control"/>
						</div>
						<div class="col-sm-6">
							<form:errors cssClass="alert alert-danger" path="number" />				
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">
							Name				
						</label>
						<div class="col-sm-4">
							<form:input path="name" class="form-control"/>
						</div>
						<div class="col-sm-6">
							<form:errors cssClass="alert alert-danger" path="name" />				
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="saveButton" type="submit" class="btn button-default">
								Update Account
							</button>		
						</div>
					</div>
				</fieldset>
			</form:form>

		</div>

		<div class="row">

			<!--  Don't show logout unless someone is logged in -->
			<security:authentication property="principal" var="principal" scope="page" />
			<c:if test="${principal != null}">
				<form:form action="/logout" method="post" role="form" class="form-horizontal"><input type="submit" value="Logout" class="btn btn-link"/> (${principal.username})</form:form>
			</c:if>

		</div>
		
	</div>

</body>

</html>
