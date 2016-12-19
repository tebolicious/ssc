<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<title>security: Account Details</title>
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

			<h1>Account Details</h1>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-3">
						Account:
					</div>
					<div class="col-sm-9">
						${account.number}
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						Name:
					</div>
					<div class="col-sm-9">
						${account.name}
					</div>
				</div>
			</div>
			
			<%-- TODO-10: Only viewers should be allowed to view beneficiaries information. 
				Hide the table row below from all users who do not have the "VIEWER" role --%>
			<div>
				<h2>
					Beneficiaries
				</h2>
				<table class="table">
					<thead>
						<tr>
							<th>
								Name
							</th>
							<th>
								Allocation
							</th>
							<th>
								Percentage
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="beneficiary" items="${account.beneficiaries}">
							<tr>
								<td>${beneficiary.name}</td>
								<td>${beneficiary.allocationPercentage}</td>
								<td>${beneficiary.savings}</td>
							</tr>
						</c:forEach>
						
						<c:if test="${ account.beneficiaries.size() == 0}">
							<tbody><tr><td colspan="3" align="center"> --- None Registered --- </td></tr></tbody>
						</c:if>
					</tbody>
				</table>
			</div>
			
		
			<div class="row">
				<br />

				<%-- TODO-09: - Using 'vince', go to the 'Account details' page and then click on 'Edit accounts'.
					As you can see, access to this page is denied because 'vince' does not have the EDITOR role.
					It would be more elegant to hide this link from 'vince' and only show it to editors.
					- Using the 'security' tag library, hide the 'Edit Account' link unless a
	              	user has permission to access that page (hint: use the 'access' attribute of the 'authorize'
	              	security tag. This attribute accepts SpEL expressions.) 
	              	- Note that when referenced in JSP, the role is ROLE_EDITOR
	              	- Save your work (restart not needed for JSP changes)
	              	- Try logging in as a user with and without the editor role and verify that you see 
	              	the correct behavior.
	              --%>

				<div><a href="editAccount?entityId=${account.entityId}" class="btn btn-link">Edit Account</a></div>
	
				<div><a href="accountList">Return to Account List</a></div>

				<!--  Don't show logout unless someone is logged in -->
				<security:authentication property="principal" var="principal" scope="page" />
				<c:if test="${principal != null}">
					<div>
					<form:form action="/logout" method="post" role="form" class="form-horizontal"><input type="submit" value="Logout" class="btn btn-link"/> (${principal.username})</form:form>
					</div>
				</c:if>

			</div>
		
		</div>

	</div>

</body>

</html>
