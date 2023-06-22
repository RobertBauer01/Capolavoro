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
    private static final String GET_ALL_QUERY = "SELECT * FROM dbo.Users ORDER BY surname, name";
    private static final String TASK_QUERY = "SELECT * FROM Tasks WHERE status = 1";
    private static final String SAVE_TASK_USER_QUERY = "INSERT INTO dbo.Task_User(id_task, id_user) VALUES(?, ?)";
    public static void insert(User model) throws SQLException {
        if (!isUsernameUnique(model.getUsername(), (long) -1)) {
            throw new SQLException();
        }
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SAVE_QUERY);
        preparedStatement.setString(1, model.getUsername());
        preparedStatement.setString(2, model.getPassword());
        preparedStatement.setLong(3, model.getRl());
        preparedStatement.setString(4, model.getName());
        preparedStatement.setString(5, model.getSurname());
        preparedStatement.setDate(6, model.getDt());

        int rowsAffected = preparedStatement.executeUpdate();
        //Ottenere l'ultimo ID generato
        if (rowsAffected > 0) {
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()){
                    long lastInsertedID = generatedKeys.getLong(1);
                }
            }
        }
        //Salvare in un ResultSet tutti i task attivi
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(TASK_QUERY);

        List<Integer> idList = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id_Task");
            idList.add(id);
        }
        resultSet.close();
        statement.close();

        //Salvare gli l'ultimo ID dello user e tutti gli id dei task attivi nella tabella Task_User
        PreparedStatement savestatement = connection.prepareStatement(SAVE_TASK_USER_QUERY);
        Iterator<Integer> iterator = idList.iterator();

        preparedStatement.setLong(1, Long.parseLong("lastInsertedID"));
        while (iterator.hasNext()){
            int id = iterator.next();

        }
        connection.close();
    }

    public static List<User> getAll() throws SQLException{
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_QUERY);
        ResultSet resultSet = preparedStatement.executeQuery();
        UserResultSetMapper mapper = new UserResultSetMapper();
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
        Userdao.UserResultSetMapper mapper = new Userdao.UserResultSetMapper();
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
            throw new SQLException();
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


    static class UserResultSetMapper extends ResultSetMapper<User>{
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
