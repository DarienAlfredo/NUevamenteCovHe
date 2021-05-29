<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controlador.Usuario"%>
<%@page import="Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>

<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../assets/css/ajustes.css">

        <title>CovHe - Opciones</title>
    </head>
        <%
            Usuario usuario = new Usuario();
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");
            }
            
            String cod = request.getParameter("cod");
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/covhe?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false", "root", "Patatasfritas1");
                sta = cnx.createStatement();
                rs = sta.executeQuery("SELECT * FROM usuarios where id='"+ cod +"'");
                rs.next();
        %>
    <body id="body-pd">

        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="Admin.jsp" class="nav__logo">CovHe</a>
                    </div>
                    <div class="nav__list">

                        <a href="Admin.jsp" class="nav__link">
                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Inicio</span>
                        </a>

                        <div class="nav__link collapse ">
                            <ion-icon name="information-circle-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Informacion</span>
                            <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                            <ul class="collapse__menu">
                                <a href="informacion.jsp" class="collapse__sublink">Información</a>
                                <a href="vacuna.jsp" class="collapse__sublink">Vacunas</a>
                                <a href="https://www.who.int/es" class="collapse__sublink">OMS</a>
                            </ul>
                        </div>


                        <div class="nav__link collapse ">
                            <ion-icon name="game-controller-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Juego</span>
                            <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                            <ul class="collapse__menu">
                                <a href="cuestionario.jsp" class="collapse__sublink">Cuestionario</a>
                                <a href="crucigrama.jsp" class="collapse__sublink">Crucigrama</a>
                            </ul>
                        </div>

                        <a href="foro.jsp" class="nav__link">
                            <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Foro</span>
                        </a>

                        <a href="aplicaciones-inicio.jsp" class="nav__link">
                            <ion-icon name="apps-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Aplicaciones</span>
                        </a>

                    </div>
                </div>


                <a href="../app/salir.jsp" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav__name">Salir</span>
                </a>
            </nav>
        </div>
        <header class="header">
            <h1>Ajustes</h1>
        </header>
                <!-- En este coso ponen todo lo que va a hacer -->
                        <main class="main" style="display: block">

                    <form action="">
            <table border="1" width="250" align="ceter">
                </body>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtnombre" value="<%=rs.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Apellido: </td>
                    <td><input type="text" name="txtape" value="<%=rs.getString(3)%>"></td>
                </tr>

                <tr>
                    <td>Contraseña: </td>
                    <td><input type="text" name="txtcontra" value="<%=rs.getString(6)%>"></td>
                </tr>
                <tr>
                <input type="submit" name="btngrabar" value="Editar Usuario">
            </table>
        </form></main>
        request.getRequestDispatcher("listado.jsp").forward(request, response);
        sta.close();
        rs.close();
        cnx.close();
        }%>
        <%
            } catch (SQLException error) {
                out.print(error.toString());
            }
                if (request.getParameter("btngrabar") != null) {
                String name = request.getParameter("txtnombre");
                String ape = request.getParameter("txtape");
                String usu = request.getParameter("txtusuario");
                String correo = request.getParameter("txtcorreo");
                String contra = request.getParameter("txtcontra");
                sta.execute("update usuarios set nombre='" + name + "', apellidos='" + ape + "',   contrasennia='" + contra + "'");
                request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();
                }

        %>
                
                <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/validarAjuste.js"></script>
        <script src="../assets/js/main.js"></script>
    </body>

</html>