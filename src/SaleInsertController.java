package controller;

import model.Sale;
import model.V_Product_Lib;
import model.ProductCategory;

import java.util.List;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SaleInsertController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String productIdStr = request.getParameter("idProduct");
        String quantityStr = request.getParameter("sale_qtt");
        String dateStr = request.getParameter("date_inventory");

        try {
            int productId = Integer.parseInt(productIdStr);
            int quantity = Integer.parseInt(quantityStr);
            LocalDateTime dateInventory = LocalDateTime.parse(dateStr);

            Sale s = new Sale();
            s.setSaleQuantity(quantity);
            s.setDateInventory(dateInventory);
            s.setIdProduct(productId);

            if(s.insert()){
                request.setAttribute("message", "Inserted successfully");
            }else {
                request.setAttribute("error_message", "Insert goes wrong");
            }

            List<ProductCategory> pc = V_Product_Lib.getAll();
            request.setAttribute("pc", pc);
            request.getRequestDispatcher("/sale-insert.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ProductCategory> pc = V_Product_Lib.getAll();

        request.setAttribute("pc", pc);
        
        request.getRequestDispatcher("/sale-insert.jsp").forward(request, response);
        
    }
}
