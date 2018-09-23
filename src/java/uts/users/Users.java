package uts.users;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable {

    @XmlElement(name = "user")
    private ArrayList<User> listOfUsers = new ArrayList<User>();

    public ArrayList<User> getList() {
        return listOfUsers;
    }

    public void addUser(User user) {
        this.listOfUsers.add(user);
    }

    public void removeUser(User user) {
        this.listOfUsers.remove(user);
    }

    public User login(String email, String password) {
        for (User user : listOfUsers) {
            if (user.getEmail().equals(email)) {
                if (user.getPassword().equals(password)) {
                    return user;
                }
            }
        }
        return null;
    }

    public User emailChecker(String email) {
        for (User user : listOfUsers) {
            if (user.getEmail().equals(email)) {
                return user;
            }
        }

        return null;
    }
    

    public void updateList(User user) {
        removeUser(user);
        addUser(user);
    }

}
