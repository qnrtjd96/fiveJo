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
	    szcustno   	 = null;
	    szcustname   = null;
	    szphone  	 = null;
	    szjoindate 	 = null;
	    szaddress  	 = null;
	    szgrade  	 = null;
	    szcity  	 = null;
	    szcustno     = request.getParameter("k_custno");
	    szcustname   = request.getParameter("k_custname");
	    szphone      = request.getParameter("k_phone");
	    szjoindate   = request.getParameter("k_joindate");
	    szaddress    = request.getParameter("k_address");
	    szgrade      = request.getParameter("k_grade");
	    szcity       = request.getParameter("k_city");
         /*--------jdbc를 통해 database 연결 하기---------- */
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection
        		("jdbc:mysql://localhost:3306/JSPDB?useSSL=false&serverTimezone=UTC","root","qwer1234");
        if(conn != null)
        {
            out.println("DB연결 : [ " + " <b>success</b> ]<br>");
        }else{
          out.println("DB연결 : [ " + " <b>fail</b> ]<br>");
        };
        
        java.sql.PreparedStatement stat =
        		 conn.prepareStatement("update member_tbl_02 " + 
        		     				   " set custname=  ? ,  " +
        		     				   "	 phone= ? ,	     " +
        		     				   "     joindate= ? ,   " +
        		     		  		   "	 address= ?      " +
        		     		           "	 grade= ?   	 " +
        		     		           "	 city= ?         " +
        				               " where custno= ?     ");
        stat.setString(1,szcustname);
        stat.setString(2,szphone);
        stat.setString(3,szjoindate);
        stat.setString(4,szaddress);
        stat.setString(5,szgrade);
        stat.setString(6,szcity);
        stat.executeUpdate();
        //conn.commit();
        stat.close();
        conn.close();
        response.sendRedirect("index.jsp?section=member_List.jsp");
    }
  catch (Exception e){
 out.println(e); }
 %>