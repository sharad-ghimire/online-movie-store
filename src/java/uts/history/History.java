/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.history;

import java.util.ArrayList;

/**
 *
 * @author joanc
 */
public class History {
    private ArrayList<Order> orders;

    public History() {
    }

    public History(ArrayList<Order> orders) {
        this.orders = orders;
    }

    public ArrayList<Order> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<Order> orders) {
        this.orders = orders;
    }
    
    public void addOrder(Order order){
        orders.add(order);
    }
    
    public void remove(Order order){
        orders.remove(order);
    }
    
    public ArrayList<Order> getMatchesForUser(String userEmail)
    {
        ArrayList<Order> matches = new ArrayList<>();
        for(Order order:orders)
            if(order.getEmail().equals(userEmail))
                matches.add(order);
        return matches;
    }
    
    
    
    
}
