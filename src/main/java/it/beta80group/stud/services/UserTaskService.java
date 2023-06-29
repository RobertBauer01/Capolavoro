package it.beta80group.stud.services;

import it.beta80group.stud.dao.DataSource;
import it.beta80group.stud.dao.Employeedao;
import it.beta80group.stud.dao.UserTaskdao;
import it.beta80group.stud.model.Employee;
import it.beta80group.stud.model.UserTask;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.SQLException;
import java.util.List;
public class UserTaskService {
    private DataSource dataSource;
    private static UserTaskService INSTANCE = null;
    final Logger logger = LogManager.getLogger(UserTaskService.class);
    protected UserTaskService(){
        dataSource = DataSource.getInstance();
    }

    public static UserTaskService getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new UserTaskService();
        }
        return INSTANCE;
    }

    public UserTask getById(Long id) throws SQLException {
        UserTask user = UserTaskdao.getById(id);
        return user;
    }
    public List<UserTask> listTask(Long id) throws SQLException {
        List<UserTask> tasks = UserTaskdao.getByIdTasks(id);
        return tasks;
    }
}
