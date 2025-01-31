<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Delete" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-1">Confirmar borrar</h1>
            </div>
        </div>
        <div class="row">
            <form action="${applicationScope.contexto}/Delete" method="post" class="col-12 d-flex justify-content-center flex-column">
                <div class="card">
                    <div class="card-header">
                        Profesor ID: ${sessionScope.profesor.id}
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${sessionScope.profesor.nombre} ${sessionScope.profesor.ape1} ${sessionScope.profesor.ape2}</h5>
                        <p class="card-text">Nombre: ${sessionScope.profesor.nombre}</p>
                        <p class="card-text">Apellido 1: ${sessionScope.profesor.ape1}</p>
                        <p class="card-text">Apellido 2: ${sessionScope.profesor.ape2}</p>
                    </div>
                </div>
                <button type="submit" name="opcion" value="doDelete" class="btn btn-primary" >Borrar</button>
                <button type="submit" name="opcion" value="cancelar" class="btn btn-danger" >Cancelar</button>
            </form>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>
