package Controlador;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
    public int logear(String us,String pass){
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int nivel = 0;
        String sql = "select nivel from usuarios where nomUsuario = '" + us + "' and contrasennia= '"+ pass+ "'";
        try {
            Class.forName(this.CLASSNAME);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                nivel = rs.getInt(1);
            }
            conn.close();;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
        
    }
    public Connection getConnection() {
        return conn;
    }
}
