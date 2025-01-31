package es.albarregas.controllers;
import es.albarregas.DAO.IProfesorDAO;
import es.albarregas.DAOFactory.DAOFactory;
import es.albarregas.beans.Profesor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FrontController", value = "/FrontController")
public class FrontController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = null;
        DAOFactory daof = DAOFactory.getDAOFactory();
        IProfesorDAO pdao = daof.getProfesorDAO();
        List<Profesor> profesores = null;
        switch (request.getParameter("opcion")){
            case "create":
                URL = "JSP/Create/FormCreate.jsp";
                break;
            case "read":
            case "update":
            case "delete":
                profesores = pdao.get();
                request.setAttribute("profesores", profesores);
                if (request.getParameter("opcion").equals("read")) {
                    URL = "JSP/Read/VerProfesores.jsp";
                } else if (request.getParameter("opcion").equals("update")) {
                    URL = "JSP/Update/VerUpdate.jsp";
                } else if (request.getParameter("opcion").equals("delete")) {
                    URL = "JSP/Delete/VerDelete.jsp";
                }
                break;
            default:
                URL = ".";
                break;
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}