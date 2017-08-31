package com.raghu.web3.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.imcs.raghu.bonus.pojo.Employee;
import com.imcs.raghu.bonus.service.EmployeeService;
import com.imcs.raghu.bonus.service.EmployeeServiceImpl;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {
	final static Logger logger=Logger.getLogger(EmployeeServlet.class);
	EmployeeService es=new EmployeeServiceImpl();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hidden=request.getParameter("hidden");
		if(hidden.equalsIgnoreCase("addEmp")){
			addEmployee(request,response);
		}else if(hidden.equalsIgnoreCase("updEmp1")){
			getEmployeeUpdate(request,response,1);
		}else if(hidden.equalsIgnoreCase("updEmp2")){
			getEmployeeUpdate(request,response,2);
		}else if(hidden.equalsIgnoreCase("updateEmp")){
			updateEmployee(request,response);
		}else if(hidden.equalsIgnoreCase("searchEmp")){
			getEmployee(request,response);
		}else if(hidden.equalsIgnoreCase("getAllEmps")){
			getAllEmployees(request,response);
		}else if(hidden.equalsIgnoreCase("deleteEmp1")){
			deleteEmployee(request,response,1);
		}else{
			deleteEmployee(request,response,2);
		}
	}
	private void getAllEmployees(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in get all employees method");
		int deptNo=Integer.parseInt(request.getParameter("deptNo"));
		List<Employee> empList=new ArrayList<>();
		empList=es.getEmployees(deptNo);
		if(empList.size()>0){
			request.setAttribute("empList",empList);
		}else
			request.setAttribute("msg", "No employees in the database for Department "+deptNo+" (or) there was an error fetching.");
		RequestDispatcher rd=request.getRequestDispatcher("/landing.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response,int i) {
		logger.info("in delete emp method "+i);
		int empNo=Integer.parseInt(request.getParameter("empNoDel"+i));
		if(es.deleteEmployee(empNo)){
			request.setAttribute("msg", "Employee "+empNo+" deleted Successfully");
		}else
			request.setAttribute("msg", "Problem in deleting Employee "+empNo+" try again later.");
		RequestDispatcher rd=request.getRequestDispatcher("/landing.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void getEmployee(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in search emp method");
		int empNo=Integer.parseInt(request.getParameter("empNoSea"));
		Employee emp=es.getEmployee(empNo);
		if(null!=emp){
			request.setAttribute("searchEmp",emp);
		}else
			request.setAttribute("msg", "Problem in fetching Employee "+empNo+" try again.");
		RequestDispatcher rd=request.getRequestDispatcher("/landing.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void getEmployeeUpdate(HttpServletRequest request, HttpServletResponse response,int i) {
		logger.info("in get Employee for update method "+i);
		int empNo=Integer.parseInt(request.getParameter("empNoSU"+i));
		Employee emp=es.getEmployee(empNo);
		RequestDispatcher rd=null;
		if(null!=emp){
			request.setAttribute("updateEmp",emp);
			rd=request.getRequestDispatcher("/landing.jsp");
		}else{
			request.setAttribute("msg", "Problem in fetching Employee "+empNo+" try again.");
			rd=request.getRequestDispatcher("/landing.jsp");
		}
		
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in update emp method");
		int empNo=Integer.parseInt(request.getParameter("empNoUpd"));
		int deptNo=Integer.parseInt(request.getParameter("deptNoUpd"));
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-mm-dd");
		Date doj=new Date();
		Date dob=new Date();
		try {
			doj=sd.parse(request.getParameter("dojUpd"));
			dob=sd.parse(request.getParameter("dobUpd"));
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}
		
		float salary=Float.parseFloat(request.getParameter("salaryUpd"));
		int salGrade=Integer.parseInt(request.getParameter("salGradeUpd"));
		Employee emp=new Employee(empNo,deptNo,doj,dob,salary,salGrade);
		if(es.updateEmployee(emp)){
			request.setAttribute("msg", "Employee "+empNo+" updated Successfully");
		}else
			request.setAttribute("msg", "Problem in updating Employee "+empNo+" try again.");
		RequestDispatcher rd=request.getRequestDispatcher("/landing.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in add emp method");
		int deptNo=Integer.parseInt(request.getParameter("deptNo"));
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-mm-dd");
		Date doj=new Date();
		Date dob=new Date();
		try {
			doj=sd.parse(request.getParameter("doj"));
			dob=sd.parse(request.getParameter("dob"));
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}
		
		float salary=Float.parseFloat(request.getParameter("salary"));
		int salGrade=Integer.parseInt(request.getParameter("salGrade"));
		Employee emp=new Employee(0,deptNo,doj,dob,salary,salGrade);
		if(es.addEmployee(emp)){
			request.setAttribute("msg", "Employee added Successfully");
		}else
			request.setAttribute("msg", "Problem in adding Employee try again.");
		RequestDispatcher rd=request.getRequestDispatcher("/landing.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
