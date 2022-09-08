<%@ page import="model.Book" %>
<%@ page import="model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mrdo
  Date: 07.09.2022
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing:border-box;
            overflow-x: hidden;
        }
        .container{
            width:100%;
        }
        .header{
            width:100%;
            height:60px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            background:gray;
        }
        .nav-bar > a{
            padding-right:10px;
            font-size:21px;
            font-family:Arial;
            color:white;
            text-decoration:none;
            transition:0.6s;
        }
        .nav-bar > a:hover{
            color:black;
            transition:0.6s;
        }
        .main_editBook{
            width:100%;
            display:flex;
            padding:10px;
            flex-wrap: wrap;
        }
        .content{
            width:200px;
            border:2px solid black;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction: column;
            margin-top:30px;
            margin-left:7px;
            overflow:hidden;
        }
        .logo{
            font-size:20px;
            color:white;
            font-family:sans-serif;

        }
    </style>
</head>
<body>
<%
    Book book = (Book) request.getAttribute("book");
    List<Author> author = (List<Author>) request.getAttribute("author");
%>
<div class="container">
    <div class="header">
        <div class="logo">LOGO</div>
        <div class="nav-bar">
            <a href="/author/add">add author</a>
            <a href="/book/add">add book</a>
            <a href="/all/authors">see authors</a>
            <a href="/all/books">see books</a>
        </div>
    </div>
    <div class="main_editBook">
        <form action="/book/edit" method="post">
            <input type="hidden" name="bookId" value="<%=book.getId()%>">
            <input type="text" name="title" placeholder="please input book title" value="<%=book.getTitle()%>">
            <input type="number" name="price" placeholder="please input book price" value="<%=book.getPrice()%>">
            <h4>please select book author</h4>
            <select name="authorId">

                <%for (Author authorList : author) {%>

                <option value="<%=authorList.getId()%>"><%=authorList.getName()%> <%=authorList.getSurname()%>
                </option>
                <%}%>
            </select>
            <textarea name="description" placeholder="description"><%=book.getDescription()%></textarea>
            <input type="submit" value="Update">
        </form>

    </div>
</div>
</body>
</html>
