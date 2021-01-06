<%@page import="MYDB_Sample_MVC1.DBConnection"%>
<%@page import="MYDB_Sample_MVC1.WooriDAO"%>
<%@page import="MYDB_Sample_MVC1.WooriDTO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 확인 화면</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
   		String id = request.getParameter("id");
   		int password = Integer.parseInt(request.getParameter("password"));
   		String passwordString = Integer.toString(password);
   		WooriDTO member = new WooriDTO();
   		
   		Connection con = DBConnection.openConnection();
   		WooriDAO dao1 = new WooriDAO(con);
   		member = dao1.selectIdDate(id);
   		DBConnection.closeConnection(con);
   		
   		if(member.getId() == null){
   			    	out.println("<script>('해당되는 인원이 없습니다.');location.href='select.html'</script>");
   		}else{
   			 	if(password == member.getPassword()){
 %>
   			 	사용자 ID가<%=id%> 인 회원의 정보는 다음과 같습니다
   			 	정보를 변경하려면 내용을 입력한 다음 [수정하기] 버튼을 누르세요.
   			 	<form action="update.jsp" method="post" name="form1">
   			 	  <input type ="hidden" name="name" value="<%=id%>"><br>
   			 	     이름: <input type ="text" name="name" value="<%=member.getName()%>"><br>
   			 	  E-mail: <input type ="text" name="eail" value="<%=member.getEmail()%>">
   			 	  <input type ="hidden" name="password" value=<%=passwordString%>>
   			 	  <input type ="submit" name="change" value="수정하기">
   			 	  <a href="delete.jsp?id=<%=id%>">삭제하기</a>
   			 	</form>
   			 	<%
   			 	}else{
   			 			out.println("<script>('비밀번호가 틀립니다..');location.href='select.html'</script>");
   			 	}
   		}
   %>
</body>
</html>