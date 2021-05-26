package Controlador;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    String USERNAME = "root";
    String PASSWORD = "Patatasfritas1";
    String HOST = "localhost";
    String PORT = "3306";
    String DATABASE = "covhe";
    String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE+"?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    Connection conn;

    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException error) {
            out.print(error.toString());
        }
    }
    
    public Connection getConnection() {
        return conn;
    }
}
