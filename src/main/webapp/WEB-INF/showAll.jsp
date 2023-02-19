<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Dashboard</title>
</head>
<body>
	<div class="container">
        <div class="card">
            <div class="card-header">
                <h1>Welcome ${user.userName}</h1>
            </div>
            <div class="card-body">
                <p>This is your dashboard, nothing to see here yet.</p>
                <p><a href="/logout">logout</a></p>
            </div>
        </div>
    </div>
</body>
</html>