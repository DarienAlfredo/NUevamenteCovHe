
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="UTF-8" />
        <title>Aplicaciones</title>
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/covhe.css" />
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    </head>
       
    <body class="light" id="body-pd">
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
            <%
            String cod = request.getParameter("cod");
            Connection cnx = null;
            ResultSet rs = null;
            Statement sta = null;
            try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cnx = DriverManager.getConnection("jdbc:mysql://"
            + "localhost:3306/covhe?autoReconnect=true&useSSL=false","root","Patatasfritas1");//aqui van tus datos
            sta = cnx.createStatement();
        %>
            <h1>Inicio</h1>
        </header>

        <main class="main-calendar main">  
            <div class="wrapper">
                <div class="icon refresh">
                    <div class="tooltip">
                        Regresar</div>
                    <div class="button">
                        <a href="aplicaciones-inicio.jsp" class="button">
                            <span><i class='bx bx-refresh'></i></i></span>
                        </a>
                    </div>
                </div>
            </div>
            <form action="aplicaciones-formulario.jsp">
                <div class="wrapper-form wrapper">
                    <div class="title">Selecione sus Sintomas</div>
                    <div class="box">
                        <input type="checkbox" name="select1" id="option-1"  value="1"/>
                        <input type="checkbox" name="select2" id="option-2" value="2"/>
                        <input type="checkbox" name="select3" id="option-3" value="3"/>
                        <input type="checkbox" name="select4" id="option-4" value="4"/>
                        <input type="checkbox" name="select5" id="option-5" value="5"/>
                        <input type="checkbox" name="select6" id="option-6" value="6"/>
                        <input type="checkbox" name="select7" id="option-7" value="7"/>
                        <input type="checkbox" name="select8" id="option-8" value="8"/>
                        <input type="checkbox" name="select9" id="option-9" value="9"/>
                        <input type="checkbox" name="select10" id="option-10" value="10"/>
                        <input type="checkbox" name="select11" id="option-11" value="11"/>
                        <input type="checkbox" name="select12" id="option-12" value="12"/>

                        <label for="option-1" class="option-1">
                            <div class="dot"></div>
                            <div class="text">Fiebre o escalofríos</div>
                        </label>
                        <label for="option-2" class="option-2">
                            <div class="dot"></div>
                            <div class="text">Tos</div>
                        </label>
                        <label for="option-3" class="option-3">
                            <div class="dot"></div>
                            <div class="text">Dificultad para respirar</div>
                        </label>
                        <label for="option-4" class="option-4">
                            <div class="dot"></div>
                            <div class="text">Fatiga</div>
                        </label>
                        <label for="option-5" class="option-5">
                            <div class="dot"></div>
                            <div class="text">Dolores musculares y corporales</div>
                        </label>
                        <label for="option-6" class="option-6">
                            <div class="dot"></div>
                            <div class="text">Dolor de cabeza</div>
                        </label>
                        <label for="option-7" class="option-7">
                            <div class="dot"></div>
                            <div class="text">Pérdida reciente del olfato o el gusto</div>
                        </label>
                        <label for="option-8" class="option-8">
                            <div class="dot"></div>
                            <div class="text">Dolor de garganta</div>
                        </label>
                        <label for="option-9" class="option-9">
                            <div class="dot"></div>
                            <div class="text">Congestión o moqueo</div>
                        </label>
                        <label for="option-10" class="option-10">
                            <div class="dot"></div>
                            <div class="text">Náuseas o vómitos</div>
                        </label>
                        <label for="option-11" class="option-11">
                            <div class="dot"></div>
                            <div class="text">Diarrea</div>
                        </label>
                        <label for="option-12" class="option-12">
                            <div class="dot"></div>
                            <div class="text">Asintomatico</div>
                        </label>
                    </div>
                    <div class="box1">
                        <label for="option" class="option">
                            <div class="text">Enviar respuesta</div>
                        </label>
                        <input type="submit" name="btngrabar" id="option" />
                    </div>
                    <div class="calendar-footer">
                        <div class="toggle">
                            <span>Modo Oscuro</span>
                            <div class="dark-mode-switch">
                                <div class="dark-mode-switch-ident"></div>
                            </div>
                        </div>
                    </div>
                </div>
        </main>
              <%
            } catch (SQLException error) {
                out.println(error.toString());
            }
            String[] elementos = request.getParameterValues("select");
            if(elementos != null){
                for(String elemTemp : elementos){
                    System.out.print("<li>" + elemTemp + "</li>")
;                }
            }
            if(request.getParameter("btngrabar") != null){
                int uno = Integer.parseInt(request.getParameter("select1"));
                int dos = Integer.parseInt(request.getParameter("select2"));
                int tres = Integer.parseInt(request.getParameter("select3"));
                int cua = Integer.parseInt(request.getParameter("select4"));
                int cin = Integer.parseInt(request.getParameter("select5"));
                int sei = Integer.parseInt(request.getParameter("select6"));
                int sie = Integer.parseInt(request.getParameter("select7"));
                int och = Integer.parseInt(request.getParameter("select8"));
                int nue = Integer.parseInt(request.getParameter("select9"));
                int diez = Integer.parseInt(request.getParameter("select10"));
                int onc = Integer.parseInt(request.getParameter("select11"));
                int doc = Integer.parseInt(request.getParameter("select12"));
                sta.execute("insert into sintomas values ('"+uno+"','"+dos+"',"+tres+",'"+cua+"','"+cin+"','"+sei+"',"
+ "             '"+sie+"','"+och+"','"+nue+"','"+diez+"','"+onc+"','"+doc+"');");
                //request.getRequestDispatcher("aplicaciones-grafico.jsp").forward(request, response);
                sta.close();
                rs.close();
                cnx.close();
            }
        %>
        <!-- Iconos -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>
        <script src="../assets/js/form.js"></script>

    </body>
</html>

