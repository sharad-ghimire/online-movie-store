/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.history;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import uts.movies.Movie;

/**
 *
 * @author joanc
 */
public class HistoryApplication {
    private String filePath;
    private History history;

    public HistoryApplication() {
    }

    public HistoryApplication(String filePath, History history) {
        this.filePath = filePath;
        this.history = history;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
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
    
    public void editOrder(Order order,int orderID, ArrayList<Movie> movies, String fullName, String email, String paymentMethod, int totalPrice, String orderStatus) throws Exception{
        history.remove(order);
        order.updateDetails(orderID, movies, fullName, email, paymentMethod, totalPrice, orderStatus);
        history.addOrder(order);
        updateXML(history,filePath);
    }
}
