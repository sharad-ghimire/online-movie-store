/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.ass.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author srd
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movies")
public class Movies implements Serializable{
    
    @XmlElement(name = "movie")
    private ArrayList<Movie> listOfMovies = new ArrayList<Movie>();
    
    public ArrayList<Movie> getList(){
        return listOfMovies;
    }
   
    
//    public void addMovie(Movie movie){
//        this.listOfMovies.add(movie);
//    }
//    
//    public void removeMovie(Movie movie){
//        this.listOfMovies.remove(movie);
//    }
    
    public ArrayList findByTitle(String title){
        for(Movie movie: listOfMovies){
            String str1 = movie.getTitle();
            ArrayList list = new ArrayList();
            if(str1.toLowerCase().contains(title.toLowerCase())){
                list.add(str1);
            }
            return list;
        }
        return null;
    } 
    
    public ArrayList findByGenre(String genre){
        for(Movie movie: listOfMovies){
            String str1 = movie.getGenre();
            ArrayList list = new ArrayList();
            if(str1.toLowerCase().contains(genre.toLowerCase())){
                list.add(str1);
            }
            return list;
        }
        return null;
    } 
    
    
    public ArrayList findByDate(Date fromDate, Date toDate){
        
        for(Movie movie: listOfMovies){
            Date mainDate = movie.getDate();
            ArrayList list = new ArrayList();
            if(mainDate.after(fromDate) && mainDate.before(toDate)){
                list.add(movie);
            }
            return list;
        }
        return null;
    } 
}