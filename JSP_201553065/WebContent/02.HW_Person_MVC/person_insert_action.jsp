<%@ page import="person.DBConnection"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="person.PersonDTO"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");

	PersonDTO member = new PersonDTO();
	member.setempno(request.getParameter("empno"));
	member.setempname(request.getParameter("empname"));
	member.setdeptcode(request.getParameter("deptcode"));
	member.sethiredate(request.getParameter("hiredate"));
	member.setposition(request.getParameter("position"));

	boolean checkResult = false;
	boolean insertResult = false;

	Connection con1 = DBConnection.openConnection();
	PersonDAO dao1 = new PersonDAO(con1); //이건 어디서?
	checkResult = dao1.checkID(member.getempno()); // 이건 어디서? 10라인 화면에서 가져온것
	DBConnection.closeConnection(con1);

	if(!checkResult){ //db에 화면의 id가 없으면
 		Connection con2 = DBConnection.openConnection();
 		PersonDAO dao2 = new PersonDAO(con2);
 		insertResult = dao2.insert(member);
 		DBConnection.closeConnection(con2);
 
	if(insertResult){
		out.println("<script>alert('회원 생성 성공');location.href='index_person.jsp';</script>");
	}else{
		out.println("<script>alert('회원 생성 실패');location.href='index_person.jsp';</script>");
	}
	}else{	
	out.println("<script>alert('회원 생성 성공');location.href='index_person.jsp';</script>");
}
%>
