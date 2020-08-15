
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carro de compras </title>
        <%@include file="../plantillas/CDN.jsp"%>
        <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

        <script>
            function eliminar(cod, dni, carrito) {
                document.form.method = "GET";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 99;
                document.form.cod.value = cod;
                document.form.dniValidado.value = dni;
                document.form.carrito.value = carrito;
                document.form.submit();
            }
            function printPDF() {
                document.form.method = "GET";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 102;
                document.form.submit();
            }
            function factura() {
                document.form.method = "GET";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 101;
                document.form.submit();
            }
        </script>
    </head>
    <body style="padding-top: 2rem">
        <c:set var="precioTot" scope="session" value="${precioTotal}"/>
        <c:set var="dniCliente" scope="session" value="${dniCliente}"/>
        <c:set var="nameComplete" scope="session" value="${nameComplete}"/>
        <form name="form">
            <input type="hidden" name="op">
            <input type="hidden" name="cod">
            <input type="hidden" name="nameCompleto" value="${nameComplete}">
            <input type="hidden" name="carrito">
            <input type="hidden" name="dniValidado" value="${dniCliente}">
        </form>
        <div class="cuerpaso">
            <div class="container" id="print">
                <a href="<%=request.getContextPath()%>/controlador?op=4" style="padding:10px;background:rgba(0,0,0,.8);color:#f1f1f1;margin-bottom: 2rem !important;border-radius:2px">Seguir comprando</a>
                <br/><br/>
                <h2>Carro de compras</h2>
                <p>Información de los productos solicitados.</p> 
                <table class="table table-bordered">
                    <thead>
                        <tr style="background: rgba(44, 62, 80,.7);color:#f1f1f1;">
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <style>
                        .info_prod .info_del_car{
                            display:none;
                        }
                        .info_prod:hover >.info_del_car{
                            display:block;
                        }
                    </style>
                    <tbody>
                        <c:forEach var="prod" items="${listaCarrito}">
                            <tr>
                                <td>${prod.getNombre_producto()}</td>
                                <td>S/. ${prod.getPrecio_producto()}</td>
                                <td style="width:200px !important;text-align: center"><a class="info_prod" href="javascript: eliminar(${prod.getId_producto()},${prod.getDni()},${prod.getId_carrito()})" style="font-size:30px;color:#d63031"><i class="fa fa-minus-circle" aria-hidden="true"></i><div class="info_del_car" style="position:absolute;padding:10px;text-align: center;border-radius:2px;background:rgba(0,0,0,.9);font-size:14px !important;color:#fff">Eliminar del carrito</div></a></td>
                            </tr>
                        </c:forEach>
                        <tr id="#ignorePDF">
                            <td style="border-left: 1px solid #fff;border-bottom: 1px solid #fff;"></td>
                            <td style="border: 1px solid #ccc;background:rgba(44, 62, 80,.7);color:#f1f1f1;font-weight: 500;">Precio Total: $/. ${precioTot}</td>
                            <td style="color:#000"><a href="javascript: printPDF()">Hacer factura</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
