package model;

import connexion.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.time.LocalDateTime;

public class Fabrication {
    private int idProduct;
    private String productName;
    private int quantity;
    private LocalDateTime dateFabrication;

    // Getters et Setters
    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getDateFabrication() {
        return dateFabrication;
    }

    public void setDateFabrication(LocalDateTime dateFabrication) {
        this.dateFabrication = dateFabrication;
    }

    @Override
    public String toString() {
        return "Fabrication{" +
                "idProduct=" + idProduct +
                ", productName='" + productName + '\'' +
                ", quantity=" + quantity +
                ", dateFabrication=" + dateFabrication +
                '}';
    }

    public boolean insert() {
        String query = "INSERT INTO stock (purchase_qtt, sale_qtt, date_inventory, id_product, unitary_purchase_amount) " +
                    "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = Connexion.getConnexion();
            PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, this.getQuantity());
            pstmt.setInt(2, 0); // sale_qtt = 0
            pstmt.setTimestamp(3, Timestamp.valueOf(this.getDateFabrication())); // Convertir LocalDateTime en Timestamp pour la base
            pstmt.setInt(4, this.getIdProduct());
            pstmt.setDouble(5, 0);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Afficher l'exception si une erreur se produit
            return false;
        }
    }
}
