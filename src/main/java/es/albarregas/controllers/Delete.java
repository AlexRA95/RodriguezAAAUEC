package es.albarregas.controllers;

import es.albarregas.DAO.IProfesorDAO;
import es.albarregas.DAOFactory.DAOFactory;
import es.albarregas.beans.Profesor;
import es.albarregas.models.Utils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "Delete", value = "/Delete")
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = ".";
        DAOFactory daof = DAOFactory.getDAOFactory();
        IProfesorDAO pdao = daof.getProfesorDAO();
        HttpSession sesion = request.getSession();
        Profesor profesor = null;
        if (request.getParameter("opcion").equals("verDelete")){
            //Significa que el usuario ha seleccionado un profesor para eliminar
            profesor = pdao.getOne(Integer.parseInt(request.getParameter("profDelete")));
            sesion.setAttribute("profesor", profesor);
            URL = "JSP/Delete/ConfDelete.jsp";
        }else if (request.getParameter("opcion").equals("doDelete")){
            //Significa que el usuario ha confirmado el querer borrar a ese profesor
            pdao.delete((Profesor) sesion.getAttribute("profesor"));
            URL = ".";
        } else if (request.getParameter("opcion").equals("cancelar")){
            //Significa que el usuario ha cancelado la actualización
            URL = ".";
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}