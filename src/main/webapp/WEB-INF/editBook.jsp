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
    <title>Book Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<div class="dashboard d-flex justify-content-around mx-auto p-5">
		<h1 class="text-primary mx-auto">Add a Book to your Shelf!</h1>
		<a href="/books" class = "mx-auto"> back to the shelves</a>
	</div>
	<div class="form d-flex flex-column justify-content-end p-5">
		<!--  Form to update a book -->
		<form:form action="/books/update/${book.id}" method="POST" modelAttribute="book" class="p-3 mx-auto">
			  
				    <p class="mb-3 d-flex justify-content-end ">
				        <form:label path="bookTitle" class="col-form-table fs-4">Title: </form:label>
				        <form:errors path="bookTitle" class="text-danger"/>
				        <form:input path="bookTitle" class= "col-12"/>
				    </p>
				    <p class="mb-3 d-flex justify-content-end">
				        <form:label path="author" class="col-form-table fs-4">Author: </form:label>
				        <form:errors path="author" class="text-danger"/>
				        <form:input path="author" class="col-12"/>
				    </p>
				    <p class="mb-3 d-flex justify-content-end">
				        <form:label path="thoughts" class="col-form-table fs-4">My thoughts: </form:label>
				        <form:errors path="thoughts" class="text-danger"/>
				        <form:textarea class="col-12" rows="5" path="thoughts"/>
				    <p class="mb-3 d-flex justify-content-end">
				    <!-- Hidden input to store user id in Session -->
				    <input type="hidden" name="user" value="<c:out value="${userSessionId}"/>">
				    <input type="submit" value="Submit" class="bg-warning"/>
		</form:form>    
	
	</div>
   
</body>
</html>