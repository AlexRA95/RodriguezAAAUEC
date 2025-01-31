package es.albarregas.models;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public class Utils {
    public static boolean validarParameters(Map<String, String[]> parametros, List<String> opcionales) {
        Boolean error = false;
        for (String s : parametros.keySet()) {
            if (parametros.get(s)[0].isEmpty() && !opcionales.contains(s)) {
                error = true;
            }
        }
        return error;
    }
}
