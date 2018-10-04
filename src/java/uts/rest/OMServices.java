package uts.rest;
 
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.ArrayList;
import uts.users.UserApplication;
import uts.users.*;
 
@Path("/oms")
public class OMServices {
 @Context
 private ServletContext application;
 
 public UserApplication getApp() throws JAXBException, IOException, Exception {
  synchronized (application) {
   UserApplication userApp = (UserApplication)application.getAttribute("userApp");
   if (userApp == null) {
    userApp = new UserApplication();
    userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
    application.setAttribute("userApp", userApp);
   }
   return userApp;
  }
 }
 
 @GET
 @Path("users")
 @Produces(MediaType.APPLICATION_XML)
 public Users getUsers() throws IOException, Exception {
      return getApp().getUsers();
 }
 
 @Path("/users/{email}")
 @GET
 @Produces(MediaType.APPLICATION_XML)
 public User getUser(@PathParam("email") String email) throws IOException, Exception {
    Users users = getApp().getUsers();
    ArrayList<User> list= users.getList();
    
    for(User u : list){
      if (u.getEmail().equals(email))
          return u;
    }
    return null;
 }
 
 @POST
 @Path("/user")
 @Consumes(MediaType.APPLICATION_XML)
 public void addUser(User user) throws Exception {
        String filePath = application.getRealPath("WEB-INF/users.xml");
        UserApplication dApp = getApp();
        dApp.setFilePath(filePath);
        Users users = getApp().getUsers();
        users.addUser(user);
        dApp.saveUsers(users, filePath); 
    }
}