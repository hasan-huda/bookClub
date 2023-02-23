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
                <p><a href="/logout">logout</a></p>
                <p><a href="/books/new">+ Add to my shelf!</a></p>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Posted By</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td><c:out value="${book.id}"/></td>
                                <td><a href="/books/${book.id}">${book.title}</a></td>
                                <td><c:out value="${book.author}"/></td>
                                <td><c:out value="${book.user.userName}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>
</body>
</html>