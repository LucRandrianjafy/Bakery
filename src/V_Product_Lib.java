package model;

import connexion.Connexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class V_Product_Lib {

    public static List<ProductCategory> getAll() {
        List<ProductCategory> productList = new ArrayList<>();
        String query = "SELECT id_product, product_name, id_category, category_name, product_description, product_image FROM v_product_lib";

        try (Connection conn = Connexion.getConnexion();
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ProductCategory productCategory = new ProductCategory(
                    rs.getInt("id_product"),
                    rs.getString("product_name"),
                    rs.getInt("id_category"),
                    rs.getString("category_name"),
                    rs.getString("product_description"),
                    rs.getString("product_image")
                );
                productList.add(productCategory);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public static ProductCategory getByIdProduct(int idProduct) {
        String query = "SELECT id_product, product_name, id_category, category_name, product_description, product_image FROM v_product_lib WHERE id_product = ?";

        try (Connection conn = Connexion.getConnexion();
            PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, idProduct);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    
                    return new ProductCategory(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        rs.getInt("id_category"),
                        rs.getString("category_name"),
                        rs.getString("product_description"),
                        rs.getString("product_image")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


}
