package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connexion {
	private static Connection con;
	private static Statement stm;
	
	public static void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/sirsalannekeltoum1";
		con=DriverManager.getConnection(url,"root","1234");
		stm=con.createStatement();
		
	}
	
	public static void disconnect() throws SQLException {
		stm.close();
		con.close();
	}
	public static int Maj (String sql) throws SQLException {
		return stm.executeUpdate(sql);
				
	}
	public static ResultSet select (String sql) throws SQLException {
		return stm.executeQuery(sql);
		
	}
	

}
