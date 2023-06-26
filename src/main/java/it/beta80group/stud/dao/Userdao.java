package it.beta80group.stud.dao;

import it.beta80group.stud.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
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


public class Userdao {
    private static final String UPDATE_QUERY = "UPDATE tt SET tt.username = ?, tt.password = ?, tt.name = ?, tt.surname = ? FROM dbo.Users as tt WHERE id_user = ?";
    private static final String GET_BY_ID_QUERY = "SELECT * FROM dbo.Users WHERE id_user = ?";
    private static final String DELETE_QUERY = "DELETE FROM dbo.Users WHERE id_user = ?";
    private static final String SAVE_QUERY = "INSERT INTO dbo.Users(username, password, rl, name, surname, dt) VALUES(?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_QUERY = "SELECT us.*, (SELECT COUNT(*) from dbo.Task_User tu WHERE tu.id_user = us.id_user) as tot_task, (SELECT COUNT(*) from dbo.Task_User tu WHERE tu.id_user = us.id_user and tu.data_completion is not null) as tot_task_done FROM dbo.Users us ORDER BY us.surname, us.name";
    private static final String SAVE_TASK_USER_QUERY = "INSERT INTO dbo.Task_User(id_task, id_user) VALUES(?, ?)";
    private static final String LAST_USER_ID_QUERY = "SELECT MAX(id_user) FROM Users";
    private static final String ACTIVE_TASKS_QUERY = "SELECT id_Task FROM Tasks WHERE status = 1";

    private static final String ATTEMPT_LOGIN = "SELECT TOP(1) * FROM dbo.Users WHERE username = ? AND password = ?";

    public static void insert(User model) throws SQLException {
        if (!isUsernameUnique(model.getUsername(), (long) -1)) {
            throw new SQLException("Username già esistente");
        }
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SAVE_QUERY);
        preparedStatement.setString(1, model.getUsername());
        preparedStatement.setString(2, model.getPassword());
        preparedStatement.setLong(3, model.getRl());
        preparedStatement.setString(4, model.getName());
        preparedStatement.setString(5, model.getSurname());
        preparedStatement.setDate(6, model.getDt());
        preparedStatement.executeUpdate();

        PreparedStatement saveStatement = connection.prepareStatement(SAVE_TASK_USER_QUERY);
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(LAST_USER_ID_QUERY)) {
            if (resultSet.next()) {
                long lastID = resultSet.getLong(1);
                saveStatement.setLong(2, lastID);
            }
        }
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(ACTIVE_TASKS_QUERY)) {
            while (resultSet.next()) {
                long taskId = resultSet.getLong("id_Task");
                saveStatement.setLong(1, taskId);

                saveStatement.executeUpdate();
            }
        }
        connection.close();
    }

    public static List<User> getAll() throws SQLException{
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_QUERY);
        ResultSet resultSet = preparedStatement.executeQuery();
        UserTaskResultSetMapper mapper = new UserTaskResultSetMapper();
        List<User> testModels = mapper.mapResult(resultSet);
        connection.close();
        return testModels;
    }

    public static void delete(User user) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_QUERY);
        preparedStatement.setLong(1, user.getIdUser());
        preparedStatement.execute();
        connection.close();
    }

    public static User getById(Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_ID_QUERY);
        preparedStatement.setLong(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        Userdao.UserResultMapper mapper = new Userdao.UserResultMapper();
        List<User> userModels = mapper.mapResult(resultSet);
        User result = null;
        if(!userModels.isEmpty()){
            result = userModels.get(0);
        }
        connection.close();
        return result;
    }

    public static User attemptLogin(String username, String password) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(ATTEMPT_LOGIN);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();
        Userdao.UserResultMapper mapper = new Userdao.UserResultMapper();
        List<User> userModels = mapper.mapResult(resultSet);
        User result = null;
        if(!userModels.isEmpty()){
            result = userModels.get(0);
        }
        connection.close();
        return result;
    }
    public static void update(User user) throws SQLException {
        if (!isUsernameUnique(user.getUsername(), user.getIdUser())) {
            throw new SQLException("Username già esistente");
        }
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY);
        preparedStatement.setString(1, user.getUsername());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getName());
        preparedStatement.setString(4, user.getSurname());
        preparedStatement.setLong(5, user.getIdUser());
        preparedStatement.execute();
        connection.close();
    }


    static class UserTaskResultSetMapper extends ResultSetMapper<User>{
        @Override
        protected User mapResultRow(ResultSet set) throws SQLException {
            User user = new User();

            user.setIdUser(set.getLong(1));
            user.setUsername(set.getString(2));
            user.setPassword(set.getString(3));
            user.setRl(set.getLong(4));
            user.setName(set.getString(5));
            user.setSurname(set.getString(6));
            user.setDt(set.getDate(7));
            user.setTotTask(set.getLong(8));
            user.setTotTaskDone(set.getLong(9));
            return user;
        }
    }

    static class UserResultMapper extends ResultSetMapper<User>{
        @Override
        protected User mapResultRow(ResultSet set) throws SQLException {
            User user = new User();

            user.setIdUser(set.getLong(1));
            user.setUsername(set.getString(2));
            user.setPassword(set.getString(3));
            user.setRl(set.getLong(4));
            user.setName(set.getString(5));
            user.setSurname(set.getString(6));
            user.setDt(set.getDate(7));
            return user;
        }
    }

    public static boolean isUsernameUnique(String username, Long id) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM dbo.Users WHERE username = ? AND id_user <> ?");
        preparedStatement.setString(1, username);
        preparedStatement.setLong(2, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        int count = resultSet.getInt(1);
        connection.close();
        return count == 0;
    }

}
