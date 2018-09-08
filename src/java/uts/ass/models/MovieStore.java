package uts.ass.models;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author srd
 */
public class MovieStore {
    private String filePath;
    private String filePathOfMovies;
    private Users users;
    private Movies movies;
    
    public MovieStore() {
        
    }
    
    public String getFileName() {
        return filePath;
    }
    
    public void setFilePath(String filePath) throws Exception  {                   
      this.filePath = filePath;
      JAXBContext jb = JAXBContext.newInstance(Users.class);
      Unmarshaller u = jb.createUnmarshaller();
        try (FileInputStream fin = new FileInputStream(filePath)) {
            users = (Users) u.unmarshal(fin);
        }
    }
    
    public Users getUsers() {
	return users;
    }
    
    
    public void setUsers(Users users) {
        this.users = users;
    }
    
    public void saveUsers(Users users, String filePath) throws Exception {
        
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        try (FileOutputStream fout = new FileOutputStream(filePath)) {
            m.marshal(users, fout);
        }  
        this.users = users;
        this.filePath = filePath;
    }
    
     public void updateXML() throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        try (FileOutputStream fout = new FileOutputStream(filePath)) {
            m.marshal(users, fout);
        } 
    }  
     
     
    public void setFilePathForMovies(String filePathOfMovies) throws Exception  {                   
      this.filePathOfMovies = filePathOfMovies;
      JAXBContext jb = JAXBContext.newInstance(Movies.class);
      Unmarshaller movie = jb.createUnmarshaller();
        try (FileInputStream fin = new FileInputStream(filePathOfMovies)) {
            movies = (Movies) movie.unmarshal(fin);
      }
    }
     
}
