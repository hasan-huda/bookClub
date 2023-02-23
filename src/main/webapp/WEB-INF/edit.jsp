<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Book Share</title>
</head>
<body>
	<div class="container">
		 <div class="card">
                    <div class="card-header">
                        <h1>Edit your book!</h1>
                        <p><a href="/home">Back to the shelves</a></p>
                    </div>
                    <div class="card-body">
                        <form:form action="/edit/${book.id}" method="post" modelAttribute="book">
                        	<form:input type="hidden" path="user" value="${user.id}"/>
                        	<input type="hidden" name="_method" value="put">
                            <div class="row mb-3">
                                <form:label class="form-label" path="title">Title:</form:label>
                                <form:input class="form-control" path="title" value=""/>
                                <form:errors class="form-text text-danger" path="title"/>
                            </div>
                            <div class="row mb-3">
                                <form:label class="form-label" path="author">Author: </form:label>
                                <form:input class="form-control" value="${book.author}" path="author"/>
                                <form:errors class="form-text text-danger" path="author"/>
                            </div>
                            <div class="row mb-3">
                                <form:label class="form-label" path="thought">My Thoughts: </form:label>
                                <form:input class="form-control" value="${book.thought}" path="thought"/>
                                <form:errors class="form-text text-danger" path="thought"/>
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
</body>
</html>