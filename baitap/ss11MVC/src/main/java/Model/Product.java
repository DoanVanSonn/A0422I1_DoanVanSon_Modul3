package Model;

public class Product {
    private int idProduct;
    private  String nameProduct;
    private double priceProduct;
    private String menufactureProduct;
    private String granteeByYear;

    public Product() {
    }

    public Product(int idProduct, String nameProduct, double priceProduct, String menufactureProduct, String granteeByYear) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.menufactureProduct = menufactureProduct;
        this.granteeByYear = granteeByYear;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(double priceProduct) {
        this.priceProduct = priceProduct;
    }

    public String getMenufactureProduct() {
        return menufactureProduct;
    }

    public void setMenufactureProduct(String menufactureProduct) {
        this.menufactureProduct = menufactureProduct;
    }

    public String getGranteeByYear() {
        return granteeByYear;
    }

    public void setGranteeByYear(String granteeByYear) {
        this.granteeByYear = granteeByYear;
    }
}
