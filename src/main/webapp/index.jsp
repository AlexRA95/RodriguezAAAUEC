<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="bootstrap" value="/CSS/bootstrap.min.css" scope="application" />
<c:url var="bootstrapJS" value="/JS/bootstrap.bundle.min.js" scope="application" />
<c:url var="estilo" value="/CSS/style.css" scope="application"/>
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application" />
<html lang="es">
<head>
    <jsp:include page="INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Men&uacute;" />
    </jsp:include>
</head>
<body>
    <c:import url="INC/header.jsp"/>

    <main class="hero">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="display-1">Operaciones CRUD</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <p class="lead">Elige una opción</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <form method="post" action="${applicationScope.contexto}/FrontController">
                        <button type="submit" name="opcion" value="inicio" class="btn btn-primary mx-2">
                            <i class="bi bi-house"></i> Inicio
                        </button>
                        <button type="submit" name="opcion" value="create" class="btn btn-primary mx-2">
                            <i class="bi bi-pencil-square"></i> Crear (Create)
                        </button>
                        <button type="submit" name="opcion" value="read" class="btn btn-primary mx-2">
                            <i class="bi bi-book"></i> Ver (Read)
                        </button>
                        <button type="submit" name="opcion" value="update" class="btn btn-primary mx-2">
                            <i class="bi bi-arrow-clockwise"></i> Modificar (Update)
                        </button>
                        <button type="submit" name="opcion" value="delete" class="btn btn-danger mx-2">
                            <i class="bi bi-trash3"></i> Borrar (Delete)
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <c:import url="INC/footer.jsp"/>
</body>
</html>
