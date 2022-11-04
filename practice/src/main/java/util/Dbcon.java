package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Dbcon {
	public Connection con = null;
	public Statement stmt = null ;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	
	public Connection getConnection() {
		String url ="jdbc:mysql://localhost:3306/project1";
		String user = "root";
		String password = "1234";
		
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,password);
			System.out.println("DB connect Success");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return con;
		
	}
	
	public void close() {
		
		try {
			if(con!=null) {con.close();}
			if(pstmt!=null) {con.close();}
			if(stmt!=null) {con.close();}
			if(rs!=null) {con.close();}
			System.out.println("DB close success");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
