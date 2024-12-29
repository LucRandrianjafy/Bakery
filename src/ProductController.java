package controller;

import model.Category;
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

public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ProductCategory> pc = V_Product_Lib.getAll();
        List<Category> categories = Category.getAll();

        request.setAttribute("pc", pc);
        request.setAttribute("categories", categories);
        
        request.getRequestDispatcher("/product.jsp").forward(request, response);
        
    }
}
