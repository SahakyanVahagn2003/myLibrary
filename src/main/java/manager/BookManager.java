package manager;

import DBConnection.DBConnectionProvider;
import model.Author;
import model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookManager {
    private Connection connection = DBConnectionProvider.getDbConnectionProvider().getConnection();
    private AuthorManager authorManager = new AuthorManager();
    public void add(Book book){
        String sql = "insert into book(title,description,price,author_id) VALUES (?,?,?,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getDescription());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setInt(4, book.getAuthor().getId());
            preparedStatement.executeUpdate();
            ResultSet keys = preparedStatement.getGeneratedKeys();
            if (keys.next()){
                int keyId = keys.getInt(1);
                book.setId(keyId);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Book> getAllBook(){
        String sql = "SELECT * FROM book";
        List<Book> bookList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet all = preparedStatement.executeQuery();
            while (all.next()){
                bookList.add(getBookFromResultSet(all));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return bookList;
    }
    public void RemoveBook(int bookId){
        String sql = "DELETE FROM book WHERE id="+bookId;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void edit(Book book){
        String sql ="UPDATE book SET title = ?, description = ?, price = ?,author_id = ? WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getDescription());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setInt(4, book.getAuthor().getId());
            preparedStatement.setInt(5, book.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Book getBookFromResultSet(ResultSet all) throws SQLException {
        Book book = new Book();
        book.setId(all.getInt("id"));
        book.setTitle(all.getString("title"));
        book.setDescription(all.getString("description"));
        book.setPrice(all.getInt("price"));
        int authorId = all.getInt("author_Id");
        Author author = authorManager.getById(authorId);
        book.setAuthor(author);
        return book;
    }


    public Book getId(int bookId) {
        String sql = "SELECT * FROM book WHERE id=" + bookId;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                return  getBookFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
     return null;
    }
}