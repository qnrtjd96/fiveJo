<%@ page import="MYDB_Sample_MVC1.DBConnection"%>
<%@ page import="MYDB_Sample_MVC1.WooriDAO"%>
<%@ page import="MYDB_Sample_MVC1.WooriDTO"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	WooriDTO member = new WooriDTO();
	member.setId(request.getParameter("id"));
	member.setName(request.getParameter("name"));
	member.setEmail(request.getParameter("email"));
	member.setPassword(Integer.parseInt(request.getParameter("password")));

	Connection con = DBConnection.openConnection();
 	WooriDAO dao1 = new WooriDAO(con);
	if(dao1.update(member)){
		out.println("<script>alert('정보를 수정하였습니다.');location.href='selectall.jsp';</script>");
	}
	DBConnection.closeConnection(con);