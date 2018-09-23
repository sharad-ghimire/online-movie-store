/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.movies;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    private String date;  
    private double price; 
    private int copies;
    private String status;

    public Movie() {
        super();
    }
        
    public Movie(String title, String genre, String date, double price, int copies, String status) {
        super();
        this.title = title;
        this.genre = genre;
        this.date = date;
        this.price = price;
        this.copies = copies;
        this.status = status;
    }
    
    public void updateDetails(String title, String genre, String date, double price, int copies, String status){
        this.title = title;
        this.genre = genre;
        this.date = date;
        this.price = price;
        this.copies = copies;
        this.status = status;
    }
    
    
    
    public boolean matchAll(String title, String genre, String date1, String date2 ) throws ParseException{
        return matchTitle(title) && matchGenre(genre) && matchDate(date1, date2);
    }
    
    boolean matchTitle(String title) {
        return this.title.equalsIgnoreCase(title.toLowerCase().trim());
    }

    boolean matchGenre(String genre) {
        return this.genre.equalsIgnoreCase(genre.toLowerCase().trim());
    }

    boolean matchDate(String date1, String date2) throws ParseException {
       SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");  
       Date mydate = formatter1.parse(date1);  
       Date yourdate = formatter1.parse(date2);  
       Date hisdate = formatter1.parse(this.date);
       
       System.out.print(" " + hisdate );
      
       return hisdate.after(mydate) && hisdate.before(yourdate);
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
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
