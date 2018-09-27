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
public class Orders {
    private ArrayList order = new ArrayList();
    private double numOfOrders;
    
    
    public int getItemCount() {
        return order.size();
    }
  
    public void deleteCartItem(String movieId) {
        //Find Movive with id movieId
        //delete that movie from order
        // order.remove();
        //Calculate total order calculateOrderTotal();

    }
 
 
    public void addCartItem(){
        //Get the movie from sessiion and add it to the oder
                
    }
  
    public void addCartItem(Order order) {
        this.order.add(order);
    }
  
    protected void calculateOrderTotal() {
         double dblTotal = 0;
        for(int counter=0;counter<order.size();counter++) {
              
    
          }

    }
 
  }







