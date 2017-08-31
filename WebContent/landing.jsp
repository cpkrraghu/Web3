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
<title>::Employee Application::</title>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header"><a class="navbar-brand" href="#">Employee App</a></div>
		<ul class="nav navbar-nav">
			<li><a id="empBtn" href="#">Employee</a></li>
			<li><a id="deptBtn" href="#">Department</a></li>
		</ul>
	</div>
	</nav>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">
				<div id="message"><c:if test="${not empty requestScope.msg}">${requestScope.msg}</c:if></div>
				<div id="updateEmpDiv"><c:if test="${not empty requestScope.updateEmp}"><jsp:include page='pages/updateEmp.jsp'/></c:if></div>
				<div id="showEmpDiv"><c:if test="${not empty requestScope.searchEmp}"><jsp:include page='pages/employee.jsp'/></c:if></div>
				<div id="empListDiv"><c:if test="${not empty requestScope.empList}"><jsp:include page='pages/department.jsp'/></c:if></div>
				<div id="emp-container" style="display: none">
				<br>
					<div class="row">
						<div class="col-md-6">
							<button class="btn-success btn" id="empAdd">Add</button>
							<button class="btn-success btn" id="empDel">Delete</button>
							<button class="btn-success btn" id="empUpd">Update</button>
							<button class="btn-success btn" id="empSea">Search</button>
						</div>
						<div class="col-md-6">
							
						</div>
					</div>
					<br>
					<br>
					<div id="addEmp" class="panel panel-info padding-top-20"
						style="display:none">
						<div class="panel-heading">Add Employee</div>
						<div class="panel-body">
							<form method="post" id="addEmpForm" action="employee">
								<input type="hidden" name="hidden" value="addEmp"/>
								<div class="row" style="padding-top: 10px">
									<label for="deptNo" class="col-md-4 control-label">Department
										Number : </label>
									<div class="col-md-8">
										<select name="deptNo" id="deptNo" class="form-control">
											<option value="4" selected="selected">Select a
												department</option>
											<option value="1">Sales</option>
											<option value="2">Marketing</option>
											<option value="3">HR</option>
											<option value="4">IT</option>
										</select>
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="dob" class="col-md-4 control-label">Date of
										Birth : </label>
									<div class="col-md-8">
										<input type="date" id="dob" name="dob" class="form-control"
											placeholder="Date of Birth" required />
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="doj" class="col-md-4 control-label">Date of
										Joining : </label>
									<div class="col-md-8">
										<input type="date" id="doj" name="doj" class="form-control"
											placeholder="Date of Joining" required />
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="salary" class="col-md-4 control-label">Salary
										: </label>
									<div class="col-md-8 ">
										<input type="number" id="salary" name="salary"
											class="form-control" placeholder="Enter Salary" required />
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="salGrade" class="col-md-4 control-label">Salary
										Grade : </label>
									<div class="col-md-8">
										<select name="salGrade" id="salGrade" class="form-control">
											<option value="1">$10k-$20k</option>
											<option value="2">$20k-$40k</option>
											<option value="3">$40k-$70k</option>
											<option value="4">$70k-$100k</option>
										</select>
									</div>
								</div>

								<div class="row" style="padding-top: 10px">
									<div class="col-md-offset-4 col-md-8">
										<div class="col-md-4">
											<button class="btn btn-success"
												type="submit" id="addEmpBtn">Add Employee</button>
										</div>
										<div class="col-md-4">
											<button class="btn btn-danger"
												onclick="window.location.href='landing.jsp'">Cancel</button>
										</div>
										<div class="col-md-4">
											<button class="btn btn-warning" type="reset">Reset</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div id="searchEmp" class="row text-center" style="display: none">
						<h3>Employee Search</h3>
						<br>
						<form id="searchEmpForm" method="post" action="employee">
						<input type="hidden" name="hidden" value="searchEmp"/>
							<div class="form-group">
								<input   type="number" id="empNoSea" name="empNoSea"
									placeholder="Enter Employee Number" required /><br><br>
								<button class="btn btn-success" id="empSearchBtn" type="submit">Search</button>
							</div>
						</form>
					</div>
					<div id="deleteEmp" class="row text-center" style="display: none">
						<h3>Employee Delete</h3>
						<br>
						<form id="deleteEmpForm" method="post" action="employee">
						<input type="hidden" name="hidden" value="deleteEmp1"/>
							<div class="form-group">
								<input   type="number" id="empNoDel" name="empNoDel1"
									placeholder="Enter Employee Number" required /><br><br>
								<button class="btn btn-success" id="empDeleteBtn" type="submit">Delete</button>
							</div>
						</form>
					</div>
					<div id="updateEmp" class="row text-center" style="display: none">
						<h3>Employee Update</h3>
						<br>
						<form id="updateEmpForm" method="post" action="employee">
							<input type="hidden" name="hidden" value="updEmp1"/>
							<div class="form-group">
								<input   type="number" id="empNoUpd" name="empNoSU1"
									placeholder="Enter Employee Number" required /><br><br>
								<button class="btn btn-success" id="empUpdateBtn" type="submit">Update</button>
							</div>
						</form>
					</div>
				</div>
				<div id="dept-container" class="text-center" style="display: none" style="display: none">
				<br>
				<h3>Department Search</h3>
					<div class="row">
					
						<div class="text-center">
							<form id="deptForm" method="post" action="employee">
							<input type="hidden" name="hidden" value="getAllEmps"/>
								<input type="number" name="deptNo" required/><br>
								<button class="btn btn-success" id="deptSearch">Search</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	<footer class="container-fluid text-center">
	<p>Footer Text</p>
	</footer>


</body>
</html>