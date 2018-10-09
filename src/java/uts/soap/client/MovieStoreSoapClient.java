/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.soap.client;

//import In;
import java.util.LinkedList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pramishluitel
 */
public class MovieStoreSoapClient {

    public static void main(String[] args) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        MovieStoreSoap_Service locator = new MovieStoreSoap_Service();
        MovieStoreSoap soap = locator.getMovieStoreSoapPort();
        MovieStoreSoapClient soapClient = new MovieStoreSoapClient();
        User user = soap.fetchLogin(soapClient.fetchEmail(), soapClient.fetchPassword());
        if (user != null) {
            System.out.println("Welcome " + user.getEmail() + " to the OMS.");
        } else {
            System.out.println("User does not exist. Please enter the correct details");
        }
        soapClient.clientMenu(soapClient, user);
    }

    public String fetchEmail() {
        System.out.print("Please enter your email: ");
        return In.nextLine();
    }

    public String fetchPassword() {
        System.out.print("Enter your password: ");
        return In.nextLine();
    }

    public void userLogout(MovieStoreSoapClient soapClient, User user) {
        System.out.println("See you again!!");
    }

    public char readChoice() {
        System.out.println("Select one option from the following: ");
        System.out.println("***************************************");
        System.out.println("O. Order a movie.");
        System.out.println("V. View your Orders.");
        System.out.println("C. Cancel your Orders.");
        System.out.println("A. Cancel your Account.");
        System.out.println("X. Quit from the System");
        System.out.println("***************************************");
        System.out.print("Choice: ");
        return In.nextChar();

    }

    private void clientMenu(MovieStoreSoapClient soapClient, User user) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        char choice;
        while ((choice = soapClient.readChoice()) != 'X') {
            switch (choice) {
                case 'O':
                    orderMovie(soapClient, user);
                    break;
                case 'V':
                    viewOrder();
                    break;
                case 'C':
                    cancelOrder(soapClient, user);
                    break;
                case 'A':
                    cancelAccount(soapClient, user);
                    break;
            }
        }
    }

    private Movie bookMovie() throws Exception_Exception, IOException_Exception {
        MovieStoreSoap_Service locator = new MovieStoreSoap_Service();
        MovieStoreSoap soap = locator.getMovieStoreSoapPort();
        System.out.println("Here are the some of the movies available");

        for (Movie movies : soap.fetchMovies()) {

            System.out.println("Title: " + movies.getTitle());
            System.out.println("Genre: " + movies.getGenre());
            System.out.println("Released Date: " + movies.getDate());
            System.out.println("Available Copies: " + movies.getCopies());
            System.out.println("Price: " + movies.getPrice());
        }
        for (Movie movie : soap.fetchMovies()) {
            //return movie;

            System.out.print("Enter the title of a movie you want to order: ");
            String name = In.nextLine();
            if (name.equalsIgnoreCase(movie.getTitle())) {
                return movie;
            } else {
                System.out.println("No such movie available.");
            }
        }

        return null;
//        if(name.equalsIgnoreCase())
    }

    private void orderMovie(MovieStoreSoapClient soapClient, User user) throws Exception_Exception, IOException_Exception, IOException_Exception, JAXBException_Exception {

        MovieStoreSoap_Service locator = new MovieStoreSoap_Service();
        MovieStoreSoap store = locator.getMovieStoreSoapPort();
        MovieStoreSoap soap = locator.getMovieStoreSoapPort();
        boolean flag = true;
        LinkedList<Movie> movie = new LinkedList<Movie>();
        while (flag) {
            System.out.println("••••Movie Ordering Menu.••••");
            Movie choice = soapClient.bookMovie();
            movie.add(choice);
            System.out.print("Enter the number of Movies you want to order: ");
            int number = In.nextInt();
            if (choice.getCopies() >= number) {
                flag = true;
                System.out.println("••••Checkout Option••••");
                Random random = new Random();
                int orderID = random.nextInt(100) + 1000;
                LinkedList<uts.movies.Movie> movies = new LinkedList<uts.movies.Movie>();
                System.out.print("Enter the payment type: ");
                String paymentType = In.nextLine();
                System.out.println("Your payment method is " + paymentType);
                //System.out.println("Your OrderID is "+orderID);
                Order order = new Order();
                order.setOrderId(number);
                order.setEmail(user.getEmail());
                order.setName(user.getName());
                order.setOrderStatus("submitted");
                order.setPaymentMethod(paymentType);
                System.out.println("Your Order ID is: " + order.getOrderId());
                System.out.println("Your Email is: " + user.getEmail());
                System.out.println("Your Name is: " + user.getName());
                System.out.println("Your status is: " + order.getOrderStatus());
            } else {
                flag = false;
            }

        }
        String[] args = {};
        soapClient.main(args);

        //LinkedList<Movie> movies = new LinkedList<Movie>();
        //movie.
        //Order order = new Order(Integer.toString(orderID),movies,user.getEmail());
    }

    private void viewOrder() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void cancelAccount(MovieStoreSoapClient soapClient, User user) throws Exception_Exception, IOException_Exception, JAXBException_Exception {
        MovieStoreSoap_Service locator = new MovieStoreSoap_Service();
        MovieStoreSoap soap = locator.getMovieStoreSoapPort();
        System.out.print("Do you want to remove your account?(Y/N) ");
        char choice = In.nextChar();
        if ((choice == 'Y')) {
            System.out.println("Your email is " + user.getEmail());
            System.out.println("Your name is " + user.getName());
            //soap.deleteUser(user);
            soap.deleteUser(user);
            System.out.println("Your account has been deleted.");
            String[] args = {};
            soapClient.main(args);

        } else {
            System.out.println("No such users found.");
        }
    }

    private void cancelOrder(MovieStoreSoapClient soapClient, User user) throws Exception_Exception, IOException_Exception {
        MovieStoreSoap_Service locator = new MovieStoreSoap_Service();
        MovieStoreSoap soap = locator.getMovieStoreSoapPort();
        System.out.print("Enter the OrderID for the movie: ");
        String orderID = In.nextLine();

        Order order = soap.matchID(orderID);

        //System.out.println("hello");
        System.out.println("");
        /*if (order == null) {
            System.out.println("Hello");
            //System.out.println("Order ID is: "+ order.);
            //System.out.println("Your name is "+user.getName()+" and your order is "+order.getOrderId());
        }*/
    }

    private int readAmount() {
        System.out.print("Enter the number of Movies you want to order:");
        return In.nextInt();
    }

}
