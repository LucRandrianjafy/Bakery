package controller;

import model.Category;
import model.Fabrication;
import model.ProductCategory;
import model.V_Product_Lib;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.time.LocalDateTime;

public class FabricationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ProductCategory> pc = V_Product_Lib.getAll();
        List<Category> categories = Category.getAll();

        request.setAttribute("pc", pc);
        request.setAttribute("categories", categories);
        
        request.getRequestDispatcher("/fabrication.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productIdStr = request.getParameter("idProduct");
        String quantityStr = request.getParameter("qtt");
        String dateStr = request.getParameter("date");

        try {
            int quantity = Integer.parseInt(quantityStr);

            LocalDateTime dateFabrication = LocalDateTime.parse(dateStr);

            Fabrication fabrication = new Fabrication();
            fabrication.setIdProduct(Integer.parseInt(productIdStr));
            fabrication.setQuantity(quantity);
            fabrication.setDateFabrication(dateFabrication);

            List<ProductCategory> pc = V_Product_Lib.getAll();
            List<Category> categories = Category.getAll();

            request.setAttribute("pc", pc);
            request.setAttribute("categories", categories);

            if (fabrication.insert()) {
                request.setAttribute("message", "Fabrication du produit avec succès.");
                request.getRequestDispatcher("/fabrication.jsp").forward(request, response);
            } else {
                request.setAttribute("error_message", "Les matières première pour fabriquer ce produit sont insuffisantes.");
                request.getRequestDispatcher("/fabrication.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
