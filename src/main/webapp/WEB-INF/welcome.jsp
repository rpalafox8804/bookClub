<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- welcome on the tab with the Username -->
    <title>Welcome <c:out value ="${user.userName}"/>!</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="dashboard d-flex flex-column mx-auto">	
		
		<div class="topNav d-flex py-5 ">
			<!-- Welcome with username as the header -->
			<h1 class = "mx-auto">Welcome <c:out value ="${user.userName}"/>!</h1>
			<!-- Logout button to clear session -->
			<form action="/logout" method="POST" class = "mx-auto">
		  		<input type="hidden" name="_method" value="logout">
				<input type="submit" value="Logout" class="bg-danger">
			</form>
		</div>
		<div class="bottomNav d-flex px-5">
			<p class = "mx-auto fs-3">Books from everyone's shelves:</p>
			<!-- Link to Add a book  -->
			<a href="/books/new" class = "mx-auto">+Add a book to my shelf!</a>
		</div>
	</div>
	<div class="dashboard d-flex flex-column mx-auto">
			<!-- Dashboard to show the list of books -->
			<table class="table table-bordered border-dark table-striped p-3 col-10 mx-auto text-center" style="width: 65rem;">
			    <thead class="thead-dark bg-warning text-dark">
			        <tr>
			            <th>ID</th>
			            <th>Title</th>
			            <th>Author Name</th>
			            <th>Posted By</th>
			        </tr>
			    </thead>
			    <tbody>
			         <!-- loop over all the books users have added  -->
			         <c:forEach var="book" items="${books}">
			         <tr>
			    		<td><c:out value="${book.id}"/></td>
			    		<td><a href="/books/<c:out value="${book.id}"/>"><c:out value="${book.bookTitle}"/></a></td>
			    		<td><c:out value="${book.author}"/></td> 
			    		<td><c:out value="${book.user.userName}"/></td> 
			         </tr>
			    		
					</c:forEach>
			    </tbody>
			</table> 
	</div>
</body>
</html>