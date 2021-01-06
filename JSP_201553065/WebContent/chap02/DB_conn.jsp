<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!doctype html>
<html>
	<head>
  	<meta charset="UTF-8">
   	<title>MySql DB 연동</title>
  </head>
  <body>  
  	<h3> MySql DB 연동 샘플 (Ver mysql-connector-java-8.0.17) </h3>
		<hr>
		<hr>
	<%  /* 자바 DB 연동 프로그램 */
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection 
		     ("jdbc:mysql://localhost:3306/JSPDB?useSSL=false&serverTimezone=UTC","root","qwer1234");
			if(con != null)
			{
			   out.println("Database Connect  : [ " + " <b>success</b> ]<br>");
			}else{
			   out.println("Database Connect  : [ " + " <b>fail</b> ]<br>");
			};
			/* try부터~까지 디비연결 */
			
			Statement stmt/* 변수타입, 변수명  */ = con.createStatement(); /* if뒤에 con떄문에 con.createstatement가 된거*/
			ResultSet rs = stmt.executeQuery("select sysdate(),dump from test1");
			while(rs.next()){
				out.println("Today date : " + rs.getString(1) +"----"+rs.getString(2)  +  "<hr>");
			}
			
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}		
	/* db연동할떄는 try catch를 쓴다.  */
	%>
	<footer>
		<address>
		<center>
			Web site Layout DB Connection Page.<br>
			Home page : http://www.visiongongjang.com <br>
			mobile : 010-2222-3333 <br>
		</center>
		</address>
	</footer>
	</body>
</html>	


