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
    <title>Login and Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header -->
   <div class="header d-flex flex-column mx-auto justify-content-start  m-5 px-5">
	   <h1 class="text-info">Book Club!</h1>
	   <h2 >A place for friends to share thoughts on books</h2>
	   <p class="text-primary mx-auto"><c:out value = "${success}"/></p>
   </div>
   
   <div class="mainContent d-flex mx-auto justify-content-center">
	   <!-- registration section -->
	   <div class="register">
			<form:form action="/user/new" method="POST" modelAttribute="newUser" class="p-3 mx-auto">
		   		<table class="table table-bordered border-dark table-striped p-3 col-10 mx-auto" style="width: 45rem;">
					    <thead class="thead-dark bg-warning text-dark">
					        <tr>
					            <th colspan="2" class="text-center">Registration</th>			            		            
					        </tr>
					    </thead>
					    <tbody>
					         <tr>
					    		<td><form:label path="userName">User Name: </form:label>
					    		<form:errors path="userName" class="text-danger"/>
					    		</td>
					    		<td><form:input path="userName"/></td>
					         </tr>
					         <tr>
					    		<td><form:label path="email">Email: </form:label>
					    		<form:errors path="email" class="text-danger"/>
					    		</td>
					    		<td><form:input path="email"/></td>
					         </tr>
					         <tr>
					    		<td><form:label path="password">Password: </form:label>
					    		<form:errors path="password" class="text-danger"/>
					    		</td>
					    		<td><form:input type="password" path="password"/></td>
					         </tr>
					         <tr>
					    		<td><form:label path="confirm">Confirm: </form:label>
					    		<form:errors path="confirm" class="text-danger"/>
					    		</td>
					    		<td><form:input type="password" path="confirm"/></td>
					         </tr>
					         <tr>
						         <td colspan="2" class="mx-auto">
						         	<input type="submit" value="Submit" class="btn btn-lg  btn-warning btn-block col-12" />
						         </td>
					         </tr>
					    </tbody>
					</table> 
			</form:form>
			
	   </div>
		<!-- Login section -->
		<div class="login">
			<form:form action="/user/login" method="POST" modelAttribute="newLogin" class="p-3 mx-auto">
		   		<table class="table table-bordered border-dark table-striped p-3 col-10 mx-auto" style="width: 45rem;">
					    <thead class="thead-dark bg-warning text-dark">
					        <tr>
					            <th colspan="2" class="text-center">Log In</th>			            		            
					        </tr>
					    </thead>
					    <tbody>
					         <tr>
					    		<td><form:label path="email">Email: </form:label>
					    		<form:errors path="email" class="text-danger"/>
					    		</td>
					    		<td><form:input path="email"/></td>
					         </tr>
					         <tr>
					    		<td><form:label path="password">Password: </form:label>
					    		<form:errors path="password" class="text-danger"/>
					    		</td>
					    		<td><form:input type="password" path="password"/></td>
					         </tr>
					         <tr>
						         <td colspan="2">
						         	<input type="submit" value="Submit" class="btn btn-lg  btn-warning btn-block col-12"/>
						         </td>
					         </tr>
					    </tbody>
					</table> 
			</form:form>
		</div>
		
   </div>
	

</body>
</html>