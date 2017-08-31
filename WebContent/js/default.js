$(document).ready(function() {
	$("#empBtn").click(function() {
		$("#emp-container").show();
		$("#dept-container").hide();
		$("#message").hide();
		$("#empListDiv").hide();
		$("#showEmpDiv").hide();
		$("#updateEmpDiv").hide();
	});
	$("#deptBtn").click(function() {
		$("#emp-container").hide();
		$("#dept-container").show();
		$("#message").hide();
		$("#empListDiv").hide();
		$("#showEmpDiv").hide();
		$("#updateEmpDiv").hide();
	});
	$("#empAdd").click(function() {
		$("#addEmp").show();
		$("#searchEmp").hide();
		$("#updateEmp").hide();
		$("#deleteEmp").hide();
	});
	$("#empDel").click(function() {
		$("#addEmp").hide();
		$("#searchEmp").hide();
		$("#updateEmp").hide();
		$("#deleteEmp").show();
		
	});
	$("#empUpd").click(function() {
		$("#addEmp").hide();
		$("#searchEmp").hide();
		$("#updateEmp").show();
		$("#deleteEmp").hide();
		
	});
	$("#empSea").click(function() {
		$("#addEmp").hide();
		$("#searchEmp").show();
		$("#updateEmp").hide();
		$("#deleteEmp").hide();
		
	});
	
});