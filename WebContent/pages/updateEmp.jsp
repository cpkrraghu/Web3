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
<form method="post" action="employee">
<input type="hidden" name="hidden" value="updateEmp"/>
	<table class="table">
		<tr>
			<td>Employee ID : </td>
			<td><input type="number" value="${requestScope.updateEmp.empNo}" name="empNoUpd" required/></td>
		</tr>
		<tr>
			<td>Department No : </td>
			<td>
			<select name="deptNoUpd">
			<c:choose>
				<c:when test="${1 eq requestScope.updateEmp.deptNo}"><option value="1" selected="selected">Sales</option></c:when>
				<c:otherwise><option value="1">Sales</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${2 eq requestScope.updateEmp.deptNo}"><option value="2" selected="selected">Marketing</option></c:when>
				<c:otherwise><option value="2">Marketing</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${3 eq requestScope.updateEmp.deptNo}"><option value="3" selected="selected">HR</option></c:when>
				<c:otherwise><option value="3">HR</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${4 eq requestScope.updateEmp.deptNo}"><option value="4" selected="selected">IT</option></c:when>
				<c:otherwise><option value="4">IT</option></c:otherwise>
			</c:choose>
			
			</select>
		</tr>
		<tr>
			<td>Date of Birth : </td>
			<td><input type="date" value="${requestScope.updateEmp.dob}" name="dobUpd" required/></td>
		</tr>
		<tr>
			<td>Date of Joining : </td>
			<td><input type="date" value="${requestScope.updateEmp.doj}" name="dojUpd" required/></td>
		</tr>
		<tr>
			<td>Salary : </td>
			<td><input type="number" value="${requestScope.updateEmp.salary}" name="salaryUpd" required/></td>
		</tr>
		<tr>
			<td>Salary Grade : </td>
			<td><input type="number" value="${requestScope.updateEmp.salGrade}" name="salGradeUpd" required/></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit" class="btn btn-success">Save</button><button class="btn btn-info" type="reset">Reset</button></td>
		</tr>
	</table>
</form>
</body>
</html>