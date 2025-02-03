<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Create" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-1">Formulario de Actualizaci&oacute;n de usuario</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <c:if test="${not empty requestScope.error}">
                    <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                    </div>
                </c:if>
                <form method="post" action="${applicationScope.contexto}/Update">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre *</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="${sessionScope.profesor.nombre}">
                    </div>
                    <div class="mb-3">
                        <label for="ape1" class="form-label">Primer Apellido *</label>
                        <input type="text" class="form-control" id="ape1" name="ape1" value="${sessionScope.profesor.ape1}">
                    </div>
                    <div class="mb-3">
                        <label for="ape2" class="form-label">Segundo Apellido</label>
                        <input type="text" class="form-control" id="ape2" name="ape2" value="${sessionScope.profesor.ape2}">
                    </div>
                    <div class="mb-3">
                        <label for="escala" class="form-label">Escala *</label>
                        <select class="form-select" id="escala" name="escala">
                            <option value="S" ${sessionScope.profesor.escala == 'S' ? 'selected' : ''}>S</option>
                            <option value="T" ${sessionScope.profesor.escala == 'E' ? 'selected' : ''}>T</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="fecha" class="form-label">Fecha *</label>
                        <input type="date" class="form-control" id="fecha" name="fecha" value="${sessionScope.profesor.fecha}">
                    </div>
                    <button type="submit" class="btn btn-primary" name="opcion" value="doUpdate">Actualizar</button>
                    <button type="submit" class="btn btn-danger" name="opcion" value="cancelar">Cancelar</button>
                </form>
            </div>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>
