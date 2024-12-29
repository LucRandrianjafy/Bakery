package model;

import connexion.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Category {
    private int id;
    private String name;

    // Constructeur par défaut
    public Category() {}

    // Constructeur avec paramètres
    public Category(String name) {
        this.name = name;
    }

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // Méthode pour insérer une catégorie
    public boolean insert() {
        String query = "INSERT INTO category (name) VALUES (?)";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, this.getName());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Méthode pour récupérer une catégorie par son ID
    public static Category getById(int id) {
        String query = "SELECT id_category, name FROM category WHERE id_category = ?";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Category(rs.getInt("id_category"), rs.getString("name"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Méthode pour récupérer toutes les catégories
    public static List<Category> getAll() {
        String query = "SELECT id_category, name FROM category";
        List<Category> categories = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                categories.add(new Category(rs.getInt("id_category"), rs.getString("name")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
