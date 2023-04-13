<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Read Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
		<!-- Nav bar -->
		<div class="topNav d-flex mx-auto justify-content-space-between py-3">
			<h1 class="text-primary mx-auto "><c:out value ="${book.bookTitle}"/></h1>
			<a href="/books" class="mx-auto"> back to the shelves</a>
		</div>
	<div class="dashboard d-flex flex-column mx-auto col-8">

		<!-- Determination for initial phrase and thoughts section -->
		<c:choose>
			<c:when test="${userSessionId == book.user.id}">
				<p class="fs-3"><span class="text-danger">You </span> read <span class = "text-info"><c:out value="${book.bookTitle}"/></span> by <span class = "text-success"><c:out value="${book.author}"/></span> </p>
				<p class="fs-4 ">Here your thoughts:</p>
			</c:when>
			
			<c:otherwise>
				<p class="fs-3"><span class="text-danger"><c:out value="${book.user.userName}"/> </span> read <span class = "text-info"><c:out value="${book.bookTitle}"/></span> by <span class = "text-success"><c:out value="${book.author}"/></span> </p>
				<p class="fs-4">Here are <c:out value="${book.user.userName}"/>'s thoughts:</p>
			</c:otherwise>
		</c:choose>
		
		<!-- Thoughts section -->
		<p class="border-3 border-bottom border-top p-3">
			<c:out value="${book.thoughts}"/>
		</p>
		
		<!-- Edit Delete section -->
		
		<c:if test="${userSessionId == book.user.id}">
			<div class="buttonsForCreator d-grid gap-2 d-md-flex justify-content-md-end">
				
				<a href="/books/update/${book.id}" class="btn btn-primary active btn-lg fs-5">Edit</a>
				<form action="/books/delete/${book.id}" method="POST">
			    		    <input type="hidden" name="_method" value="delete">
	   						<input type="submit" value="Delete" class="btn btn-danger btn-lg">
				</form>
			</div>
		</c:if>
	</div>
	
</body>
</html>