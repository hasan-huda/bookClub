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
<title>Login And Registration</title>
</head>
<body>
    <div class="container">
        <h1>Welcome!</h1>
        <div class="d-flex justify-content-around mt-2">
                <div class="card">
                    <div class="card-header">
                        <h1>Register</h1>
                    </div>
                    <div class="card-body">
                        <form:form action="/register" method="post" modelAttribute="newUser">
                            <div class="row mb-3">
                                <form:label class="form-label" path="userName">Username</form:label>
                                <form:input class="form-control" path="userName"/>
                                <form:errors class="form-text text-danger" path="userName"/>
                            </div>
                            <div class="row mb-3">
                                <form:label class="form-label" path="email">Email</form:label>
                                <form:input class="form-control" path="email"/>
                                <form:errors class="form-text text-danger" path="email"/>
                            </div>
                            <div class="row mb-3">
                                <form:label class="form-label" path="password">Password</form:label>
                                <form:input class="form-control" type="password" path="password"/>
                                <form:errors class="form-text text-danger" path="password"/>
                            </div>
                            <div class="row mb-3">
                                <form:label class="form-label" path="confirm">Confirm PW</form:label>
                                <form:input class="form-control" type="password" path="confirm"/>
                                <form:errors class="form-text text-danger" path="confirm"/>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h1>Login</h1>
                    </div>
                    <div class="card-body">
                        <form:form action="/login" method="post" modelAttribute="newLogin">
                            <div class="row mb-3">
                                <form:label class="form-label" path="email">Email</form:label>
                                <form:input class="form-control" path="email"/>
                                <form:errors class="form-text text-danger" path="email"/>
                            </div>
                            <div class="row mb-3">
                                <form:label class="form-label" path="password">Password</form:label>
                                <form:input class="form-control" type="password" path="password"/>
                                <form:errors class="form-text text-danger" path="password"/>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
    </div>
    
</body>
</html>