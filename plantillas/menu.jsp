
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/menu.js"></script>
<div class="menu">
    <ul class="lista"><li><a href="<%=request.getContextPath()%>/index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Principal</a></li>
        <li><a href="<%=request.getContextPath()%>/pages/inicio.jsp"><i class="fa fa-info-circle" aria-hidden="true"></i>Nosotros</a></li>
        <li><a href="<%=request.getContextPath()%>/controlador?op=4"><i class="fa fa-shopping-bag" aria-hidden="true"></i>Tienda en linea</a></li>
        <li class="info"><a target="_blank" href="<%=request.getContextPath()%>/controlador?op=0"><i class="fa fa-lock" aria-hidden="true"></i>Administrador</a></li>
    </ul>
</div>