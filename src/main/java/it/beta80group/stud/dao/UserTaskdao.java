package it.beta80group.stud.dao;

import it.beta80group.stud.model.Employee;
import it.beta80group.stud.model.User;
import it.beta80group.stud.model.UserTask;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
public class UserTaskdao {
    private static final String GET_BY_ID_USER_QUERY = "SELECT name, surname, dt FROM dbo.Users WHERE id_user =  ?";
    private static final String GET_TASK_BY_ID = "SELECT t.title , t.description , tu.data_completion FROM dbo.Tasks t JOIN dbo.Task_User tu ON t.id_task = tu.id_task  WHERE tu.id_user = ? ORDER BY data_completion ";
    public static UserTask getById(Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_ID_USER_QUERY);
        preparedStatement.setLong(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        UserTaskdao.UserResultSetMapper mapper = new UserTaskdao.UserResultSetMapper();
        List<UserTask> UserTaskModels = mapper.mapResult(resultSet);
        UserTask result = null;
        if(!UserTaskModels.isEmpty()){
            result = UserTaskModels.get(0);
        }
        connection.close();
        return result;
    }

    public static List<UserTask> getByIdTasks(Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_TASK_BY_ID);
        preparedStatement.setLong(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        UserTaskdao.TaskResultSetMapper mapper = new UserTaskdao.TaskResultSetMapper();
        List<UserTask> UserTaskModels = mapper.mapResult(resultSet);
        connection.close();
        return UserTaskModels;
    }

    static class UserResultSetMapper extends ResultSetMapper<UserTask>{
        @Override
        protected UserTask mapResultRow(ResultSet set) throws SQLException {
            UserTask userTask = new UserTask();

            userTask.setName(set.getString(1));
            userTask.setSurname(set.getString(2));
            userTask.setDt(set.getDate(3));
            return userTask;
        }
    }

    static class TaskResultSetMapper extends ResultSetMapper<UserTask>{
        @Override
        protected UserTask mapResultRow(ResultSet set) throws SQLException {
            UserTask userTask = new UserTask();

            userTask.setTaskTitle(set.getString(1));
            userTask.setTaskDescription(set.getString(2));
            userTask.setTaskStatus(set.getDate(3));
            return userTask;
        }
    }
}
