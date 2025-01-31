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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Create", value = "/Create")
public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = ".";
        DAOFactory daof = DAOFactory.getDAOFactory();
        Boolean error = false;
        IProfesorDAO pdao = daof.getProfesorDAO();
        Map<String, String[]> parametros = request.getParameterMap();
        Profesor profesor = new Profesor();

        List<String> opcionales = new ArrayList<>();
        opcionales.add("ape2");
        error = Utils.validarParameters(parametros,opcionales);

        if (!error) {
            try{
                BeanUtils.populate(profesor, parametros);
            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new RuntimeException(e);
            }
            pdao.add(profesor);
        }else {
            request.setAttribute("error", "Todos los campos con * son obligatorios");
            URL = "JSP/Create/FormCreate.jsp";
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}