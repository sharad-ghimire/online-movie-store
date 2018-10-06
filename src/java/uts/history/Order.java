/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.history;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import uts.movies.Movie;
/**
 *
 * @author joanc
 */
@XmlRootElement(name = "order")
@XmlAccessorType(XmlAccessType.FIELD)
public class Order  implements Serializable{
//    @XmlElement(name = "orderId")
    private int orderId;
//    @XmlElement(name = "orderDate")
    private String orderDate;
//    @XmlElement(name = "movie")
    private ArrayList<Movie> movies;
//    @XmlElement(name = "name")
    private String name;
//    @XmlElement(name = "email")
    private String email;
//    @XmlElement(name = "paymentMethod")
    private String paymentMethod;
//    @XmlElement(name = "totalPrice")
    private double totalPrice;
//    @XmlElement(name = "orderStatus")
    private String orderStatus;

    public Order() {
    }
    
    public Order(int orderId, ArrayList<Movie> movies,String orderDate,String name, String email, String paymentMethod, double totalPrice, String orderStatus) {
        this.orderId = orderId;
        this.movies = movies;
        this.orderDate = orderDate;
        this.name = name;
        this.email = email;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public ArrayList<Movie> getMovies() {
        return movies;
    }

    public void setMovies(ArrayList<Movie> movies) {
        this.movies = movies;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    
    public void updateDetails(int orderId,String orderDate, ArrayList<Movie> movies, String name, String email, String paymentMethod, double totalPrice, String orderStatus){
        this.orderId = orderId;
        this.movies = movies;
        this.orderDate = orderDate;
        this.email = email;
        this.name = name;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
    }
    
    public int getNumberOfMovies(){
        return movies.size();
    }
}
