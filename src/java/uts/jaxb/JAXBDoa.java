package uts.jaxb;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import uts.dao.Doa;

public class JAXBDoa implements Doa {
    private final ServletContext application;
    private final String userFilePath;
    private final String moviesFilePath;
    private final String historyFilePath;
    
    public JAXBDoa(ServletContext application) throws Exception {
        this.application = application;
        this.userFilePath = application.getRealPath("WEB-INF/users.xml");
        this.moviesFilePath = application.getRealPath("WEB-INF/movies.xml");
        this.historyFilePath = application.getRealPath("WEB-INF/history.xml");
        
        
//        updateMoviesTitlesFromXml();
//        updateHistoryFromXml();
//        updateUserFromXml();
    }

    //setMoviesTitles
    //setHistory
    // setUser
    //updateMovieTitlesFromXml() 
    //updateHistoryFromXml() 
    //updateUsersFromXml() 

}
