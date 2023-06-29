package it.beta80group.stud.services;

import it.beta80group.stud.dao.DataSource;
import it.beta80group.stud.dao.Employeedao;
import it.beta80group.stud.model.Employee;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService {
    private DataSource dataSource;
    private static EmployeeService INSTANCE = null;
    final Logger logger = LogManager.getLogger(EmployeeService.class);
    protected EmployeeService(){
        dataSource = DataSource.getInstance();
    }

    public static EmployeeService getInstance(){
        if(INSTANCE == null){
            INSTANCE = new EmployeeService();
        }
        return INSTANCE;
    }
    public void save(String idTask, String idUser) throws SQLException {
        logger.info("CALLED save({},{})", idTask, idUser);
        Employee model = new Employee();
        model.setIdTask(Long.valueOf(idTask));
        model.setIdUser(Long.valueOf(idUser));
        Employeedao.save(model);
    }

    public List<Employee> list(Long id_user) throws SQLException {
        logger.info("CALLED list()");
        List<Employee> all = Employeedao.getAll(id_user);
        return all;
    }



    public void update(String idTask, String idUser) throws SQLException {
        Employee employee = new Employee();
        employee.setIdTask(Long.valueOf(idTask));
        employee.setIdUser(Long.valueOf(idUser));
        Employeedao.update(employee);
    }

    public Employee getById(Long id,Long idUser) throws SQLException {
        Employee byId = Employeedao.getById(id,idUser);
        return byId;
    }

    public Employee user(Long id) throws SQLException {
        Employee byId = Employeedao.user(id);
        return byId;
    }

}