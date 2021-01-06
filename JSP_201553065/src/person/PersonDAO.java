package person;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import person.PersonDTO;

public class PersonDAO {
	private Connection con;
	private String empno;
	public PersonDAO(Connection con) {
			this.con = con;
		}
		public boolean createTable() {
			PreparedStatement pstmt = null;
			boolean result = true;
			String sql = " create table Person(empno     CHAR(4) not null,    "
					   + "                    empname   VARCHAR(20),          "
					   + "                    deptcode  CHAR(2) ,           "   
					   + "                    hiredate  CHAR(8),              "
					   + "                    position  CHAR(1))             " ;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		}finally {
			if(pstmt !=null)try {pstmt.close();} catch(SQLException e) {e.getMessage();}			
		}
		return result; 
	}
		
		public boolean alterTable() {
			Statement stmt = null;
			boolean  result = true;
			String     sql1 ="alter table Person change empno CHAR(4)";
			String     sql2 ="alter table Person empname VARCHAR(20)";
			String     sql3 ="alter table Person deptcode  CHAR(2)";
			String     sql4 ="alter table Person hiredate  CHAR(8)";
			String     sql5 ="alter table Person  position  CHAR(1)";
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql1);
				stmt.executeUpdate(sql2);
				stmt.executeUpdate(sql3);
				stmt.executeUpdate(sql4);
				stmt.executeUpdate(sql5);
			} catch(SQLException e){
				result = false;
				System.out.println(e.getMessage());
			} finally {
				if(stmt != null)try {stmt.close();} catch (SQLException e) {e.getMessage();}
			}return result;		
		}
		public boolean insert(PersonDTO member) {
			PreparedStatement pstmt = null;
			boolean result = true;
			String sql = "insert into Person values(?, ?, ?, ?, ?)";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getempno());
				pstmt.setString(2, member.getempname());
				pstmt.setString(3, member.getdeptcode());
				pstmt.setString(4, member.gethiredate());
				pstmt.setString(5, member.getposition());
				pstmt.executeUpdate();
			} catch(SQLException e) {
				result = false;
				System.out.println(e.getMessage());
			} finally { 
				if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.getMessage();}
			}
			return result;
		}
		
		public boolean checkID(String id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean result = true;
			String sql = "select empno, empname, deptcode, hiredate, position from Person where empno =?";
			try { 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, empno);
				rs = pstmt.executeQuery();
				if(!rs.next()) {
					result = false;
				}
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				if(pstmt !=null)try {pstmt.close();} catch(SQLException e) {e.getMessage();}
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.getMessage();}
			}
			return result;
		}

		
		public ArrayList<PersonDTO> select(){
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<PersonDTO> array1 = new ArrayList<PersonDTO>();
			String sql = "select empno, empname, deptcode, hiredate, position from Person";
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					PersonDTO temp = new PersonDTO();
					temp.setempno(rs.getString("empno"));
					temp.setempname(rs.getString("empname"));
					temp.setdeptcode(rs.getString("deptcode"));
					temp.sethiredate(rs.getString("hiredate"));
					temp.setposition(rs.getString("position"));
					array1.add(temp);		
				}
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				if(pstmt !=null)try {pstmt.close();} catch(SQLException e) {e.getMessage();}
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.getMessage();}
			}
			return array1;
		}

		
}
