
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>León G. Muebles</title>
        <meta charset="UTF-8">

        <!-- CSS GENERAL -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/inicio.css">

        <!-- RESPONSIVE -->
        <meta charset="UTF-8" name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0">
        

        <%@include file="../plantillas/CDN.jsp"%>
        <script>
            function pedido() {
                document.form.method = "POST";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 4;
                document.form.submit();
            }
        </script>
    </head>
    <body>
        <form name="form">
            <input type="hidden" name="op">
        </form>
        <%@include file="../plantillas/menu.jsp"%>
        <style>
            .cuerpaso{
                position:absolute;
                left:calc(3.6rem + 1rem);
            }
        </style>
        <div class="cuerpaso">
            <header>
                <a href="<%=request.getContextPath()%>/index.jsp" id="logo">
                    <img src="<%=request.getContextPath()%>/resources/logo.png" title="León G. Muebles">
                </a>
                <p id="fecha">
                    Fecha actual
                    <script>
                        var f = new Date();
                        document.write(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
                    </script>
                </p>
            </header>
            <div class="contenido">
                <div class="cont">
                    <h1>Quienes Somos:</h1>

                    <p class="quienes-somos">
                        <b>LEON G</b> comienza a echar sus raíces a inicios del 1996. 
                        José León, un gran visionario de descendencia humilde 
                        que veía amor y potencial en este mercado, trabajo arduamente 
                        hasta cumplir su más grande sueño, construir una empresa de 
                        muebles para oficina que fuera un pilar importante entre los 
                        suyos, y sirviera para así ayudar a la economía dominicana a 
                        seguir progresando, juntos.
                    </p>
                    <h2>Misión</h2>
                    <img src="<%=request.getContextPath()%>/resources/mision.png" alt=""/>
                    <p class="mision">
                        Ofrecer a nuestros clientes el mejor servicio 
                        a través de la mas alta calidad en muebles, 
                        con un trato  personalizado, e individual en 
                        la asesoría para la selección de sus muebles y 
                        distribución de los espacios. Tenemos un personal 
                        altamente capacitado con  mas de 20 anos de experiencia.
                    </p>
                    <h2>Visión</h2>
                    <img src="<%=request.getContextPath()%>/resources/vision.png" alt=""/>
                    <p class="vision">
                        No solo Ser la empresa Líder en el mercado ,
                        sino en las innovaciones de tendencias en las 
                        mercancías,  superando así las expectativas de 
                        nuestros clientes y mejorando continuamente nuestras 
                        propuestas de negocios.
                    </p>
                </div>
            </div>
            <footer>
                <div class="social">
                    <span>Contáctanos:</span>
                    <ul>
                        <li>
                            <a href="#">
                                <i id="fb" class="fa fa-facebook-official" aria-hidden="true" title="Facebook">
                                </i>
                            </a>
                        </li>
                        <li><a href="#">
                                <i id="wsp" class="fa fa-whatsapp" aria-hidden="true" title="WhatsApp">	
                                </i>
                            </a>
                        </li>
                        <li><a href="#">
                                <i id="insta" class="fa fa-instagram" aria-hidden="true" title="Instagram">
                                </i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="info">
                    <p>© León G. Todos los derechos reservados.</p>
                </div>
                <i id="up" class="fa fa-chevron-up" aria-hidden="true"></i>
            </footer>	
        </div>
    </body>
</html>