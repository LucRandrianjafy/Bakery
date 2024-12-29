package controller;

import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        Admin admin = new Admin( name, password ); 
        int userId = admin.login();

        // si login retourne true 
        if ( userId >= 0) {      
                
            // Créer ou récupérer la session
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);

            // envoie de donnees dans accueil.jsp
            request.setAttribute("name", name);
            request.getRequestDispatcher("/accueil.jsp").forward(request, response);
            
        } else {
            response.sendRedirect("/index.jsp");
        }
    }
}
