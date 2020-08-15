
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Leon G</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#myModal').on('shown.bs.modal', function () {
                    $('#myInput').trigger('focus')
                });
            });
            function eliminar(codigo) {
                document.form.method = "GET";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 2;
                document.form.cod.value = codigo;
                document.form.submit();
            }
            function actualizar() {
                document.form.method = "POST";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = -1;
                document.form.submit();
            }
            function agregar() {
                document.form.method = "POST";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 3;
                document.form.submit();
            }
            function cerrar() {
                document.form.method = "POST";
                document.form.action = "<%=request.getContextPath()%>/controlador";
                document.form.op.value = 0;
                document.form.submit();
            }
        </script>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Quicksand&display=swap');

            *{
                font-family: 'Quicksand', sans-serif;

                font-size: 15px;
                text-transform: capitalize;
                outline: none;
            }
            *::-webkit-scrollbar{
                width:6px;
            }
            *::-webkit-scrollbar-thumb{
                background: #3498DB;
            }
            body{
                overflow-x: hidden;
            }
            #myInput,#myInput1{
                box-shadow: none !important;
            }
            #modalp1{
                display: block;
                width: 50%;
                border-radius: 5px;
                border:1px solid #ccc; 
                outline: none !important;
                text-transform: capitalize;
                padding:10px 13px;

            }
            #cerrar{
                font-size: 1.5em;
            }
            #exampleModalLabel{
                display: inline-block;
                margin-left: 25%;
                text-align: center;
            }
            #modallogo{
                width: 30%;

                display: inline-block;
            }
            .scroller{
                border:1px solid rgba(0,0,0,.2);
                height: 400px;
                overflow-y: auto;
            }
            table tr{
                background: rgba(255,255,255,1);    
            }
        </style>
    </head>
    <body id="body">
        <form name="form" enctype="multipart/form-data">
            <input type="hidden" name="op">
            <input type="hidden" name="cod">
            <input type="hidden" name="usuario" value="${usuario}">
            <input type="hidden" name="password" value="${password}">
            <div class="container" style="margin-top:3%;">
                <button type="button" class="btn btn-success" onclick="actualizar()">Actualizar</button>
                <button type="button" class="btn btn-danger" style="float:right !important" onclick="cerrar()">Cerrar Sessión</button>

                <div class="scroller2">
                    <h2>Administradores</h2>

                    <table id="dtVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" id="admins" style="width: 30%;">
                        <tbody>
                            <c:forEach var="adm" items="${listaAdmins}">
                                <tr>
                                    <td>${adm.getAdmin()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="container mt-3">
                <h2>Facturas</h2>
                <p>Información de las facturas</p>
                <div>
                    <input class="form-control" id="myInput1" type="text" placeholder="Buscar . ." style="display:inline-block;width: 20%; position: relative; left: 80%;">
                </div>
                <br>
                <div class="scroller">
                    <table id="dtVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>ID Factura</th>
                                <th>DNI Cliente</th>
                                <th>Nombre Cliente</th>
                                <th>Fecha de Factura</th>
                            </tr>
                        </thead>
                        <tbody id="myTable1">
                            <c:forEach var="factura" items="${listaFacturas}">
                                <tr>
                                    <td>${factura.getId_factura()}</td>
                                    <td>${factura.getDni_cliente()}</td>
                                    <td>${factura.getNameCompleto()}</td>
                                    <td>${factura.getFecha_factura()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $("#myInput1").on("keyup", function () {
                        var value = $(this).val().toLowerCase();
                        $("#myTable1 tr").filter(function () {
                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                    });
                });
            </script>
            <style>
                #del{
                    margin-left:40% !important;
                    font-size: 30px !important;
                    color:#e74c3c;
                }
            </style>

            <div class="container mt-3">
                <h2>Productos</h2>
                <p>Información de los productos</p>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <img src="<%=request.getContextPath()%>/resources/logo.png" id="modallogo">
                                <button type="button"  class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" id="cerrar">&times;</span>
                                </button>
                                <h3 class="display-1" id="exampleModalLabel">Agregar Producto</h3>
                            </div>
                            <div class="modal-body">
                                <style>
                                    label{
                                        width:4rem;
                                        text-align:center;
                                        height: 4rem;
                                        padding: 5px 10px;
                                        border:1px solid #0984e3;
                                        color:#0984e3;
                                        border-radius:2px;
                                        transition:.1s;
                                        display:inline-block;
                                    }
                                    label:hover{
                                        background:#0984e3;
                                        color:#f1f1f1;
                                    }
                                </style>
                                <input type="text" placeholder="Nombre del producto" id="modalp1" name="in_name_producto"><br>
                                <input type="number" placeholder="Precio del producto" id="modalp1" name="in_precio_producto"><br>
                                <input type="number" placeholder="Cantidad del producto" id="modalp1" name="in_cantidad_producto"><br>
                                <input type="file" name="imagen_upload" class="custom-file-input" id="customFile" hidden style="visibility: hidden">
                                <label class="" for="customFile" style="cursor:pointer"><i class="fa fa-camera" aria-hidden="true"></i></label>
                                <div id="imgPrevia" class="imagen-previa" style="overflow: hidden;width:250px;height: 250px;display:inline-block;position:absolute;top:2rem;right:2rem;"></div>
                                <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/imagen_previa_post.js"></script>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary" onclick="agregar()">Añadir Producto</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="btn btn-primary" style="margin-bottom: 1.0em;width:15%;" data-toggle="modal" data-target="#exampleModal">Agregar Producto</button>
                    <input class="form-control" id="myInput" type="text" placeholder="Buscar . ."  style="display:inline-block;width: 20%; position: relative; left: 65%;">
                </div>
                <br>
                <div class="scroller"  style="margin-bottom:3%;">
                    <table id="dtVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                        <thead style="">
                            <tr>
                                <th class="th-sm">ID Producto</th>
                                <th class="th-sm">Nombre Producto</th>
                                <th class="th-sm">Precio Producto</th>
                                <th class="th-sm">Cantidad Producto</th>
                                <th class="th-sm">Foto Producto</th>
                                <th class="th-sm" colspan="2">Acción</th>
                            </tr>
                        </thead>

                        <style>
                            #myTable .scale{
                                margin:auto;
                                width:100px;
                                background:none;
                                border:none;
                            }
                            #myTable .scale:active > .scale22{
                                visibility: visible !important; 
                            }
                            #myTable .scale .scale22{
                                visibility: hidden;
                            }
                            #myTable .scale .scale2{
                                display:flex;
                                z-index:1000;
                                position:fixed;
                                left:0px;
                                bottom:0px;
                                width:100%;
                                height:100vh;
                                align-items: center;
                                justify-content: center;
                                background:rgba(0,0,0,.95);
                            }
                        </style>
                        <tbody id="myTable">
                            <c:forEach var="producto" items="${listaProductos}">
                                <tr>
                                    <td>${producto.getId_producto()}</td>
                                    <td>${producto.getNombre_producto()}</td>
                                    <td>S/. ${producto.getPrecio_producto()} <a href="javascript: show_modal2(${producto.getId_producto()})" title="Aumentar cantidad del producto" style="float:right;color:#f39c12;font-size:3rem;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                    <td>${producto.getCantidad_prod()} <a href="javascript: show_modal(${producto.getId_producto()})" title="Aumentar cantidad del producto" style="float:right;color:#f39c12;font-size:3rem;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                    <td style="text-align:center;"><button disabled class="scale"><img src="<%=request.getContextPath()%>/controladorIMG?code=${producto.getId_producto()}" width="100%"><div class="scale2 scale22" style=""><img style="border-radius:2px;" src="<%=request.getContextPath()%>/controladorIMG?code=${producto.getId_producto()}" width="60%"></div></button></td>
                                    <td style="text-align:center;"><a href="javascript: eliminar(${producto.getId_producto()})" style="color:#c0392b;font-size:3rem;"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <script>
                        //data-toggle="modal" data-target="#exampleModalAddCantidad" 
                        $(document).ready(function () {

                        });
                        function show_modal(idpro) {
                            document.form.cod.value = idpro;
                            $("#exampleModalAddCantidad").modal('show');
                        }
                        function show_modal2(idpro) {
                            document.form.cod.value = idpro;
                            $("#exampleModalAddCantidad2").modal('show');
                        }
                        function add_cant_pro() {
                            var n = document.getElementById("add_cant").value;
                            if (n > 0) {
                                document.form.method = "GET";
                                document.form.action = "<%=request.getContextPath()%>/controlador";
                                document.form.op.value = 6;
                                document.form.submit();
                            } else {
                                alert("Digite numeros mayores a 0");
                            }
                        }
                        function changePrecio(){
                            var x = document.getElementById("change_precio").value;
                            if (x > 0) {
                                document.form.method = "GET";
                                document.form.action = "<%=request.getContextPath()%>/controlador";
                                document.form.op.value = 7;
                                document.form.submit();
                            } else {
                                alert("Digite numeros mayores a 0");
                            }
                        }
                    </script>
                    <div class="modal fade" id="exampleModalAddCantidad" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="exampleModalLabel">Aumentar cantidad disponible del producto</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <style>
                                    .modal-body #add_cant::-webkit-inner-spin-button, 
                                    .modal-body #add_cant::-webkit-outer-spin-button { 
                                        -webkit-appearance: none;
                                        -moz-appearance: none;
                                        -ms-appearance:none;
                                        -o-appearance:none;
                                    }
                                </style>
                                <div class="modal-body">
                                    <input type="number" name="can_prod" id="add_cant" onkeypress="if (this.value.length >= 2)
                                                return false;" style="padding:10px; width:80px;margin:auto">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="button" onclick="add_cant_pro()" class="btn btn-primary">Guardar Cambios</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="exampleModalAddCantidad2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="exampleModalLabel">Cambiar precio del producto</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <style>
                                    .modal-body #add_cant::-webkit-inner-spin-button, 
                                    .modal-body #add_cant::-webkit-outer-spin-button { 
                                        -webkit-appearance: none;
                                        -moz-appearance: none;
                                        -ms-appearance:none;
                                        -o-appearance:none;
                                    }
                                </style>
                                <div class="modal-body">
                                    <input type="number" name="change_precio" id="change_precio" onkeypress="if (this.value.length >= 4)
                                                return false;" style="padding:10px; width:80px;margin:auto">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="button" onclick="changePrecio()" class="btn btn-primary">Guardar Cambios</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $("#myInput").on("keyup", function () {
                        var value = $(this).val().toLowerCase();
                        $("#myTable tr").filter(function () {
                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                    });
                }
                );
            </script>
        </form>
    </body>
</html>
