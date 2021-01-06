<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Action</title>
</head>
<body>
<form name = "frmCust" action = "" method = "get">
<h3>사원 목록 조</h3>
<table border="1">
  <tr>
    <th width ="80">사원번호 </th>
    <th width ="80">사원이름 </th>
	<th width ="80">부서명 </th>
	<th width ="100">입사년도 </th>
	<th width ="80">직급 </th>
  </tr>
<%
String szEmpno, szEmpname, szDeptcode, szHiredate, szPosition;
szEmpno  ="";
szEmpname="";

try{
     Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection
             ("jdbc:mysql://localhost:3306/JSPDB?useSSL=false&serverTimezone=UTC","root","qwer1234");
 
      if(con != null)
      {
          out.println("DB연결 : [ " + " <b>success</b> ]<br>");
      }else{
         out.println("DB연결 : [ " + " <b>fail</b> ]<br>");
      };

      Statement stmt = con.createStatement();
         ResultSet rs ;
         rs = stmt.executeQuery("select empno,empname,deptcode,hiredate,position from person");
         while(rs.next()) {
        	 szEmpno = rs.getString("empno");
        	 szEmpname = rs.getString("empname");
        	 szDeptcode = rs.getString("deptcode");
        	 szPosition = rs.getString("position");
        	 szHiredate = rs.getString("hiredate");
%>
	<tr>
		<td align = "center">
			<font color="#0000ff"></font>
				<a href = "person_update02.jsp?k_empno=<%=szEmpno%>
									   &k_empname=<%=szEmpname%>
									   &k_deptcode=<%=szDeptcode%>
									   &k_hiredate=<%=szHiredate%>
									   &k_position=<%=szPosition%>">
									   <%=szEmpno%></a>								   
		</td>
		<%-- <td align = "center"><%=szEmpno %></td>--%>
		<td align = "center"><%=szEmpname %></td>
		<td align = "center"><%=szDeptcode %></td>
		<td align = "center"><%=szHiredate %></td>
		<td align = "center"><%=szPosition %></td>
	 </tr>
   <%        
         }
         stmt.close();
         con.close();
         }catch(Exception e){
         e.printStackTrace();
      }
 %>
</table>
</form>
</body>
</html>