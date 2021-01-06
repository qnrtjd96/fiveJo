<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script >
   function display_alert() {
      alert("사원정보가 삭제 되었습니다!.");
   }
</script>
<%
/********************************************************
	실습용 DB table 구조  : person 
	empno     char(4)
	empname   varchar2(20)
	deptcode  char(2)
	hiredate  char(8)
	position  char(1) 
************************************************************/

request.setCharacterEncoding("utf-8");
String szcustno;
try {
		szcustno    = null; 
	    szcustno    = request.getParameter("custno");

	    /*--------jdbc를 통해 database  연결 하기-------*/
			Class.forName("com.mysql.jdbc.Driver");
		  Connection conn = DriverManager.getConnection 
       ("jdbc:mysql://localhost:3306/JSPDB?useSSL=false&serverTimezone=UTC","root","qwer1234");
	    if(conn != null)
	    {
	 	    System.out.println("delete DB 연결  : success" + "<br>");
	    }else{
	 	    System.out.println("delete DB 연결  : fail" + "<br>");
	    };	
			java.sql.PreparedStatement stat = conn.prepareStatement
					      (" delete from member_tbl_02 where custno = ? ");
			stat.setString(1,szcustno);
			stat.executeUpdate();
			//conn.commit();
			stat.close();
			conn.close();
			response.sendRedirect("index.jsp?section=member_List.jsp");
		}
catch (Exception e) {
	out.println(e);	}
%>



