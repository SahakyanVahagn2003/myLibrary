<%--
  Created by IntelliJ IDEA.
  User: mrdo
  Date: 06.09.2022
  Time: 19:56
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
        a{
            padding-right:10px;
            font-size:21px;
            font-family:Arial;
            color:white;
            text-decoration:none;
            transition:0.6s;
        }
        a:hover{
            color:black;
            transition:0.6s;

        }
        .main_addAuthor{
            width:100%;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        form{
            display:flex;
            justify-content:center;
            align-content:center;
            flex-direction:column;

        }
        input {
            width:500px;
            height:60px;
            margin-top: 10px;
            background: none;
            border: 1px solid gray;
            color: gray;
        }
        .logo{
            font-size:20px;
            color:white;
            font-family:sans-serif;

        }
    </style>
</head>
<body>
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
        <form action="/author/add" method="post">
            <input type="text" name="name" placeholder="please input your name">
            <input type="text" name="surname" placeholder="please input your surname">
            <input type="text" name="email" placeholder="please input your email">
            <input type="number" name="age" placeholder="please input your age">
            <input type="submit">
        </form>

    </div>
</div>
</body>
</html>
