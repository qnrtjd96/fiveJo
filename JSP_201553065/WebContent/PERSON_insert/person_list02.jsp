<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
	<head>
  	<meta charset="UTF-8">
   	<title>Login Action</title>
  </head>
  <body>
		<form name="frmCust" action="" method="get">
		<h3>사원목록조회</h3>
		<table border="1"  >
			<tr>
				<th width="80">사원번호</th>
				<th width="80">사원이름</th>
				<th width="80">부서명</th>
				<th width="100">입사년도</th>
				<th width="60">직급</th>                               
  		</tr>  
	
	<%	           
	String szEmpno, szEmpname, szDeptcode, szHiredate, szPosition;
	szEmpno = "";
	szEmpname = "";
	try {
				Class.forName("com.mysql.jdbc.Driver");
		  	Connection conn = DriverManager.getConnection 
     		("jdbc:mysql://localhost:3306/JSPDB?useSSL=false&serverTimezone=UTC","root","1234");
	    	if(conn != null)
	    	{
	 	    	System.out.println("DB 연결  : success" + "<br>");
	    	}else{
	 	    	System.out.println("DB 연결  : fail" + "<br>");
	    	};
				java.sql.Statement stmt = conn.createStatement();
			
				ResultSet rs;
				rs = stmt.executeQuery(" select empno, empname, deptcode , hiredate, POSITION " +
                        " from person " + 
                        " order by empno asc " );
				while(rs.next()) {
					szEmpno     =  rs.getString(1);
					szEmpname   =  rs.getString(2);
					szDeptcode  =  rs.getString(3);
	       			szHiredate  =  rs.getString(4);
	        		szPosition  =  rs.getString(5);
	%> 
<%--    <!--  <a  href="person_update02.jsp?empno=<%=szEmpno%>">    
   <a  href="person_update02.jsp?empno=<%=szEmpno%>&empname=<%=szEmpname%>&deptcode=<%=szDeptcode%>&hiredate=<%=szHiredate%>&position=<%=szPosition%>"><%=szEmpno %></a></td>  -->
	 <!--   <a  href="person_update02.jsp?empno=<%=szEmpno%>&empname=<%=szEmpname%>"> <%=szEmpno%></a></td>--> --%> 	
	
	
	<tr>               
	  <td align = "center">
			 <font color="#0000ff"></font>
			   <a  href="person_update02.jsp?k_empno=<%=szEmpno%>
											&k_empname=<%=szEmpname%>
											&k_deptcode=<%=szDeptcode%>
											&k_hiredate=<%=szHiredate%>
											&k_position=<%=szPosition%>">

			   </a>
	  </td>  
	  <td align = "center"><%=szEmpname%></td>
	  <td align = "center"><%=szDeptcode%></td>
	  <td align = "center"><%=szHiredate%></td>
	  <td align = "center"><%=szPosition%></td>
	</tr>
<%
	   }
	   rs.close();
	   stmt.close();
	   conn.close();
} catch (Exception e) {
	out.println(e);
}
%>
	</table> 
	</form>
  </body>
</html>   



