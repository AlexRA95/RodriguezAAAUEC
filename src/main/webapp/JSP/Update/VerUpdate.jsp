<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Update" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-1">Ver todos los profesores</h1>
            </div>
        </div>
        <div class="row">
            <form action="${applicationScope.contexto}/Update" method="post" class="col-12 d-flex justify-content-center flex-column">
                <table class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">1º Apellido</th>
                        <th scope="col">2º Apellido</th>
                        <th scope="col">Seleccionar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty requestScope.profesores}">
                            <tr>
                                <td colspan="5" class="text-center">No hay profesores registrados todavía</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.profesores}" var="profesor" varStatus="status">
                                <tr>
                                    <td>${profesor.id}</td>
                                    <td>${profesor.nombre}</td>
                                    <td>${profesor.ape1}</td>
                                    <td>${profesor.ape2}</td>
                                    <td><input class="form-check-input" type="radio" name="profUpdate" value="${profesor.id}" ${status.first ? 'checked' : ''}> </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <button type="submit" name="opcion" value="verUpdate" class="btn btn-primary" ${empty requestScope.profesores? "disabled" : ""} >Seleccionar</button>
            </form>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>
