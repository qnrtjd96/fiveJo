<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script>
   function display_alert(){
	   alert("사원정보가 등록 되었습니다!")
   }
</script>

<%
  request.setCharacterEncoding("utf-8");
  String szcustno, szcustname, szphone, szaddress, szjoindate, szgrade, szcity;
  try {
	  szcustno     =null;
	  szcustname   =null;
	  szphone 	   =null;
	  szaddress    =null;
	  szjoindate   =null;
	  szgrade      =null;
	  szcity       =null;
	  szcustno     =request.getParameter("custno");
	  szcustname   =request.getParameter("custname");
	  szphone  	   =request.getParameter("phone");
	  szaddress    =request.getParameter("address");
	  szjoindate   =request.getParameter("joindate");
	  szgrade  =request.getParameter("grade");
	  szcity  =request.getParameter("city");
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
        		 conn.prepareStatement("insert into member_tbl_02" +
       						"(custno, custname, phone, address, joindate, grade, city)"+
        				    "values(?,?,?,?,?,?,?)");
        stat.setString(1,szcustno);
        stat.setString(2,szcustname);
        stat.setString(3,szphone);
        stat.setString(4,szaddress);
        stat.setString(5,szjoindate);
        stat.setString(6,szgrade);
        stat.setString(7,szcity);
        stat.executeUpdate();
        //conn.commit();
        stat.close();
        conn.close();
        response.sendRedirect("index.jsp?section=member_List.jsp");
    }
  catch (Exception e){
 out.println(e); }
 %>