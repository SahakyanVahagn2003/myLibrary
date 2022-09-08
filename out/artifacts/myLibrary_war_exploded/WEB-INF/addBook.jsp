<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: mrdo
  Date: 06.09.2022
  Time: 22:07
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
            box-sizing: border-box;
        }

        .container {
            width: 100%;
        }

        .header {
            width: 100%;
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: gray;
        }

        a {
            padding-right: 10px;
            font-size: 21px;
            font-family: Arial;
            color: white;
            text-decoration: none;
            transition: 0.6s;
        }

        a:hover {
            color:black;

            transition: 0.6s;

        }

        .main_addBook {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        form {
            display: flex;
            justify-content: center;
            align-content: center;
            flex-direction: column;
        }

        input {
            width:500px;
            height:60px;
            margin-top: 10px;
            background: none;
            border: 1px solid gray;
            color: gray;
        }
        textarea{
            width:500px;
            height:100px;
            margin-top:15px;
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
    List<Author> list = (List<Author>) request.getAttribute("authorList");
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
    <div class="main_addBook">
        <form action="/book/add" method="post">
            <input type="text" name="title" placeholder="please input book title">
            <input type="number" name="price" placeholder="please input book price">
            <h4>please select book author</h4>
            <select name="authorId">

                <%for (Author author : list) {%>

                <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
                </option>
                <%}%>
            </select>
            <textarea name="description" placeholder="description"></textarea>
            <input type="submit">
        </form>

    </div>
</div>
</body>
</html>
