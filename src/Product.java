package model;

import connexion.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Product {
    private int idProduct;
    private String name;
    private String description;
    private String image;
    private int idCategory;

    // Constructeurs
    public Product() {}

    public Product(int idProduct, String name, int idCategory) {
        this.idProduct = idProduct;
        this.name = name;
        this.idCategory = idCategory;
    }

    // Getters et Setters
    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    // Méthode pour insérer un produit dans la base de données
    public boolean insert() {
        String query = "INSERT INTO product (name, id_category) VALUES (?, ?)";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, this.name);
            pstmt.setInt(2, this.idCategory);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update() {
        String query = "UPDATE product SET name = ?, description = ?, image = ?, id_category = ? WHERE id_product = ?";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, this.getName());
            pstmt.setString(2, this.getDescription());
            pstmt.setString(3, this.getImage());
            pstmt.setInt(4, this.getIdCategory());
            pstmt.setInt(5, this.getIdProduct());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Product getById(int id) {
        String query = "SELECT * FROM product WHERE id_product = ?";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(rs.getInt("id_product"), rs.getString("name"), rs.getInt("id_category"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
