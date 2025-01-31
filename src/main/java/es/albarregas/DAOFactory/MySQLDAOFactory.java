package es.albarregas.DAOFactory;

import es.albarregas.DAO.IProfesorDAO;
import es.albarregas.DAO.ProfesorDAO;

/**
 * Fábrica concreta para la fuente de datos MySQL
 * @author Alejandro Rodr&iacute;guez &Aacute;lvarez
 */
public class MySQLDAOFactory extends DAOFactory{

    @Override
    public IProfesorDAO getProfesorDAO() {return new ProfesorDAO();}
}
