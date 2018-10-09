/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.soap;

import java.io.*;
import java.util.*;
import java.util.LinkedList;
import javax.annotation.*;
import javax.jws.*;
import javax.servlet.*;
import javax.xml.bind.*;
//import javax.jws.WebMethod;
//import javax.jws.WebParam;
import javax.xml.ws.*;
import javax.xml.ws.handler.*;
import uts.history.*;
import uts.movies.*;
//import uts.users.User;
import uts.users.*;
//import uts.users.Users;

/**
 *
 * @author pramishluitel
 */
@WebService(serviceName = "MovieStoreSoap")
public class MovieStoreSoap {

    @Resource
    private WebServiceContext context;

    /**
     * This is a sample web service operation
     */
//    @WebMethod(operationName = "hello")
//    public String hello(@WebParam(name = "name") String txt) {
//        return "Hello " + txt + " !";
//    }
    public MovieApplication getApp() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            MovieApplication movieApp = (MovieApplication) application.getAttribute("movieApp");
            if (movieApp == null) {
                movieApp = new MovieApplication();
                movieApp.setFilePath(application.getRealPath("WEB-INF/movies.xml"));
                application.setAttribute("movieApp", movieApp);
            }
            return movieApp;
        }
    }

    public HistoryApplication getHistoryApp() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
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

    public UserApplication getuserApp() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            UserApplication userApp = (UserApplication) application.getAttribute("userApp");
            if (userApp == null) {
                userApp = new UserApplication();
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("userApp", userApp);
            }
            return userApp;
        }
    }

    @WebMethod
    public Users fetchUsers() throws IOException, Exception, NullPointerException {
        return getuserApp().getUsers();
    }

    @WebMethod
    public User fetchLogin(String email, String password) throws IOException, Exception, NullPointerException {
        return getuserApp().getUsers().login(email, password);
    }

    @WebMethod
    public ArrayList<Movie> fetchMovies() throws IOException, Exception, NullPointerException {
        Movies movieList = getApp().getMovies();
        ArrayList<Movie> matchMovies = movieList.getList();
        return matchMovies;
    }

    @WebMethod
    public void deleteUser(User user) throws IOException, Exception, NullPointerException {
        UserApplication userApp = getuserApp();
        userApp.getUsers().removeUser(user);
    }

    @WebMethod
    public Order matchID(String orderID) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        Order ID = historyApp.getHistory().getOrderByMovieId(orderID);
        return ID;
        //Order orderId = historyApp.getHistory().getOrderByMovieId(orderID);
        //return orderId;
    }

    @WebMethod
    public void cancelMovieOrder(String orderID) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        historyApp.getHistory().getOrderByMovieId(orderID).setOrderStatus("Cancelled");
        historyApp.saveHistory();
    }

    @WebMethod
    public ArrayList<Order> getOrderByorderID(String email) throws IOException, NullPointerException, Exception {
        HistoryApplication historyApp = getHistoryApp();
        ArrayList<Order> matchOrderID = historyApp.getHistory().getMatchesForUser(email);
        return matchOrderID;
    }

    @WebMethod
    public ArrayList<Order> getOrderByTitle(String title) throws IOException, Exception, NullPointerException {
        HistoryApplication historyApp = getHistoryApp();
        ArrayList<Order> matchOrderTitle = historyApp.getHistory().getMatchesForUser(title);
        return matchOrderTitle;
    }

//    public void movieOrder(Order order, ArrayList<Movie> moviePurchase) throws IOException, Exception, NullPointerException {
//        HistoryApplication historyApp = getHistoryApp();
//        order.s
//    }

//    public ArrayList<Order> getOrderStatus(String orderID, String status) throws IOException, Exception, NullPointerException {
//        HistoryApplication historyApp = getHistoryApp();
//        ArrayList<Order> matchStatus = historyApp.getHistory().
//    }
}
