package kr.co.farmstory2.dto;

public class OrderDTO {

    private String orderNo;
    private String orderProduct;
    private String orderCount;
    private String orderDelivery;
    private String orderPrice;
    private String orderTotal;
    private int receiver;
    private int hp;
    private int zip;
    private int addr1;
    private int addr2;
    private int orderEtc;
    private int orderUser;
    private int orderDate;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getOrderProduct() {
        return orderProduct;
    }

    public void setOrderProduct(String orderProduct) {
        this.orderProduct = orderProduct;
    }

    public String getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(String orderCount) {
        this.orderCount = orderCount;
    }

    public String getOrderDelivery() {
        return orderDelivery;
    }

    public void setOrderDelivery(String orderDelivery) {
        this.orderDelivery = orderDelivery;
    }

    public String getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(String orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(String orderTotal) {
        this.orderTotal = orderTotal;
    }

    public int getReceiver() {
        return receiver;
    }

    public void setReceiver(int receiver) {
        this.receiver = receiver;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public int getZip() {
        return zip;
    }

    public void setZip(int zip) {
        this.zip = zip;
    }

    public int getAddr1() {
        return addr1;
    }

    public void setAddr1(int addr1) {
        this.addr1 = addr1;
    }

    public int getAddr2() {
        return addr2;
    }

    public void setAddr2(int addr2) {
        this.addr2 = addr2;
    }

    public int getOrderEtc() {
        return orderEtc;
    }

    public void setOrderEtc(int orderEtc) {
        this.orderEtc = orderEtc;
    }

    public int getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(int orderUser) {
        this.orderUser = orderUser;
    }

    public int getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(int orderDate) {
        this.orderDate = orderDate;
    }
}
