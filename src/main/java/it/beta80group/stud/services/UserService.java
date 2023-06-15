package it.beta80group.stud.services;

import it.beta80group.stud.dao.DataSource;
import it.beta80group.stud.dao.Testdao;
import it.beta80group.stud.dao.Userdao;
import it.beta80group.stud.model.TestModel;
import it.beta80group.stud.model.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class UserService {
    private DataSource dataSource;
    private static UserService INSTANCE = null;
    final Logger logger = LogManager.getLogger(UserService.class);
    protected UserService(){
        dataSource = DataSource.getInstance();
    }

    public static UserService getInstance(){
        if(INSTANCE == null){
            INSTANCE = new UserService();
        }
        return INSTANCE;
    }

    public void save(String username, String password, Long rl, String name, String surname, Date dt) throws SQLException {
        logger.info("CALLED save({},{},{},{},{},{})", username, password, rl, name, surname, dt);
        User model = new User();
        model.setUsername(username);
        model.setPassword(password);
        model.setRl(rl);
        model.setName(name);
        model.setSurname(surname);
        model.setDt(dt);
        Userdao.save(model);
    }

    public List<User> list() throws SQLException {
        logger.info("CALLED list()");
        List<User> all = Userdao.getAll();
        return all;
    }

    public void delete(User u) throws SQLException {
        Userdao.delete(u);
    }

    public User getById(Long id) throws SQLException {
        User byId = Userdao.getById(id);
        return byId;
    }

    public void update(User user) throws SQLException {
        Userdao.update(user);
    }
}
