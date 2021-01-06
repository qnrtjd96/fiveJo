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
    <th width ="80">회원번호 </th>
    <th width ="80">회원성명 </th>
	<th width ="100">전화번호 </th>
	<th width ="200">주소 </th>
	<th width ="100">가입일자</th>
	<th width ="100">고객등급 </th>
	<th width ="100">거주지역</th>
  </tr>
<%
String szcustno, szcustname, szphone, szaddress, szjoindate, szgrade, szcity;
szcustno = "";
szcustname="";
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
         rs = stmt.executeQuery("select custno,custname,phone,address,joindate,grade,city from member_tbl_02");
         while(rs.next()) {
        	 szcustno = rs.getString("custno");
        	 szcustname = rs.getString("custname");
        	 szphone = rs.getString("phone");
        	 szaddress = rs.getString("address");
        	 szjoindate = rs.getString("joindate");
        	 szgrade = rs.getString("grade");
        	 szcity = rs.getString("city");
%>
	<tr>
		<td align = "center">
			<font color="#0000ff"></font>
				<a href = "index.jsp?section=member_update.jsp?&k_custno=<%=szcustno%>
				                      						   &k_custname=<%=szcustname%>
									  						   &k_phone=<%=szphone%>
									  						   &k_address=<%=szaddress%>
									   						   &k_joindate=<%=szjoindate%>
									   						   &k_grade=<%=szgrade%>
									   						   &k_city=<%=szcity%>
									   							">
									   						  <%=szcustno%></a>								   
		</td>
		<%-- <td align = "center"><%=szEmpno %></td>--%>
		<td align = "center"><%=szcustname %></td>
		<td align = "center"><%=szphone %></td>
		<td align = "center"><%=szaddress %></td>
		<td align = "center"><%=szjoindate %></td>
		<td align = "center"><%=szgrade %></td>
		<td align = "center"><%=szcity %></td>
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