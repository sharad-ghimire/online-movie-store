package uts.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.ArrayList;
import uts.history.History;
import uts.history.HistoryApplication;
import uts.history.Order;
import uts.movies.Movie;

@Path("/oms")
public class OMServices {

    @Context
    private ServletContext application;

    public HistoryApplication getApp() throws JAXBException, IOException, Exception {
        synchronized (application) {
            HistoryApplication historyApp = (HistoryApplication) application.getAttribute("historyApp");
            if (historyApp == null) {
                historyApp = new HistoryApplication();
                historyApp.setFilePath(application.getRealPath("WEB-INF/history.xml"));
                application.setAttribute("historyApp", historyApp);
            }
            return historyApp;
        }
    }

    @GET
    @Path("history")
    @Produces(MediaType.APPLICATION_XML)
    public History getHistory() throws IOException, Exception {
        return getApp().getHistory();
    }

    //Fetch by orderId
    @Path("/history/{orderId: [0-9]+}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Order> getOder(@PathParam("orderId") int orderId) throws IOException, Exception {
        History history = getApp().getHistory();
        ArrayList<Order> list = history.getOrders();
        ArrayList<Order> r = new ArrayList<>();
        
        for (Order o : list) {
            if (o.getOrderId() == orderId) {
                r.add(o);
            }
        }
        return r;
    }

    //Fetch by user Email
    @Path("/history/{emailOrStatus}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Order> getEmail(@PathParam("emailOrStatus") String emailOrStatus) throws IOException, Exception {     
        
        History history = getApp().getHistory();
        ArrayList<Order> list = history.getOrders();
        ArrayList<Order> r = new ArrayList<>();

        for (Order o : list) {
            if (o.getEmail().equalsIgnoreCase(emailOrStatus) || o.getOrderStatus().equalsIgnoreCase(emailOrStatus)) {
                 r.add(o);
            }
        }
        return r;
    }
    
    //fetch by movieTitle
    @Path("/history/movie/{movieTitle}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Order getMovieTitle(@PathParam("movieTitle") String movieTitle) throws IOException, Exception {
        History history = getApp().getHistory();
        ArrayList<Order> list = history.getOrders();
        for (Order o : list) {
            for (Movie movie : o.getMovies()) {
                if (movie.getTitle().equalsIgnoreCase(movieTitle)) {
                    return o;
                }
            }
        }
        return null;
    }

//    @POST
//    @Path("/order")
//    @Consumes(MediaType.APPLICATION_XML)
//    public void addOrder(Order order) throws Exception {
//        String filePath = application.getRealPath("WEB-INF/history.xml");
//        HistoryApplication hApp = getApp();
//        hApp.setFilePath(filePath);
//        History history = getApp().getHistory();
//
//        history.addOrder(order);
//        hApp.saveHistory();
////        hApp.saveHistory(history, filePath); 
//    }
}
