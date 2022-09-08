<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: mrdo
  Date: 08.09.2022
  Time: 3:59
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
            overflow-x: hidden;
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

        .nav-bar > a {
            padding-right: 10px;
            font-size: 21px;
            font-family: Arial;
            color: white;
            text-decoration: none;
            transition: 0.6s;
        }

        .nav-bar > a:hover {
            color: black;
            transition: 0.6s;
        }

        .main_editBook {
            width: 100%;
            display: flex;
            padding: 10px;
            flex-wrap: wrap;
        }

        .content {
            width: 200px;
            border: 2px solid black;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 30px;
            margin-left: 7px;
            overflow: hidden;
        }

        .logo {
            font-size: 20px;
            color: white;
            font-family: sans-serif;

        }
    </style>
</head>
<body>
<%
    Author author = (Author) request.getAttribute("editAuthor");
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
    <div class="main_addAuthor">
        <form action="/author/edit" method="post">
            <form action="/book/edit" method="post">
                <input type="hidden" name="authorId" value="<%=author.getId()%>">
                <input type="text" name="name" value="<%=author.getName()%>">
                <input type="text" name="surname" value="<%author.getSurname()%>">
                <input type="text" name="email" value="<%=author.getEmail()%>">
                <input type="number" name="age" value="<%=author.getAge()%>">
                <input type="submit">
            </form>

    </div>
</div>
</body>
</html>
