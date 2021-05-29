<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo</title>
    </head>
    <body>
        <%
            String cod = request.getParameter("paso");
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/covhe?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","Patatasfritas1");
                sta = cnx.createStatement();
                sta.executeUpdate("delete from usuarios where id='"+cod+"'");
                request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();
            }
            catch(SQLException error){
                out.print(error.toString());
            }
        %>
    </body>
</html>
