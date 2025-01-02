package model;

import connexion.Connexion;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

public class Sale {
    private int idStock;
    private int idProduct;
    private String productName;
    private int saleQuantity;
    private double salePrice;
    private double totalAmount;
    private String productDescription;
    private int idCategory;
    private String image;
    private LocalDateTime dateInventory;

    // Constructeur vide
    public Sale() {
    }

    // Constructeur non vide
    public Sale(int idStock, int idProduct, String productName, int saleQuantity, double salePrice, double totalAmount,
                String productDescription, int idCategory, String image, LocalDateTime dateInventory) {
        this.idStock = idStock;
        this.idProduct = idProduct;
        this.productName = productName;
        this.saleQuantity = saleQuantity;
        this.salePrice = salePrice;
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

    public int getSaleQuantity() {
        return saleQuantity;
    }

    public void setSaleQuantity(int saleQuantity) {
        this.saleQuantity = saleQuantity;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
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

    // Méthode pour obtenir toutes les ventes
    public static List<Sale> getAll() {
        String sql = "SELECT * FROM v_sales";
        List<Sale> sales = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet resultSet = pstmt.executeQuery()) {

            while (resultSet.next()) {
                Sale sale = new Sale(
                        resultSet.getInt("id_stock"),
                        resultSet.getInt("id_product"),
                        resultSet.getString("product_name"),
                        resultSet.getInt("sale_qtt"),
                        resultSet.getDouble("sale_price"),
                        resultSet.getDouble("total_amount"),
                        resultSet.getString("product_description"),
                        resultSet.getInt("id_category"),
                        resultSet.getString("image"),
                        resultSet.getTimestamp("date_inventory").toLocalDateTime()
                );
                sales.add(sale);
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération de toutes les ventes !");
            e.printStackTrace();
        }
        return sales;
    }

    // Méthode pour obtenir une vente par idProduct
    public static List<Sale> getByIdProduct(int idProduct) {
        String sql = "SELECT * FROM v_sales WHERE id_product = ?";
        List<Sale> sales = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idProduct);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Sale sale = new Sale(
                            resultSet.getInt("id_stock"),
                            resultSet.getInt("id_product"),
                            resultSet.getString("product_name"),
                            resultSet.getInt("sale_qtt"),
                            resultSet.getDouble("sale_price"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getString("product_description"),
                            resultSet.getInt("id_category"),
                            resultSet.getString("image"),
                            resultSet.getTimestamp("date_inventory").toLocalDateTime()
                    );
                    sales.add(sale);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des ventes par idProduct !");
            e.printStackTrace();
        }
        return sales;
    }

    // Méthode pour obtenir les ventes entre deux dates
    public static List<Sale> getBetween(String dateBegin, String dateEnd) {
        String sql = "SELECT * FROM v_sales WHERE date_inventory BETWEEN ? AND ?";
        List<Sale> sales = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dateBegin);
            pstmt.setString(2, dateEnd);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Sale sale = new Sale(
                            resultSet.getInt("id_stock"),
                            resultSet.getInt("id_product"),
                            resultSet.getString("product_name"),
                            resultSet.getInt("sale_qtt"),
                            resultSet.getDouble("sale_price"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getString("product_description"),
                            resultSet.getInt("id_category"),
                            resultSet.getString("image"),
                            resultSet.getTimestamp("date_inventory").toLocalDateTime()
                    );
                    sales.add(sale);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des ventes entre deux dates !");
            e.printStackTrace();
        }
        return sales;
    }

    // Méthode pour obtenir les ventes par idCategory
    public static List<Sale> getByIdCategory(int idCategory) {
        String sql = "SELECT * FROM v_sales WHERE id_category = ?";
        List<Sale> sales = new ArrayList<>();

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idCategory);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Sale sale = new Sale(
                            resultSet.getInt("id_stock"),
                            resultSet.getInt("id_product"),
                            resultSet.getString("product_name"),
                            resultSet.getInt("sale_qtt"),
                            resultSet.getDouble("sale_price"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getString("product_description"),
                            resultSet.getInt("id_category"),
                            resultSet.getString("image"),
                            resultSet.getTimestamp("date_inventory").toLocalDateTime()
                    );
                    sales.add(sale);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des ventes par idCategory !");
            e.printStackTrace();
        }
        return sales;
    }
}
