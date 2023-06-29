package it.beta80group.stud.dao;

import it.beta80group.stud.model.Employee;

import java.sql.*;
import java.time.LocalDate;
import java.util.List;
/*
* CREATE TABLE hrportal.dbo.testtable (
    id bigint IDENTITY(0,1) NOT NULL,
    username varchar(100) NULL,
    password varchar(100) NULL,
    CONSTRAINT testtable_PK PRIMARY KEY (id)
);
*
* */
public class Employeedao {

    private static final String SAVE_QUERY = "INSERT INTO dbo.Task_User(id_task, id_user, data_completion) VALUES(?, ?, ?)";
    private static final String UPDATE_QUERY = "UPDATE tt SET tt.data_completion = ? FROM Task_User as tt WHERE id_task = ? AND id_user = ?";
    private static final String GET_ALL_QUERY = "SELECT tk.title, tk.description, tk.image_src, tk.link, tk.order_col, tk.id_task, tu.data_completion FROM dbo.Tasks AS tk JOIN Task_User AS tu ON tk.id_task = tu.id_task WHERE tu.id_user = ? ORDER BY tk.order_col";
    private static final String GET_BY_ID_QUERY = "SELECT tk.title, tk.description, tk.image_src, tk.link, tk.order_col, tk.id_task, tu.data_completion FROM dbo.Tasks tk JOIN Task_User AS tu ON tk.id_task = tu.id_task WHERE tk.id_task =  ? AND tu.id_user= ?";

    private static final String USER_QUERY = "SELECT us.name, us.surname, us.username FROM dbo.Users AS us WHERE us.id_user = ?";


    public static List<Employee> getAll(Long id_user) throws SQLException{
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_QUERY);
        preparedStatement.setLong(1, id_user);
        ResultSet resultSet = preparedStatement.executeQuery();
        EmployeeResultSetMapper mapper = new EmployeeResultSetMapper();
        List<Employee> testModels = mapper.mapResult(resultSet);
        connection.close();
        return testModels;
    }

    public static void save(Employee model) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SAVE_QUERY);
        preparedStatement.setLong(1, model.getIdTask());
        preparedStatement.setLong(2, model.getIdUser());
        preparedStatement.setDate(3, Date.valueOf(LocalDate.now()));
        preparedStatement.execute();
        connection.close();
    }
    public static void update(Employee employee) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY);
        employee.setData(Date.valueOf(LocalDate.now()));
        preparedStatement.setDate(1, employee.getData());
        preparedStatement.setLong(2, employee.getIdTask());
        preparedStatement.setLong(3, employee.getIdUser());

        preparedStatement.execute();
        connection.close();
    }

    public static Employee getById(Long id, Long idUser) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_ID_QUERY);
        preparedStatement.setLong(1, id);
        preparedStatement.setLong(2, idUser);
        ResultSet resultSet = preparedStatement.executeQuery();
        Employeedao.EmployeeResultSetMapper mapper = new Employeedao.EmployeeResultSetMapper();
        List<Employee> employeeModels = mapper.mapResult(resultSet);
        Employee result = null;
        if(!employeeModels.isEmpty()){
            result = employeeModels.get(0);
        }
        connection.close();
        return result;
    }

    public static Employee user(Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(USER_QUERY);
        preparedStatement.setLong(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        Employeedao.EmployeeResultSetMapper2 mapper = new Employeedao.EmployeeResultSetMapper2();
        List<Employee> employeeModels = mapper.mapResult(resultSet);
        Employee result = null;
        if(!employeeModels.isEmpty()){
            result = employeeModels.get(0);
        }
        connection.close();
        return result;
    }


    static class EmployeeResultSetMapper extends ResultSetMapper<Employee>{
        @Override
        protected Employee mapResultRow(ResultSet set) throws SQLException {
            Employee employee = new Employee();

            employee.setTitle(set.getString(1));
            employee.setDescription(set.getString(2));
            employee.setImageSrc(set.getString(3));
            employee.setLink(set.getString(4));
            employee.setOrderCol(set.getLong(5));
            employee.setIdTask(set.getLong(6));
            employee.setData(set.getDate(7));
            return employee;
        }
    }

    static class EmployeeResultSetMapper2 extends ResultSetMapper<Employee>{
        @Override
        protected Employee mapResultRow(ResultSet set) throws SQLException {
            Employee employee = new Employee();
            employee.setName(set.getString(1));
            employee.setSurname(set.getString(2));
            employee.setUsername(set.getString(3));

            return employee;
        }
    }

}