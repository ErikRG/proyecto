<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrador</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/login.css">

        <!-- RESPONSIVE -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- BOOTSTRAP CDN ICONS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <!-- BOOSTSTRAP W3SCHOOL -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#usuario").on("click", function () {
                    $("#rojo").fadeOut(500);
                    $("#invalid").fadeOut(500);
                });
                $("#password").on("click", function () {
                    $("#rojo").fadeOut(500);
                    $("#invalid").fadeOut(500);
                });
            });
            function validar() {
                var id = document.getElementById("usuario").value;
                var pass = document.getElementById("password").value;
                if (id != "" && pass != "") {
                    document.form.method = "POST";
                    document.form.action = "<%=request.getContextPath()%>/controlador";
                    document.form.op.value = 1;
                    document.form.submit();
                } else {
                    $("#rojo").show();
                }
            }
        </script>
    </head>
    <body>
        <form name="form">
            <input type="hidden" name="op">
            <div class="contenedor">
                <table class="login">
                    <tr>
                        <td colspan="2">
                            <h1>Iniciar sesión</h1>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usuario"><i class="fa fa-user" aria-hidden="true"></i></label>
                            <input type="text" id="usuario" name="txtUsu" maxlength="15" placeholder="Usuario">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="password"><i class="fa fa-lock" aria-hidden="true"></i></label>
                            <input type="password" id="password" name="txtPass" maxlength="15" placeholder="Contraseña">
                        </td>
                    </tr>
                    <tr class="row3">
                        <td colspan="2">
                            <input type="button" onclick="validar()" value="Ingresar" id="validar123">
                        </td> 
                    </tr>
                </table>
                <style>
                    #rojo{
                        display:none;
                    }
                </style>
                <div id="rojo" class="alert alert-danger" role="alert">
                    Complete todos los campos, es obligatorio.
                </div>
                <c:set var="usuario" scope="session" value="${r}"/>
                <c:if test="${usuario != 2}">
                    <div id="invalid" class="alert alert-danger" role="alert">
                        Usuario o contraseña incorrecta, inténtelo de nuevo.
                    </div>
                </c:if>
            </div>
        </form>
    </body>
</html>
