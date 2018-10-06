/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.history;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import uts.movies.Movie;
import uts.movies.Movies;

/**
 *
 * @author joanc
 */
public class HistoryApplication implements Serializable{
    
    private String filePath;
    private History history;

    public HistoryApplication() {
        
    }

    public HistoryApplication(String filePath, History history) {
        super();
        this.filePath = filePath;
        this.history = history;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;        
        FileInputStream fin = new FileInputStream(filePath);
        history = (History) u.unmarshal(fin); 	
        fin.close();
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }
    
    public void updateXML(History history, String filePath) throws Exception {
        this.history = history;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(history, fout);
        fout.close();
    }
    
    public void saveHistory() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(history, fout);
        fout.close();
    }
    
    public void editOrder(Order order,int orderId, ArrayList<Movie> movies, String orderDate,String name, String email, String paymentMethod, int totalPrice, String orderStatus) throws Exception{
        history.remove(order);
        order.updateDetails(orderId,orderDate,movies,name, email, paymentMethod, totalPrice, orderStatus);
        history.addOrder(order);
        updateXML(history,filePath);
    }
}