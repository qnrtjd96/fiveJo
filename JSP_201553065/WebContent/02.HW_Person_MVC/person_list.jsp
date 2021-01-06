<%@page import="person.DBConnection"%>
<%@page import="person.PersonDAO"%>
<%@page import="person.PersonDTO"%>
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
     <th>사용자 번호</th>
     <th>사용자 이름</th>
     <th>부서코드</th>
     <th>입사일</th>
     <th>포지션</th>
  </tr>   
    <%
      ArrayList<PersonDTO> array1 = new ArrayList<PersonDTO>();
      Connection con = DBConnection.openConnection();
      PersonDAO dao1 = new PersonDAO(con);		  
      array1 = dao1.select();
      DBConnection.closeConnection(con);
      if(array1.size() == 0){
    %>
  <tr><td colspan=4>등록된 회원이 없습니다.</td></tr>
    <% 
      }else{
    	  for(int i=0;i<array1.size();i++){
    		  PersonDTO temp = array1.get(i);
    %>
    <tr>
     <th><%=temp.getempno()%></th>
     <th><%=temp.getempname()%></th>
     <th><%=temp.getdeptcode()%></th>
     <th><%=temp.gethiredate()%></th>
     <th><%=temp.getposition()%></th>   
    </tr>   
     <%
    	  }
       }    
     
     %>

</table>
[<a href="index_person.jsp">main으로]</a>&nbsp;[<a href="insert_person.jsp">회원등록 페이지로</a>]





</body>
</html>