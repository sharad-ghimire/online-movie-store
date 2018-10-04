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
@XmlRootElement(name = "Order")
@XmlAccessorType(XmlAccessType.FIELD)
public class Order  implements Serializable{

    @XmlElement(name = "OrderID")
    private int orderID;
    @XmlElement(name = "movie")
    private ArrayList<Movie> movies;
    @XmlElement(name = "FullName")
    private String fullName;
    @XmlElement(name = "Email")
    private String email;
    @XmlElement(name = "PaymentMethod")
    private String paymentMethod;
    @XmlElement(name = "TotalPrice")
    private int totalPrice;
    @XmlElement(name = "OrderStatus")
    private String orderStatus;

    public Order() {
    }
    
    public Order(int orderID, ArrayList<Movie> movies, String fullName, String email, String paymentMethod, int totalPrice, String orderStatus) {
        this.orderID = orderID;
        this.movies = movies;
        this.fullName = fullName;
        this.email = email;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public ArrayList<Movie> getMovies() {
        return movies;
    }

    public void setMovies(ArrayList<Movie> movies) {
        this.movies = movies;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    public void updateDetails(int orderID, ArrayList<Movie> movies, String fullName, String email, String paymentMethod, int totalPrice, String orderStatus)
    {
        this.orderID = orderID;
        this.movies = movies;
        this.email = email;
        this.fullName = fullName;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
    }
    
    public int getNumberOfMovies(){
        return movies.size();
    }
}
