///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package uts.soap.client;
//
//import uts.soap.omsSoap;
//
//import java.io.IOException;
//import javax.xml.bind.JAXBException;
//import uts.users.User;
//
//
///**
// *
// * @author pramishluitel
// */
//public class OmsSoapClient {
//    public OmsSoapClient(){}
//    OmsSoap_Service locator = new OmsSoap_Service();
//    OmsSoap soap = locator.getOmsSoapPort();
//    OmsSoapClient movie = new OmsSoapClient();
//    
//    
//    public static void main(String[] args) throws Exception, IOException, JAXBException{
//   System.out.println("***************************************");
//        System.out.println("Welcome to the OMS Login Page.");
//        User user = soap
//        if (user != null) {
//            System.out.println("Welcome " + user.getName() + " to the OMS");
//        } else {
//            System.out.println("Incorrect Email or Password.\n");
//            main(args);
//        }
//        System.out.println("***************************************");
//    }
//
//
//
//}
//
//
//
//
///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
////ppackage uts.soap.client;
////
////import java.io.IOException;
////import javax.xml.bind.JAXBException;
////import static jdk.nashorn.internal.objects.Global.exit;
////import uts.users.*;
////
/////**
//// *
//// * @author pramishluitel
//// */
////public class MovieStoreSoapClient {
////
////    public MovieStoreSoapClient() {
////    }
////
////    public static void main(String[] args) throws Exception, IOException, JAXBException {
////        MovieStoreSoap_Service locator = new MovieStoreSoap_Service();
////        MovieStoreSoap movieStore = locator.getMovieStoreSoapPort();
////        MovieStoreSoapClient soap = new MovieStoreSoapClient();
////        System.out.println("***************************************");
////        System.out.println("Welcome to the OMS Login Page.");
////        User user = movieStore.
////        if (user != null) {
////            System.out.println("Welcome " + user.getName() + " to the OMS");
////        } else {
////            System.out.println("Incorrect Email or Password.\n");
////            main(args);
////        }
////        System.out.println("***************************************");
////    }
////
////    private String getEmail() {
////        System.out.print("Enter your email: ");
////        return In.nextLine();
////    }
////
////    private String getPassword() {
////        System.out.print("Enter your password: ");
////        return In.nextLine();
////    }
////
////    private void userMenu(MovieStoreSoapClient client, User user) throws Exception, IOException, JAXBException {
////        char choice;
////        while ((choice = client.readChoice()) != 'X') {
////            switch (choice) {
////                case 'O':
////                    orderMovie(client, user);
////                    break;
////                case 'V':
////                    viewOrder(client, user);
////                    break;
////                case 'C':
////                    cancelOrder(client, user);
////                    break;
////                case 'A':
////                    deleteAccount(client, user);
////                    break;
////                case 'E':
////                    exit(client, user);
////                    break;
////
////            }
////        }
////    }
////
////    private void orderMovie(MovieStoreSoapClient client, User user) {
////        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
////    }
////
////    private char readChoice() {
////        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
////    }
////
////    private void viewOrder(MovieStoreSoapClient client, User user) {
////        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
////    }
////
////    private void cancelOrder(MovieStoreSoapClient client, User user) {
////        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
////    }
////
////    private void deleteAccount(MovieStoreSoapClient client, User user) {
////        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
////    }
////
////}
////
