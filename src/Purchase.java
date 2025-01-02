package model;

import connexion.Connexion;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Purchase {
    private int idStock;
    private int idProduct;
    private String productName;
    private int purchaseQuantity;
    private double unitaryPurchasePrice;
    private double totalAmount;
    private String productDescription;
    private int idCategory;
    private String image;
    private LocalDateTime dateInventory;

    // Constructeur vide
    public Purchase() {
    }

    // Constructeur non vide
    public Purchase(int idStock, int idProduct, String productName, int purchaseQuantity, double unitaryPurchasePrice,
                    double totalAmount, String productDescription, int idCategory, String image, LocalDateTime dateInventory) {
        this.idStock = idStock;
        this.idProduct = idProduct;
        this.productName = productName;
        this.purchaseQuantity = purchaseQuantity;
        this.unitaryPurchasePrice = unitaryPurchasePrice;
        this.totalAmount = totalAmount;
        this.productDescription = productDescription;
        this.idCategory = idCategory;
        this.image = image;
        this.dateInventory = dateInventory;
    }

    // Getters et setters
    public int getIdStock() {
        return idStock;
    }

    public void setIdStock(int idStock) {
        this.idStock = idStock;
    }

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

    public int getPurchaseQuantity() {
        return purchaseQuantity;
    }

    public void setPurchaseQuantity(int purchaseQuantity) {
        this.purchaseQuantity = purchaseQuantity;
    }

    public double getUnitaryPurchasePrice() {
        return unitaryPurchasePrice;
    }

    public void setUnitaryPurchasePrice(double unitaryPurchasePrice) {
        this.unitaryPurchasePrice = unitaryPurchasePrice;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public LocalDateTime getDateInventory() {
        return dateInventory;
    }

    public void setDateInventory(LocalDateTime dateInventory) {
        this.dateInventory = dateInventory;
    }

    // Méthode d'insertion
    public boolean insert() {
        String sql = "INSERT INTO stock (purchase_qtt, sale_qtt, date_inventory, id_product, unitary_purchase_amount) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, this.getPurchaseQuantity());
            pstmt.setInt(2, 0); // Quantité vendue initialisée à 0
            pstmt.setTimestamp(3, Timestamp.valueOf(this.getDateInventory()));
            pstmt.setInt(4, this.getIdProduct());
            pstmt.setDouble(5, this.getUnitaryPurchasePrice());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Erreur lors de l'insertion de l'achat !");
            e.printStackTrace();
        }
        return false;
    }

    // Méthode pour obtenir tous les achats
    public static List<Purchase> getAll() {
        String sql = "SELECT * FROM v_purchases";
        List<Purchase> purchases = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet resultSet = pstmt.executeQuery()) {

            while (resultSet.next()) {
                Purchase purchase = new Purchase(
                        resultSet.getInt("id_stock"),
                        resultSet.getInt("id_product"),
                        resultSet.getString("product_name"),
                        resultSet.getInt("purchase_qtt"),
                        resultSet.getDouble("unitary_purchase_price"),
                        resultSet.getDouble("total_amount"),
                        resultSet.getString("product_description"),
                        resultSet.getInt("id_category"),
                        resultSet.getString("image"),
                        resultSet.getTimestamp("date_inventory").toLocalDateTime()
                );
                purchases.add(purchase);
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération de tous les achats !");
            e.printStackTrace();
        }
        return purchases;
    }

    // Méthode pour obtenir un achat par idProduct
    public static List<Purchase> getByIdProduct(int idProduct) {
        String sql = "SELECT * FROM v_purchases WHERE id_product = ?";
        List<Purchase> purchases = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idProduct);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Purchase purchase = new Purchase(
                            resultSet.getInt("id_stock"),
                            resultSet.getInt("id_product"),
                            resultSet.getString("product_name"),
                            resultSet.getInt("purchase_qtt"),
                            resultSet.getDouble("unitary_purchase_price"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getString("product_description"),
                            resultSet.getInt("id_category"),
                            resultSet.getString("image"),
                            resultSet.getTimestamp("date_inventory").toLocalDateTime()
                    );
                    purchases.add(purchase);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des achats par idProduct !");
            e.printStackTrace();
        }
        return purchases;
    }

    // Méthode pour obtenir les achats entre deux dates
    public static List<Purchase> getBetween(String dateBegin, String dateEnd) {
        String sql = "SELECT * FROM v_purchases WHERE date_inventory BETWEEN ? AND ?";
        List<Purchase> purchases = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dateBegin);
            pstmt.setString(2, dateEnd);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Purchase purchase = new Purchase(
                            resultSet.getInt("id_stock"),
                            resultSet.getInt("id_product"),
                            resultSet.getString("product_name"),
                            resultSet.getInt("purchase_qtt"),
                            resultSet.getDouble("unitary_purchase_price"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getString("product_description"),
                            resultSet.getInt("id_category"),
                            resultSet.getString("image"),
                            resultSet.getTimestamp("date_inventory").toLocalDateTime()
                    );
                    purchases.add(purchase);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des achats entre deux dates !");
            e.printStackTrace();
        }
        return purchases;
    }

    // Méthode pour obtenir les achats par idCategory
    public static List<Purchase> getByIdCategory(int idCategory) {
        String sql = "SELECT * FROM v_purchases WHERE id_category = ?";
        List<Purchase> purchases = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCategory);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Purchase purchase = new Purchase(
                            resultSet.getInt("id_stock"),
                            resultSet.getInt("id_product"),
                            resultSet.getString("product_name"),
                            resultSet.getInt("purchase_qtt"),
                            resultSet.getDouble("unitary_purchase_price"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getString("product_description"),
                            resultSet.getInt("id_category"),
                            resultSet.getString("image"),
                            resultSet.getTimestamp("date_inventory").toLocalDateTime()
                    );
                    purchases.add(purchase);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des achats par idCategory !");
            e.printStackTrace();
        }
        return purchases;
    }
}
