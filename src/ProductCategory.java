package model;

public class ProductCategory {
    private int idProduct;
    private String productName;
    private String productDescription;
    private String productImage;
    private int idCategory;
    private String categoryName;

    // Constructeur
    public ProductCategory(int idProduct, String productName, int idCategory, String categoryName, String productDescription, String productImage) {
        this.idProduct = idProduct;
        this.productName = productName;
        this.idCategory = idCategory;
        this.categoryName = categoryName;
        this.productDescription = productDescription;
        this.productImage = productImage;
    }

    public ProductCategory() {
    }

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

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    // Getter et Setter pour la productDescription
    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    // Getter et Setter pour la productImage
    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
}
