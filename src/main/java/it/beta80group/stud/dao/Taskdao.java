package it.beta80group.stud.dao;

import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.TestModel;

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
public class Taskdao {
    private static final String UPDATE_QUERY = "UPDATE tt SET tt.title = ?, tt.description = ?, link = ?, status = ?, order_col = ? FROM dbo.Tasks tt WHERE id_task = ?";
    private static final String GET_ALL_QUERY = "select * from dbo.Tasks t order by status DESC , order_col";
    private static final String GET_BY_ID_QUERY = "SELECT * FROM dbo.Tasks WHERE id_task = ?";

    private static final String SAVE_QUERY = "INSERT INTO dbo.Tasks(title, description, image_src, link, status, order_col) VALUES(?, ?, ?, ?, ?, ?)";
    public static List<Task> getAll() throws SQLException{
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_QUERY);
        ResultSet resultSet = preparedStatement.executeQuery();
        TaskResultSetMapper mapper = new TaskResultSetMapper();
        List<Task> testModels = mapper.mapResult(resultSet);
        connection.close();
        return testModels;
    }

    public static void save(Task model) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SAVE_QUERY);
        preparedStatement.setString(1, model.getTitle());
        preparedStatement.setString(2, model.getDescription());
        preparedStatement.setString(3, model.getImageSrc());
        preparedStatement.setString(4, model.getLink());
        preparedStatement.setLong(5, model.getStatus());
        preparedStatement.setLong(6, model.getOrderCol());


        preparedStatement.execute();
        connection.close();
    }
    public static Task getById(Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_ID_QUERY);
        preparedStatement.setLong(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        Taskdao.TaskResultSetMapper mapper = new Taskdao.TaskResultSetMapper();
        List<Task> tasks = mapper.mapResult(resultSet);
        Task result = null;
        if(!tasks.isEmpty()){
            result = tasks.get(0);
        }
        connection.close();
        return result;
    }

    static class TaskResultSetMapper extends ResultSetMapper<Task>{
        @Override
        protected Task mapResultRow(ResultSet set) throws SQLException {
            Task task = new Task();
            task.setTitle(set.getString(1));
            task.setIdTask(set.getLong(2));
            task.setDescription(set.getString(3));
            task.setImageSrc(set.getString(4));
            task.setLink(set.getString(5));
            task.setStatus(set.getLong(6));
            task.setOrderCol(set.getLong(7));
            return task;
        }
    }
    public static void update(Task testModel) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY);
        preparedStatement.setString(1, testModel.getTitle());
        preparedStatement.setString(2, testModel.getDescription());
        preparedStatement.setString(3, testModel.getLink());
        preparedStatement.setLong(4, testModel.getStatus());
        preparedStatement.setLong(5, testModel.getOrderCol());
        preparedStatement.setLong(6, testModel.getIdTask());
        preparedStatement.execute();
        connection.close();
    }
}
