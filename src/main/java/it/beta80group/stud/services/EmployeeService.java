package it.beta80group.stud.services;

import it.beta80group.stud.dao.DataSource;
import it.beta80group.stud.dao.Employeedao;
import it.beta80group.stud.dao.Userdao;
import it.beta80group.stud.model.Employee;
import it.beta80group.stud.model.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Date;
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


    public List<Employee> list(Long id_user) throws SQLException {
        logger.info("CALLED list()");
        List<Employee> all = Employeedao.getAll(id_user);
        return all;
    }



    public void update(Employee employee) throws SQLException {
        Employeedao.update(employee);
    }

    public Employee getById(Long id) throws SQLException {
        Employee byId = Employeedao.getById(id);
        return byId;
    }
}
