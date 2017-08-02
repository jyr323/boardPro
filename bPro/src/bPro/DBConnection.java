//데이터베이스 연결에 관련된 파일
package bPro;
import java.sql.*;


public class DBConnection {
	public DBConnection() {}

	public Connection getConnection() throws ClassNotFoundException {
		
		String DB_URL = "jdbc:mysql://localhost:3306/board";
		String DB_USER = "root";
		String DB_PASSWORD= "1234";
		Connection conn;
		Statement stmt;
		try {
		 Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		 stmt = conn.createStatement();
		
		
		} catch(Exception e) {
		
		}
		return null;
		


	
	}
}
