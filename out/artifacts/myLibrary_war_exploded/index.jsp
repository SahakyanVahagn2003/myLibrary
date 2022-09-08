<%--
  Created by IntelliJ IDEA.
  User: mrdo
  Date: 06.09.2022
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
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

    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo"></div>
        <div class="nav-bar">
            <a href="/author/add">add author</a>
            <a href="/book/add">add book</a>
            <a href="/all/authors">see authors</a>
            <a href="/all/books">see books</a>
        </div>
    </div>
</div>
</body>
</html>
