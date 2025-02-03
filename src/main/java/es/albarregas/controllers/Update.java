package es.albarregas.controllers;

import es.albarregas.DAO.IProfesorDAO;
import es.albarregas.DAOFactory.DAOFactory;
import es.albarregas.beans.Codigo;
import es.albarregas.beans.Profesor;
import es.albarregas.models.Utils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.CalendarConverter;
import org.apache.commons.beanutils.converters.DateConverter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

@WebServlet(name = "Update", value = "/Update")
public class Update extends HttpServlet {
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
        Map<String, String[]> parametros = request.getParameterMap();
        Boolean error = false;
        Codigo codigo = new Codigo();
        Profesor profesor = new Profesor();
        if (request.getParameter("opcion").equals("verUpdate")){
            //Significa que el usuario ha seleccionado un profesor para actualizar
            //Separamos el codigo del profesor en 2 partes
            String[] codigos = request.getParameter("profUpdate").split("<\\*>");
            codigo.setId(Integer.parseInt(codigos[0]));
            codigo.setTipo(codigos[1]);
            profesor = pdao.getOne(codigo);
            sesion.setAttribute("profesor", profesor);
            URL = "JSP/Update/FormUpdate.jsp";
        }else if (request.getParameter("opcion").equals("doUpdate")){
            //Significa que el usuario ha enviado el formulario de actualización
            List<String> opcionales = new ArrayList<>();
            opcionales.add("ape2");
            error = Utils.validarParameters(parametros,opcionales);

            if (!error) {
                Profesor profesorSesion = (Profesor) sesion.getAttribute("profesor");
                CalendarConverter converter = new CalendarConverter();
                converter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(converter, Calendar.class);
                try{
                    BeanUtils.populate(profesor, parametros);
                    profesor.setCodigo(profesorSesion.getCodigo());
                } catch (IllegalAccessException | InvocationTargetException e) {
                    throw new RuntimeException(e);
                }
                pdao.update(profesor);
                URL = ".";
            }else {
                request.setAttribute("error", "Todos los campos con * son obligatorios");
                URL = "JSP/Update/FormUpdate.jsp";
            }
        } else if (request.getParameter("opcion").equals("cancelar")){
            //Significa que el usuario ha cancelado la actualización
            URL = ".";

        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}