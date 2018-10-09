package uts.history;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import uts.movies.Movie;
import uts.users.User;

/**
 *
 * @author joanc
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "history")
public class History implements Serializable {

    @XmlElement(name = "order")
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

    public void addOrder(Order order) {
        orders.add(order);
    }

    public void remove(Order order) {
        orders.remove(order);
    }
    
    public ArrayList<Order> getMatchesForUser(String userEmail) {
        ArrayList<Order> matches = new ArrayList<>();
        for (Order order : orders) {
            System.out.print(order.getEmail());
            if (order.getEmail().equals(userEmail)) {
                matches.add(order);
            }
        }
        return matches;
    }

    public Boolean isMovieFinished(String movieId) {
        for (Order order : orders) {
            ArrayList<Movie> movieList = order.getMovies();
            for (Movie movie : movieList) {
                int copies = movie.getCopies();
                if (copies > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
    }

    public Order getOrderByMovieId(String id) {
        for (Order order : orders) {
            ArrayList<Movie> movieList = order.getMovies();
            for (Movie movie : movieList) {
                String movieId = movie.getId();
                if (movieId.equalsIgnoreCase(movieId)) {
                    return order;
                } else {
                    return null;
                }
            }
        }
        return null;
    }
    
    public Order getOrderByOrderId(int id) {
        for (Order order : orders) {
            
            if(order.getOrderId() == id)
            {
                return order;
            }
            
        }
        return null;
    }
    
    public boolean reserveMovie(ArrayList<Movie> movies, String name, String email, String paymentMethod, double totalPrice, String orderStatus) {
        int oderId = new Random().nextInt(1000);
        String orderDate = java.time.LocalDate.now().toString();
        System.out.print(orderDate);
        orders.add(new Order(oderId, movies, orderDate, name, email, paymentMethod, totalPrice, orderStatus));
        return true;
    }
}
