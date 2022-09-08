<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: mrdo
  Date: 07.09.2022
  Time: 1:47
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
        .main_authors{
            width:100%;
            display:flex;
            padding:10px;
        }
        .content{
            width:200px;
            border:2px solid black;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-flow:column wrap;
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
    List<Author> all = (List<Author>) request.getAttribute("all");
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
    <div class="main_authors">

        <%for (Author author : all) {%>
        <div class="content">
            <div class="buttons">
                <a href="/author/remove?authorId=<%=author.getId()%>">remove</a> |
                <a href="/author/edit?authorId=<%=author.getId()%>">edit</a>
            </div>
        <div class="child_authors">
            <img src="">
            <h2><%=author.getName()%> <%=author.getSurname()%></h2>
            <h2><%=author.getEmail()%></h2>
            <h2> <%=author.getAge()%> <i>years old</i></h2>
        </div>
        <%}%>
        </div>
    </div>
</div>
</body>
</html>
