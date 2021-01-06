<%@ page import="MYDB_Sample_MVC1.DBConnection"%>
<%@ page import="MYDB_Sample_MVC1.WooriDAO"%>
<%@ page import="MYDB_Sample_MVC1.WooriDTO"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");

	WooriDTO member = new WooriDTO();
	member.setId(request.getParameter("id"));
	member.setName(request.getParameter("name"));
	member.setEmail(request.getParameter("email"));
	member.setPassword(Integer.parseInt(request.getParameter("password")));

	boolean checkResult = false;
	boolean insertResult = false;

	Connection con1 = DBConnection.openConnection();
	WooriDAO dao1 = new WooriDAO(con1); //이건 어디서?
	checkResult = dao1.checkID(member.getId()); // 이건 어디서? 10라인 화면에서 가져온것
	DBConnection.closeConnection(con1);

	if(!checkResult){ //db에 화면의 id가 없으면
 		Connection con2 = DBConnection.openConnection();
 		WooriDAO dao2 = new WooriDAO(con2);
 		insertResult = dao2. insertData(member);
 		DBConnection.closeConnection(con2);
 
	if(insertResult){
		out.println("<script>alert('회원 생성 성공');location.href='index.html';</script>");
	}else{
		out.println("<script>alert('회원 생성 실패');location.href='index.html';</script>");
	}
	}else{	
	out.println("<script>alert('회원 생성 성공');location.href='index.html';</script>");
}
%>
