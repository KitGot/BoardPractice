package test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionTest {

    public static void main(String[] args) {
        Connection connection = null;

        try {
            // JDBC 드라이버 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            String url = "jdbc:mysql://localhost:3306/AwsProject";
            String username = "aws";
            String password = "1234";
            connection = DriverManager.getConnection(url, username, password);

            // 연결이 성공하면 메시지 출력
            System.out.println("Database connection successful!");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("JDBC Driver not found!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Database connection error!");
        } finally {
            // 연결을 닫습니다.
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}