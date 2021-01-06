<%@page import="MYDB_Sample_MVC1.DBConnection"%>
<%@page import="MYDB_Sample_MVC1.WooriDAO"%>
<%@page import="MYDB_Sample_MVC1.WooriDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든회원정보조회</title>
</head>
<body>
<h3>우리회원 정보 보기</h3>
<table border="1">
  <tr>
     <th>사용자 ID</th>
     <th>이름</th>
     <th>E-mail</th>
  </tr>   
    <%
      ArrayList<WooriDTO> array1 = new ArrayList<WooriDTO>();
      Connection con = DBConnection.openConnection();
      WooriDAO dao1 = new WooriDAO(con);		  
      array1 = dao1.selectAllDATE();
      DBConnection.closeConnection(con);
      if(array1.size() == 0){
    %>
  <tr><td colspan=4>등록된 회원이 없습니다.</td></tr>
    <% 
      }else{
    	  for(int i=0;i<array1.size();i++){
            WooriDTO temp = array1.get(i);
    %>
    <tr>
     <th><%=temp.getId()%></th>
     <th><%=temp.getName()%></th>
     <th><%=temp.getEmail()%></th>
    </tr>   
     <%
    	  }
       }    
     
     %>

</table>
[<a href="index.html">main으로]</a>&nbsp;[<a href="insert.html">회원등록 페이지로</a>]





</body>
</html>