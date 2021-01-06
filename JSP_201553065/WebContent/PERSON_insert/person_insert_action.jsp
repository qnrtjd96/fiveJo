<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script>
   function display_alert(){
	   alert("사원정보가 등록 되었습니다!")
   }
</script>

<%
  request.setCharacterEncoding("utf-8");
  String szEmpno, szEmpname, szDeptcode, szHiredate, szPosition;
  try {
        szEmpno     =null;
        szEmpname   =null;
        szDeptcode  =null;
        szHiredate  =null;
        szPosition  =null;
        szEmpno     =request.getParameter("empno");
        szEmpname   =request.getParameter("empname");
        szDeptcode  =request.getParameter("deptcode");
        szHiredate  =request.getParameter("hiredate");
        szPosition  =request.getParameter("position");
        /*--------jdbc를 통해 database 연결 하기---------- */
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection
        		("jdbc:mysql://localhost:3306/JSPDB?useSSL=false&serverTimezone=UTC","root","qwer1234");
        if(conn != null)
        {
            out.println("DB연결 : [ " + " <b>success</b> ]<br>");
        }else{
          out.println("DB연결 : [ " + " <b>fail</b> ]<br>");
        };
        
        java.sql.PreparedStatement stat =
        		 conn.prepareStatement("insert into person" +
       						"(empno ,empname ,deptcode , hiredate ,position)"+
        				    "values(?,?,?,?,?)");
        stat.setString(1,szEmpno);
        stat.setString(2,szEmpname);
        stat.setString(3,szDeptcode);
        stat.setString(4,szHiredate);
        stat.setString(5,szPosition);
        stat.executeUpdate();
        //conn.commit();
        stat.close();
        conn.close();
        response.sendRedirect("person_list01.jsp");
    }
  catch (Exception e){
 out.println(e); }
 %>