<%@ page import="MYDB_Sample_MVC1.DBConnection"%>
<%@ page import="MYDB_Sample_MVC1.WooriDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	boolean result1;
	Connection con = DBConnection.openConnection();
	WooriDAO dao1 = new WooriDAO(con);
	result1 = dao1.createTable();
	DBConnection.closeConnection(con);
	
	if(result1){
		out.println("<script>alert('테이블 생성 성공');location.href='index.html';</script>");
	}else{
		out.println("<script>alert('테이블 생성 실패');location.href='index.html';</script>");
	}
%>