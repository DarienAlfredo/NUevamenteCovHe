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

    <body id="body-pd">
        <%
            Usuario usuario = new Usuario();
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");
            }


        %>
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

                        <a href="Adminforo.jsp" class="nav__link">
                            <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Foro</span>
                        </a>

                        <a href="aplicaciones-inicio.jsp" class="nav__link">
                            <ion-icon name="apps-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Aplicaciones</span>
                        </a>
                        <div class="nav__link collapse ">
                            <ion-icon name="construct-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Administrar</span>
                            <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                            <ul class="collapse__menu">
                                <a href="Usuarios.jsp" class="collapse__sublink">Usuarios</a>
                                <a href="Publicaciones.jsp" class="collapse__sublink">Foro</a>
                                <a href="Comentarios.jsp" class="collapse__sublink">Comentarios</a>
                            </ul>
                        </div>

                    </div>
                </div>


                <a href="../app/salir.jsp" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav__name">Salir</span>
                </a>
            </nav>
        </div>
        <header class="header">
            <h1>Administrar Publicaciones</h1>
        </header>

        <!-- En este coso ponen todo lo que va a hacer -->
        <main class="main" style="display: block">

                                    <h1 align="center">Administrar Foro</h1>
        <br><br>
        <table border="1" width="1000" align="center">
            <th colspan="10" aling = "center">Lista de Publicaciones</th>

            <tr ></tr>
            <th>Id</th>
            <th>Titulo</th>
            <th>Contenido</th>


            <%
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/covhe?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false", "root", "Patatasfritas1");
                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select * from comentarios");
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString(1)%></td>  
                <td><%=rs.getString(3)%></td>  
                <td><%=rs.getString(4)%></td>  
 
                <td>
                    <a href="eliminarc.jsp?com=<%=rs.getString(1)%>">
                        <ion-icon name="trash-outline"></ion-icon>
                    </a>
                </td> 
            </tr>
            <%
                    }
                    sta.close();
                    cnx.close();
                    rs.close();
                } catch (SQLException error) {
                    out.print(error.toString());
                }

            %>
        </table>
        </main>
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/validarAjuste.js"></script>
        <script src="../assets/js/main.js"></script>
    </body>

</html>