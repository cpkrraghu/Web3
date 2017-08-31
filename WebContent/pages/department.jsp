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
<script>
	function updateEmp(id){
		$("#empNoUpdDep").val(id);
		$("#hidden").val("updEmp2");
	}
	function deleteEmp(id){
		$("#empNoDelDep").val(id);
		$("#hidden").val("deleteEmp2");
	}

</script>
</head>
<body>
<form id="departmentUD" method="post">
	<input type="hidden" name="empNoDel2" id="empNoDelDep"/>
	<input type="hidden" name="empNoSU2" id="empNoUpdDep"/>
	<input type="hidden" name="hidden" id="hidden"/>
	
	<table class="table">
		<tr>
		 <th>Employee No</th><th>Department No</th><th>Date of Birth</th><th>Date of Joining</th><th>Salary</th><th></th><th></th>
		</tr>
		<c:forEach items="${requestScope.empList}" var="emp" >
            <tr>      
               
                <td>${emp.empNo}</td>
                <td>${emp.deptNo}</td>
                <td>${emp.dob}</td>
                <td>${emp.doj}</td>  
                <td>${emp.salary}</td>
                <td><button class="btn btn-success" onclick="updateEmp(${emp.empNo})" >Update</button></td>
                <td><button class="btn btn-success" onclick="deleteEmp(${emp.empNo})" >Delete</button></td>
            </tr>
       </c:forEach>
		
	
	</table>
</form>
</body>
</html>