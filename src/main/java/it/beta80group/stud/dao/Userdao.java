package it.beta80group.stud.dao;

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
public class Userdao {
    private static final String UPDATE_QUERY = "UPDATE tt SET tt.username = ?, tt.password = ?, tt.name = ?, tt.surname = ? FROM dbo.Users tt WHERE id_user = ?";
    private static final String GET_BY_ID_QUERY = "SELECT * FROM dbo.Users WHERE id_user = ?";
    private static final String DELETE_QUERY = "DELETE FROM dbo.Users WHERE id_user = ?";
    private static final String SAVE_QUERY = "INSERT INTO dbo.Users(username, password, rl, name, surname, dt) VALUES(?, ?, 1, ?, ?, ?)";
    private static final String GET_ALL_QUERY = "SELECT * FROM dbo.Users";

    public static void save(User model) throws SQLException {
        Connection connection = DataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SAVE_QUERY);
        preparedStatement.setString(1, model.getUsername());
        preparedStatement.setString(2, model.getPassword());
        preparedStatement.setString(3, model.getName());
        preparedStatement.setString(4, model.getSurname());
        preparedStatement.setDate(5, model.getDt());
        preparedStatement.execute();
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
}
