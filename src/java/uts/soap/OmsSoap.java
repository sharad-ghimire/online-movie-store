/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.soap;

import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import uts.history.HistoryApplication;
import uts.history.Order;
import uts.movies.Movie;
import uts.movies.MovieApplication;
import uts.movies.Movies;
import uts.users.User;
import uts.users.UserApplication;
import uts.users.Users;

/**
 *
 * @author pramishluitel
 */
@WebService(serviceName = "omsSoap")
public class OmsSoap {

    /**
     * This is a sample web service operation
     */
    @Resource
    private WebServiceContext context;

    public MovieApplication getMovieApp() throws JAXBException, IOException {
        ServletContext app = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (app) {
            MovieApplication movieApp = (MovieApplication) app.getAttribute("movieApp");
            if (movieApp == null) {
                movieApp = new MovieApplication();
                movieApp.setFilePath(app.getRealPath("WEB-INF/movies.xml"));
                app.setAttribute("movieApp", movieApp);
            }
            return movieApp;
        }
    }
    public HistoryApplication getHistoryApp() throws JAXBException, IOException {
        ServletContext app = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (app) {
            HistoryApplication historyApp = (HistoryApplication) app.getAttribute("historyApp");
            if (historyApp == null) {
                historyApp = new HistoryApplication();
                historyApp.setFilePath(app.getRealPath("WEB-INF/history.xml"));
                app.setAttribute("historyApp", historyApp);
            }
            return historyApp;
        }

    }
    public UserApplication getUserApp() throws Exception {
        ServletContext app = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (app) {
            UserApplication getUserApp = (UserApplication) app.getAttribute("getUserApp");
            if (getUserApp == null) {
                getUserApp = new UserApplication();
                getUserApp.setFilePath(app.getRealPath("WEB-INF/users.xml"));
                app.setAttribute("getUserApp", getUserApp);
            }
            return getUserApp;
        }
    }
 @WebMethod(operationName = "getuser")
    public Users getUser() throws Exception {
        return getUserApp().getUsers();
    }

    @WebMethod(operationName = "login")
    public User getLogin(String email, String password) throws Exception, JAXBException, IOException {
        return getUserApp().getUsers().login(email, password);
    }

//    @WebMethod
//    public ArrayList<Movie> getMovies() throws JAXBException, IOException {
//        Movies movies = getMovieApp().getMovies();
//        ArrayList<Movie> match = movies.getList();
//        return match;
//    }

    @WebMethod
    public void deleteUser(User user) throws Exception {
        UserApplication UserApp = getUserApp();
        UserApp.getUsers().removeUser(user);
        //UserApp.saveUsers(user, getUserApp);
    }

    @WebMethod
    public void cancelOrder(String orderID) throws JAXBException, IOException {
        HistoryApplication historyApp = getHistoryApp();
        historyApp.getHistory().getOrderByMovieId(orderID).setOrderStatus("Cancelled");
        historyApp.saveHistory();
    }

//    @WebMethod
//    public ArrayList<Order> getOrderStatus(String userID, String status) throws JAXBException, IOException {
//        HistoryApplication historyApp = getHistoryApp();
//        ArrayList<Order> matches = historyApp.getHistory().getMatchesForUser(userID);
//        return matches;
//    }
//
//    @WebMethod
//    public Order getOrdersByTitle(String movieTitle) throws Exception, IOException, NullPointerException {
//        HistoryApplication historyApp = getHistoryApp();
//        Order matches = historyApp.getHistory().getOrderByMovieTitle(movieTitle);
//        return matches;
//    }

    @WebMethod
    public HistoryApplication getApp() throws JAXBException, IOException {
        HistoryApplication historyApp = getHistoryApp();
        return historyApp;
    }

//    public void orderMovie(Order order, ArrayList<Movie> purchaseMovie) throws JAXBException, IOException {
//        HistoryApplication historyApp = getHistoryApp();
//        order.se
//    }   
}
