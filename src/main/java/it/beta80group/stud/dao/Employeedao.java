package it.beta80group.stud.dao;

import it.beta80group.stud.model.Employee;
import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    private static final String UPDATE_QUERY = "UPDATE tt SET tt.username = ?, tt.password = ?, tt.name = ?, tt.surname = ? FROM dbo.Users as tt WHERE id_user = ?";
    private static final String GET_ALL_QUERY = "SELECT tk.title, tk.description, tk.image_src, tk.link, tk.order_col FROM dbo.Tasks AS tk JOIN Task_User  AS tu ON tk.id_task = tu.id_task WHERE tu.id_user = ? ORDER BY tk.order_col";
    private static final String GET_BY_ID_QUERY = "SELECT * FROM dbo.Users WHERE id_task = ?";

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


    public static void update(Employee employee) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY);
        preparedStatement.setString(1, employee.getTitle());
        preparedStatement.setString(2, employee.getDescription());
        preparedStatement.setString(3, employee.getImageSrc());
        preparedStatement.setString(4, employee.getLink());
        preparedStatement.setLong(5, employee.getOrderCol());
        preparedStatement.execute();
        connection.close();
    }

    public static Employee getById(Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_ID_QUERY);
        preparedStatement.setLong(1, id);
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


    static class EmployeeResultSetMapper extends ResultSetMapper<Employee>{
        @Override
        protected Employee mapResultRow(ResultSet set) throws SQLException {
            Employee employee = new Employee();

            employee.setTitle(set.getString(1));
            employee.setDescription(set.getString(2));
            employee.setImageSrc(set.getString(3));
            employee.setLink(set.getString(4));
            employee.setOrderCol(set.getLong(5));


            return employee;
        }
    }

}

