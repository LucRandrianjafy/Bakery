package controller;

import model.Category;
import model.Product;
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

public class ProductModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productIdStr = request.getParameter("idProduct");
        int id = Integer.parseInt(productIdStr);

        ProductCategory productCategory = V_Product_Lib.getByIdProduct(id);

        List<Category> categories = Category.getAll();

        request.setAttribute("pc", productCategory);
        request.setAttribute("categories", categories);
        
        request.getRequestDispatcher("/product-modify.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("idProduct");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productImage = request.getParameter("productImage");
        String categoryId = request.getParameter("category");

        int idProduct = Integer.parseInt(productId);
        int idCategory = Integer.parseInt(categoryId);

        Product product = new Product();
        product.setIdProduct(idProduct);
        product.setName(productName);
        product.setDescription(productDescription);
        product.setImage(productImage);
        product.setIdCategory(idCategory);

        if(product.update()){
            request.setAttribute("message", "Updated successfully");
        }else {
            request.setAttribute("error_message", "Update goes wrong");
        }

        List<ProductCategory> pc = V_Product_Lib.getAll();
        List<Category> categories = Category.getAll();

        request.setAttribute("pc", pc);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/product.jsp").forward(request, response);

    }

}
