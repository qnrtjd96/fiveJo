<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="person.DBConnection"%>
<%@ page import="person.PersonDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result1;
	Connection con = DBConnection.openConnection();
	PersonDAO dao1 = new PersonDAO(con);
	result1 = dao1.alterTable();
	DBConnection.closeConnection(con);
	
	if(result1){
		out.println("<script>alert('테이블 수정 성공');location.href='index_person.jsp';</script>");
	}else{
		out.println("<script>alert('테이블 수정 실패');location.href='index_person.jsp';</script>");
	}
	
%>