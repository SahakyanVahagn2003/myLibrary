package manager;

import DBConnection.DBConnectionProvider;
import model.Author;
import model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AuthorManager {
    private Connection connection = DBConnectionProvider.getDbConnectionProvider().getConnection();

    public void addAuthor(Author author) {
        String sql = "INSERT INTO author(name,surname,email,age) VALUES(?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, author.getName());
            preparedStatement.setString(2, author.getSurname());
            preparedStatement.setString(3, author.getEmail());
            preparedStatement.setInt(4, author.getAge());
            preparedStatement.executeUpdate();
            ResultSet keys = preparedStatement.getGeneratedKeys();
            if (keys.next()){
                int keyId = keys.getInt(1);
                author.setId(keyId);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Author> getAllAuthors(){
        String sql = "SELECT * FROM author";
        List<Author> ListSelect = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                ListSelect.add(getAuthorById(resultSet));
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ListSelect;
    }
    public Author getById(int authorId) {
        String sql = "Select * FROM author WHERE id = " + authorId;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getAuthorById(resultSet);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    private Author getAuthorById(ResultSet resultSet) {

        try {
            Author author = Author.builder()
                    .id(resultSet.getInt("id"))
                    .name(resultSet.getString("name"))
                    .surname(resultSet.getString("surname"))
                    .email(resultSet.getString("email"))
                    .age(resultSet.getInt("age"))
                    .build();
            return author;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void RemoveAuthor(int authorId){
        String sql = "DELETE FROM author WHERE id="+authorId;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void edit(Author author){
        String sql ="UPDATE  SET  name = ?, surname = ?, email = ?,age = ? WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,author.getName());
            preparedStatement.setString(2,author.getSurname());
            preparedStatement.setString(3,author.getEmail());
            preparedStatement.setInt(4,author.getAge());
            preparedStatement.setInt(5,author.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    }

