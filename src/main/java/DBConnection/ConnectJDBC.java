package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectJDBC {
//	private final String serverName = "LAPTOP-EC6KMGRU";
	private final String serverName = "MSI";
	private final String dbName = "ShopBanAoQuan";
	private final String portNumber = "1433";
	private final String username = "sa";
	private final String password = "123456789";
	
	
	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";encrypt=false;databaseName=" + dbName;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, username, password);
	}
//	public static void main(String[] args) {
//		try {
//			Connection conn = new ConnectJDBC().getConnection();
//			System.out.print("thành công");
//		}
//		catch (Exception e) {
//			System.out.print("fail");
//		}
//			
//	}
}
