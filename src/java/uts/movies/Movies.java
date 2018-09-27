/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.movies;

import java.io.Serializable;
import java.text.ParseException;
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
   
    
    public void addMovie(Movie movie){
        listOfMovies.add(movie);
    }
    
    public void remove(Movie movie){
        listOfMovies.remove(movie);
    }
    
    public void addAll(ArrayList<Movie> list){
        this.listOfMovies.addAll(list);
    }
    
    public ArrayList<Movie> getMatchesForGenre(String genre){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:listOfMovies)
            if(movie.matchGenre(genre))
                matches.add(movie);
        return matches;
    }
    
    public ArrayList<Movie> getMatchesForTitle(String title){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:listOfMovies)
            if(movie.matchTitle(title))
                matches.add(movie);
        return matches;
    }
    
    public ArrayList<Movie> getMatchesForDate(String date1, String date2) throws ParseException{
        ArrayList<Movie> matches = new ArrayList<>();
        
        for(Movie movie:listOfMovies)
            if(movie.matchDate(date1, date2))
                matches.add(movie);
        return matches;
    }   
    
    /**
     *
     * @param nameOfMovie
     * @return
     */
    public Movie idChecker(String idOfMovie) {
        for (Movie movie : listOfMovies) {
            
                int id = Integer.parseInt(idOfMovie);
                if(movie.getId() == id){
                    return movie;
                } 
        }
        
        return null; 
    }
        
}