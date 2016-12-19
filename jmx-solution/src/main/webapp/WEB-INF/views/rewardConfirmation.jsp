<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap.min.css" />" />
    <link rel="stylesheet" href="<c:url value="resources/styles/bootstrap/3.3.5/css/bootstrap-theme.min.css" />" />
    <link rel="stylesheet" href="<c:url value="resources/styles/pivotal.css" />" />
	<title>jmx-1-solution: Reward Confirmation</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<a title="Spring IO" href="http://www.spring.io"> 
							<img src="resources/images/spring-trans-dark.png" height="50"/>
						</a>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="http://www.pivotal.io">
									<img alt="Pivotal" title="Pivotal" height="20" src="resources/images/pivotal-logo-600.png" />
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		
		<div class="row">
			<h1>Reward Confirmation</h1>

			<p>
				Account '${rewardConfirmation.accountContribution.accountNumber}' rewarded a
				${rewardConfirmation.accountContribution.amount} benefit for dining at merchant '${dining.merchantNumber}'
			</p>		
		</div>
		
		<div class="row">
			
			<table class="table">
				<thead>
					<tr>
						<th>
							Name
						</th>
						<th>
							Allocation Percentage
						</th>
						<th>
							Amount Awarded
						</th>
						<th>
							Total Savings
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="distribution" items="${rewardConfirmation.accountContribution.distributions}">
						<tr>
							<td>${distribution.beneficiary}</td>
							<td>${distribution.percentage}</td>
							<td>${distribution.amount}</td>
							<td>${distribution.totalSavings}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
		
	</div>

</body>

</html>
