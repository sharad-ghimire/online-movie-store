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

 
@Path("/oms")
public class OMServices {
 @Context
 private ServletContext application;
 
 public HistoryApplication getApp() throws JAXBException, IOException, Exception {
  synchronized (application) {
   HistoryApplication historyApp = (HistoryApplication)application.getAttribute("historyApp");
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
 
 @Path("/history/{orderId}")
 @GET
 @Produces(MediaType.APPLICATION_XML)
 public Order getOder(@PathParam("orderId") int orderId) throws IOException, Exception {
    History history = getApp().getHistory();
    ArrayList<Order> list = history.getOrders();
    
    for(Order o : list){
       if(o.getOrderId() == orderId){
           return o;
       }
    }
     return null;
 }
    
 
 @POST
 @Path("/order")
 @Consumes(MediaType.APPLICATION_XML)
 public void addOrder(Order order) throws Exception {
        String filePath = application.getRealPath("WEB-INF/history.xml");
        HistoryApplication hApp = getApp();
        hApp.setFilePath(filePath);
        History history = getApp().getHistory();
        
        history.addOrder(order);
        hApp.saveHistory();
//        hApp.saveHistory(history, filePath); 
    }
}
