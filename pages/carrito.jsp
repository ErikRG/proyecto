
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carro de compras</title>
        <%@include file="../plantillas/CDN.jsp"%>
        <link href="<%=request.getContextPath()%>/css/carrito.css" rel="stylesheet" type="text/css"/>
        <script src="<%=request.getContextPath()%>/javascript/swiper.min.js" type="text/javascript"></script>

        <link href="<%=request.getContextPath()%>/css/swiper.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function pedido() {
                document.form.method = "GET";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 4;
                document.form.submit();
            }
            function agregar_carrito(cod) {
                document.frmValidarDni.method = "GET";
                document.frmValidarDni.action = "<%=request.getContextPath()%>/controlador";
                document.frmValidarDni.op.value = 5;
                document.frmValidarDni.codPro.value = cod;
                document.frmValidarDni.submit();
            }
            function showCarrito() {
                document.frmValidarDni.method = "GET";
                document.frmValidarDni.action = "<%=request.getContextPath()%>/controlador";
                document.frmValidarDni.op.value = 100;
                document.frmValidarDni.submit();
            }
        </script>
    </head>
    <body>
        <c:set var="nomValid" scope="session" value="${rptaCarritoNombre}"/>
        <c:set var="apepValid" scope="session" value="${rptaCarritoApep}"/>
        <c:set var="apemValid" scope="session" value="${rptaCarritoApem}"/>
        <c:set var="apemValid" scope="session" value="${rptaCarritoDni}"/>
        <c:if test="${nomValid != null}">
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#validacionFirst").hide();
                });
            </script>
        </c:if>
        <%@include file="../plantillas/menu.jsp"%>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#confirmCarrito").hide();
            });
        </script>
        <style>
            #confirmCarrito{
                position:fixed;
                width:300px;
                color:#f1f1f1;
                text-align: center;
                left:calc(100% / 2 - 150px);
                top:3rem;
                background-color: rgba(0,0,0,.9);
                border-radius:2px;
                padding: 1rem;
            }
        </style>
        <div id="confirmCarrito"><span>Se agregó al carrito</span></div>
        <style>
            .cuerpaso{
                margin-left:calc(3.6rem + 1rem);
            }
            #valDni,button{
                width:150px;
                padding:5px 10px;
                outline:none;
                border:none;

            }
            button{
                background:rgba(9, 132, 227,.8);
                color:#f1f1f1;
                border-radius:0px 2px 2px 0px;
            }
            #valDni::-webkit-inner-spin-button, 
            #valDni::-webkit-outer-spin-button { 
                -webkit-appearance: none;
                -moz-appearance: none;
                -ms-appearance:none;
                -o-appearance:none;
            }
            .chk{
                position: absolute;
                font-size:5rem;
            }
            #chkTrue{
                color:#6ab04c;
            }
            #chkFalse{
                color:#c0392b;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                /*if(location.reload()){
                 $("#validacionFirst").hide();
                 }*/
                $(".chk").hide();
                $("#valDni").focus();
            });
            function validarDni() {
                var x = document.getElementById("valDni").value;
                $("#frmVal").hide();


                if (x != "" && x.length == 8) {
                    $("#chkLoading").show().fadeOut(2000);
                    var dni = $.ajax({
                        url: "https://dniruc.apisperu.com/api/v1/dni/" + x + "?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImtsdWdvQGF1dG9ub21hLmVkdS5wZSJ9.k7wYPp4qTfJvyV5AuPvWIG5nkXLAIc2rYCRbesa08jw",
                        dataType: 'json'
                    }).done(data => $("#frmValidarDni").html("<input type='hidden' name='op'><input type='hidden' name='dniValidado' value=" + data.dni + "><input type='hidden' id='campNOMBRES' name='nombres' value=" + data.nombres + "><input type='hidden' id='campapellidoPaterno' name='apep' value=" + data.apellidoPaterno + "><input type='hidden' id='campapellidoMaterno' name='apem' value=" + data.apellidoMaterno + "><input type='hidden' name='codPro'>"));

                    setTimeout(function () {
                        var nomb = document.getElementById("campNOMBRES").value;
                        var apep = document.getElementById("campapellidoPaterno").value;
                        var apem = document.getElementById("campapellidoMaterno").value;

                        if (nomb != "" && apep != "" && apem != "") {
                            $("#chkTrue").show();
                            $("#nombreUsuarioValidado").html("Bienvenido: " + nomb + " " + apep + " " + apem);
                            setTimeout(function () {
                                $("#validacionFirst").hide();
                            }, 1500);
                        } else {
                            $("#chkFalse").show();
                            setTimeout(function () {
                                $("#frmVal").show();
                                $("#chkFalse").hide();
                                document.getElementById("valDni").value = "";
                                $("#valDni").focus();
                            }, 1500);
                        }
                    }, 2500);
                } else if (x.length < 8 && x.length > 0) {
                    $("#chkDanger1").show();
                    setTimeout(function () {
                        $("#frmVal").show();
                        $("#chkDanger1").hide();
                        document.getElementById("valDni").value = "";
                        $("#valDni").focus();
                    }, 2000);
                } else {
                    $("#chkDanger").show();
                    setTimeout(function () {
                        $("#frmVal").show();
                        $("#chkDanger").hide();
                        document.getElementById("valDni").value = "";
                        $("#valDni").focus();
                    }, 1500);
                }
            }
        </script>

        <form name="form">
            <input type="hidden" name="op">
        </form>
        <form name="frmValidarDni" id="frmValidarDni">
            <input type="hidden" name="op" >
            <input type="hidden" name="codPro" >
            <input type="hidden" name="dniValidado" value="${apemValid}">
            <input type="hidden" id="nomCliente" name="nombres" value="${rptaCarritoNombre}">
            <input type="hidden" name="apep" value="${rptaCarritoApep}">
            <input type="hidden" name="apem" value="${rptaCarritoApem}">
        </form>
        <div id="validacionFirst" style="display:flex;align-items: center;color:#f1f1f1;justify-content: center;background:rgba(0,0,0,.95);position:fixed;left:0px;top:0px;z-index:5000;width:100%;height:100vh">
            <div id="frmVal" style="width:500px;display:flex;align-items: center">
                <span style="display:block">Verifique su número de DNI antes de hacer un pedido.</span>
                <input type="number" id="valDni" onKeyPress="if (this.value.length == 8)
                            return false;" placeholder="D.N.I">
                <button onclick="validarDni()">VALIDAR</button>
            </div>
            <div id="chkTrue" class="chk">
                <i class=" fa fa-check" aria-hidden="true"></i>
                <span> DNI válido</span>
            </div>

            <div id="chkFalse" class="chk">
                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                <span> DNI no válido</span>
            </div>
            <div id="chkDanger" class="chk">
                <i style="color:#f39c12" class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                <span>Digite su número de DNI</span>
            </div>
            <div id="chkDanger1" class="chk">
                <i style="color:#f39c12" class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                <span>Digite 8 números para validar su DNI</span>
            </div>
            <div id="chkLoading" class="chk">
                <div class="spinner-grow text-primary" role="status" style="width:80px;height:80px">
                </div>
                <span>Validando..</span>
            </div>
        </div>
        <div class="cuerpaso">
            <header>
                <a href="<%=request.getContextPath()%>/index.jsp" id="logo">
                    <img src="<%=request.getContextPath()%>/resources/logo.png" title="León G. Muebles">
                </a>
                <p id="fecha">
                    Fecha actual
                </p>
                <style>
                    .alert-success{
                        width: 300px;
                    }
                </style>
                <c:set var="validCar" scope="session" value="${rptaCarrito}"/>
                <c:if test="${validCar != 1}">
                    <script>
                        $(document).ready(function () {
                            setTimeout(function () {
                                $(".alert-success").slideUp();
                            }, 1500);
                        });

                    </script>
                    <div class="alert alert-success" role="alert">
                        <i class="fa fa-check-square-o" aria-hidden="true" style="color:#2ecc71"></i> Producto añadido al carrito.
                    </div>
                </c:if>
                <script>
                    var f = new Date();
                    document.write(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
                </script>
                <div id="nombreUsuarioValidado">
                    Bienvenido: ${rptaCarritoNombre} ${rptaCarritoApep} ${rptaCarritoApem}
                </div>
                    <c:if test="${nomValid != null}">
                    <div id="show_carrito">Ver carrito <a href="javascript: showCarrito()" style="font-size:30px"><i class="fa fa-cart-plus" aria-hidden="true"></i></a></div>
                        </c:if>
            </header>
            <div class="sugerencia" style="margin-left:1rem">
                <div class="swiper-container"style="height:25rem;overflow:hidden">
                    <div class="swiper-wrapper">
                        <c:forEach var="producto" items="${listaProductos}">
                            <c:if test="${producto.getCantidad_prod() > 0}">
                                <div class="swiper-slide" style="background-color:#ffffff;width:250px;" >
                                    <div style="border:1px solid #f1f1f1; border-radius:2px;margin-right: 1rem;">
                                        <figure style="height: 10rem;">
                                            <img style="width:100%;height: 10rem;" src="<%=request.getContextPath()%>/controladorIMG?code=${producto.getId_producto()}" class="card-img-top">
                                        </figure>
                                        <div class="card-body" style="padding:.5rem;background:#fff;">
                                            <h5 class="card-title">${producto.getNombre_producto()}</h5>
                                            <p class="card-text" style="font-size: 14px">Precio: S/. ${producto.getPrecio_producto()}<br> <b style="font-size: 14px"> Disponibles: ${producto.getCantidad_prod()}</b></p>
                                        </div>
                                        <script>
                                        </script>
                                        <style>
                                            .add-car .carrito-add{
                                                display:none;
                                                transition:.1s;
                                            }
                                            .add-car:hover > .carrito-add{
                                                display:block !important;
                                            }
                                        </style>
                                        <div class="card-footer" style="padding:.2rem;background:#f1f1f1;text-align:center;" >
                                            <a class="add-car" href="javascript: agregar_carrito(${producto.getId_producto()})" style="font-size:20px"><i class="fa fa-cart-plus" aria-hidden="true"></i><div class="carrito-add" style="position:absolute;left:2.5rem;width:9rem;padding:5px 10px;margin:auto;background:rgba(0,0,0,.9);color:#f1f1f1;border-radius:2px;"><small>Agregar al carrito</small></div></a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <script src="<%=request.getContextPath()%>/javascript/swiper_config.js"></script>
        </div>
        <div id="contact" style="z-index:10000;width:200px;height: 2.2rem;text-align: center;cursor:pointer;position:fixed;right: 1rem;bottom:0px;background: #2980b9;border-radius:2px 2px 0px 0px;color:#f1f1f1;padding:10px">
            <span>Contáctanos</span>
            <div id="titleChat" style="background: rgba(0,0,0,.9);width:250px;border-radius:2px;padding:5px;position:absolute;right:0rem;bottom:2.5rem;z-index:5000">
                <span style="font-size:14px;">Inicia un chat con nosotros.</span>
            </div>
        </div>
        <script>
        $(document).ready(function () {
            $("#titleChat").hide();
            $("#contact").hover(function () {
                $("#titleChat").show();
            }, function () {
                $("#titleChat").hide();
            });
            $("#chatLive").hide();
            $("#contact").click(function () {
                $("#chatLive").show(500);
                $(this).hide();
            });
            $("#hideChat").click(function () {
                $("#chatLive").hide(500);
                $("#contact").show();
            });
        });
        function sendMessage() {
            var nombreCliente = document.getElementById("nomCliente").value;
            $("#chatMensajes").text(nombreCliente + ": " + document.getElementById("msmChat").value + "\n\n\n" + "Servidor: En estos momentos no estamos disponibles." + "\n\n\n");
            document.getElementById("msmChat").value = "";
            $("#msmChat").focus();
            $("#sendMsm").prop("disabled", true);
            $("#msmChat").prop("disabled",true);
            $("#msmChat").attr("placeholder","Campo desactivado.");
            $("#block").css({
                "cursor": "not-allowed"
            });
        }
        </script>
        <style>
            #sendMsm:hover{
                background:#2c3e50 !important;
                color:#f1f1f1 !important;
            }
        </style>
        <div id="chatLive" style="overflow-y: hidden; border-radius:5px 0px 0px 5px;z-index:10000;position:absolute;bottom: 25%;right:6px;">
            <div id="hideChat" style="width:19px;display:flex;align-items: center;position:absolute;left:0px;padding:5px;background: #2c3e50;cursor:pointer;height: 100vh;"><i class="fa fa-angle-double-right" aria-hidden="true" style="color:#f1f1f1;font-size: 15px;position:absolute;top:25%"></i></div>
            <div style="padding:20px;background:#f1f1f1;width: 250px;margin-left: 1rem;">
                <textarea disabled id="chatMensajes" style="font-size: 14px;color:#000;background:#fff;border:1px solid #ccc;border-radius:2px;height: 200px;width: 100%;padding:5px;resize: none"></textarea>
                <div id="block">
                    <input id="msmChat" name="mensaje" type="text" style="outline:none;border:1px solid #ccc;border-radius:2px;width: 100%;margin-bottom:1rem;padding:5px" placeholder="Escribe un mensaje..">
                    <button onclick="sendMessage()" id="sendMsm" style="transition:.3s;outline:none;width: 100%;border:1px solid #ccc;border-radius:2px;background:rgba(255,255,255,.9);color:#000">Enviar</button>
                </div>
            </div>
        </div>
    </body>
</html>
