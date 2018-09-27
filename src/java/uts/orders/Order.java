/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.orders;

import java.util.ArrayList;

/**
 *
 * @author srd
 */
public class Order {
    
//    
//    <Order>
//        <OrderID>100</OrderID>
//        
//       
//        <Title>Mission</Title>
//        <Genre>Action</Genre>
//        <ReleaseDate>1996</ReleaseDate>
//        <Price>20</Price>
//        <Copies>1</Copies>
//       
//        
//        
//        <ID>1111</ID>
//        <Email>a@b.com</Email>
//        <FullName>A B</FullName>
//        <PaymentMethod>Visa</PaymentMethod>
//        <SalesTotal>50</SalesTotal>
//        <OrderStatus>Cancelled</OrderStatus>
//    </Order>
    
    public String orderId;
    public String userName;
    public ArrayList<String> movieIds;
    

    public Order(String orderId, String userName) {
        this.orderId = orderId;
        this.userName = userName;
        movieIds = new ArrayList<>();
    }
    
    

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public ArrayList<String> getMovieIds() {
        return movieIds;
    }

    public void setMovieIds(ArrayList<String> movieIds) {
        this.movieIds = movieIds;
    }
    
    
    
    
    
    
    
    
    
    
    
}
