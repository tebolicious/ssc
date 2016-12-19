<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>spring-microservices: Accounts Microservice</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<a title="Spring IO" href="http://www.spring.io"> 
							<img src="<c:url value="resources/images/spring-trans-dark.png"/>" height="50"/>
						</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li>
								<a style="font-size: 14pt; color: #EEDD00;" href="/accounts">Accounts (as JSON)</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">	
							<li>
								<a href="http://www.pivotal.io">
									<img alt="Pivotal" title="Pivotal" height="20" src="<c:url value="resources/images/pivotal-logo-600.png" />" />
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		
		<div class="row">
		
			<h1>Accounts Microservice - Home Page</h1>

			<p>Accounts Server Microservice is running.
			Click the link above - you should get all the accounts as a JSON document</p>
	
			<h3>Spring Boot URLs</h3>
			<p>For those interested, Spring Boot provides RESTful URLs for
				interrogating your application (they return JSON format data):</p>
	
			<ul>
				<li><a href="/beans">The beans</a></li>
				<li><a href="/env">The environment</a></li>
				<li><a href="/health">Application health</a></li>
				<li><a href="/metrics">Application metrics</a></li>
				<li><a href="/trace">Request call trace</a></li>
			</ul>
		
		</div>
		
	</div>
	
</body>
</html>