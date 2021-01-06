package MYDB_Sample_MVC1;

import java.sql.*;

public class DBConnection {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (ClassNotFoundException e) { 
		e.printStackTrace();
		}
	}	

public static Connection openConnection() {
	Connection con =null;
	try {
		String url="jdbc:mysql://localhost:3306/jspdb?useSSL=false&serverTimezone=UTC";
		String id ="root";
		String password = "qwer1234";
		con = DriverManager.getConnection(url,id,password);
		if(con!=null) {
			System.out.println("DB 연결 : success" + "<br>");
		}
		else {
			System.out.println("DB 연결 : fail" + "<br>");
		};
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
	return con;
	}
	

public static void closeConnection(Connection con) {
	if(con != null) {
		try {
				con.close();
				System.out.println("DB Disconnect");				
			}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	}
}