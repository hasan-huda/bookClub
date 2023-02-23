<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <h2><c:out value="${book.title}"/></h2>
        <p><a href="/home">Back to the shelves</a></p>
        <p><c:out value="${book.user.userName}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/>,</p>
        <h5>Here are <c:out value="${book.user.userName}"/>'s thoughts:</h5>
      </div>
      <div class="card-body">
        <p>---------------------------------------</p>
        <p><c:out value="${book.thought}"/> </p>
        <p>---------------------------------------</p>

      </div>
    </div>
    <div class="d-flex justify-content-around">
      <form action="/books/${book.id}/edit">
        <button type="submit" class="btn btn-primary">
          edit
        </button>
      </form>
      <form action="/books/${book.id}/delete" method="post">
      	<input type="hidden" name="_method" value="delete">
        <button type="submit" class="btn btn-primary">
          delete
        </button>
      </form>
  </div>
  </div>
</body>
</html>