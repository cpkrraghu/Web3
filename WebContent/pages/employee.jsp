<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/default.js"></script>
</head>
<body>
	<table class="table">
		<tr>
			<td>Employee ID : </td>
			<td>${requestScope.searchEmp.empNo}</td>
		</tr>
		<tr>
			<td>Department No : </td>
			<td>${requestScope.searchEmp.deptNo}</td>
		</tr>
		<tr>
			<td>Date of Birth : </td>
			<td>${requestScope.searchEmp.dob}</td>
		</tr>
		<tr>
			<td>Date of Joining : </td>
			<td>${requestScope.searchEmp.doj}</td>
		</tr>
		<tr>
			<td>Salary : </td>
			<td>$${requestScope.searchEmp.salary}</td>
		</tr>
		<tr>
			<td>Salary Grade : </td>
			<td>${requestScope.searchEmp.salGrade}</td>
		</tr>
		<tr>
			<td colspan="2"><button class="btn btn-success" onclick="window.location.href='landing.jsp'">Home</button></td>
		</tr>
	</table>
</body>
</html>