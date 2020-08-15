<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factura</title>
        <%@include file="../plantillas/CDN.jsp"%>
        <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script>
            $(document).ready(function () {

                var pdf = new jsPDF('p', 'pt', 'letter');
                source = $('#print')[0];

                specialElementHandlers = {
                    '#bypassme': function (element, renderer) {
                        return true;
                    }
                };
                margins = {
                    top: 30,
                    bottom: 0,
                    left: 50,
                    width: 1024
                };

                pdf.fromHTML(
                        source,
                        margins.left, // x coord
                        margins.top, {// y coord
                            'width': margins.width,
                            'elementHandlers': specialElementHandlers
                        },
                        function (dispose) {
                            pdf.save('Factura.pdf');
                        }, margins
                        );
                setTimeout(function () {
                    document.form.method = "GET";
                    document.form.action = "<%=request.getContextPath()%>/controlador";
                    document.form.op.value = 4;
                    document.form.submit();
                }, 1500)
            });
        </script>
    </head>
    <body>
        <form name="form">
            <input type="hidden" name="op">
        </form>
        <c:set var="id_factura" scope="session" value="${id_factura}"/>
        <c:set var="dniCliente" scope="session" value="${dniCliente}"/>
        <c:set var="nameCliente" scope="session" value="${nameCliente}"/>
        <c:set var="fecha_factura" scope="session" value="${fecha_factura}"/>
        <c:set var="precioTotal" scope="session" value="${precioTotal}"/>
        <style>
            table tr th{
                background:rgba(41, 128, 185,.7);
                color:#f1f1f1;
                text-align: center;
            }
            table tr td{
                /*border:1px solid #ccc;*/
                padding:10px;
            }
        </style>
        <div id="print">
            <img src="<%=request.getContextPath()%>/resources/logo.png" width="200px">
            <h3 class="display-5">Factura Leon G. Muebles para oficina.</h3>
            <div>
                <p>* Fecha de Factura: ${fecha_factura}</p>
                <p>* DNI Cliente: ${dniCliente}</p>
                <p>* Nombre Cliente: ${nameCliente}</p>
                <p>* ID Factura: ${id_factura}</p>
                <table>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                    </tr>
                    <c:forEach var="prod" items="${listaCarrito}">
                        <tr>
                            <td>${prod.getNombre_producto()}</td>
                            <td>S/. ${prod.getPrecio_producto()}</td>
                        </tr>
                    </c:forEach>
                    <tr style="background: rgba(41, 128, 185,.7);color:#f1f1f1">
                        <td>Total a pagar:</td>
                        <td><b>S/. ${precioTotal}</b></td>
                    </tr>
                </table>
                <br/><br/><br/><br/>
                <p style="font-size:12px;">_________________________________________________________</p>
                <p style="font-size:12px;">Nota: Acérquese a nuestras oficinas y presente su factura</p>
            </div>
        </div>
    </body>
</html>
