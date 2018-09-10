/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.movies;

import java.io.Serializable;
import java.util.Date;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author srd
 */

@XmlRootElement(name = "movie")
@XmlAccessorType(XmlAccessType.FIELD)
public class Movie implements Serializable{ 
    private String title;  
    private String genre; 
    private Date date;  
    private double price; 
    private int copies;
    private String status;

    public Movie() {
        super();
    }
        
    public Movie(String title, String genre, Date date, double price, int copies, String status) {
        super();
        this.title = title;
        this.genre = genre;
        this.date = date;
        this.price = price;
        this.copies = copies;
        this.status = status;
    }
    
    public void updateDetails(String title, String genre, Date date, double price, int copies, String status){
        this.title = title;
        this.genre = genre;
        this.date = date;
        this.price = price;
        this.copies = copies;
        this.status = status;
    }
    
    
    
    public boolean matchAll(String title, String genre, Date date ){
        return matchTitle(title) && matchGenre(genre) && matchDate(date);
        
    }
    
    boolean matchTitle(String title) {
        return this.title.equals(title.toLowerCase().trim());
    }

    boolean matchGenre(String genre) {
        return this.genre.equalsIgnoreCase(genre.toLowerCase().trim());
    }

    boolean matchDate(Date date) {
       // Match  ranges of date 
       return true;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCopies() {
        return copies;
    }

    public void setCopies(int copies) {
        this.copies = copies;
    }   

    
    
}
