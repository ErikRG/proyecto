<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>León G. Muebles</title>

        <!-- CSS GENERAL -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css">

        <!-- RESPONSIVE -->
        <meta charset="UTF-8" name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0">
        <%@include file="plantillas/CDN.jsp"%>
        <script>
            function pedido() {
                document.form.method = "GET";
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
        <%@include file="plantillas/menu.jsp"%>
        <style>
            .cuerpaso{
                position:absolute;
                left:calc(3.6rem + 1rem);
            }
        </style>
        <div class="cuerpaso">
            <header>
                <a href="#" id="logo">
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
            <section class="cuerpo">
                <div id="demo" class="carousel slide" data-ride="carousel">
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%=request.getContextPath()%>/resources/mueble.jpg" title="Muebles para oficina">
                            <div class="carousel-caption">
                                <h3>León G.</h3>
                                <p>Muebles para oficina.</p>
                            </div>   
                        </div>
                        <div class="carousel-item">
                            <img src="<%=request.getContextPath()%>/resources/mueble1.jpg" title="Muebles para sala y comedor">
                            <div class="carousel-caption">
                                <p>Muebles para sala y comedor.</p>
                            </div>   
                        </div>
                        <div class="carousel-item">
                            <img src="<%=request.getContextPath()%>/resources/mueble2.jpg" title="Muebles de oficina moderna">
                            <div class="carousel-caption">
                                <p>Muebles de oficina moderna.</p>
                            </div>   
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </section>
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