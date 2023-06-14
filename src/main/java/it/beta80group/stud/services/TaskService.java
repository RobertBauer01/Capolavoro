package it.beta80group.stud.services;

import it.beta80group.stud.dao.DataSource;
import it.beta80group.stud.dao.Taskdao;
import it.beta80group.stud.dao.Testdao;
import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.TestModel;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.SQLException;
import java.util.List;

public class TaskService {
    private DataSource dataSource;
    private static TaskService INSTANCE = null;
    final Logger logger = LogManager.getLogger(TaskService.class);
    protected TaskService(){
        dataSource = DataSource.getInstance();
    }

    public static TaskService getInstance(){
        if(INSTANCE == null){
            INSTANCE = new TaskService();
        }
        return INSTANCE;
    }


    public Task getById(Long id) throws SQLException {
        Task byId = Taskdao.getById(id);
        return byId;
    }
    public List<Task> list() throws SQLException {
        logger.info("CALLED list()");
        List<Task> all = Taskdao.getAll();
        return all;
    }
    public void update(Task testModel) throws SQLException {
        Taskdao.update(testModel);
    }

    public void save(Task testModel) throws SQLException {
        Taskdao.save(testModel);
    }
}
