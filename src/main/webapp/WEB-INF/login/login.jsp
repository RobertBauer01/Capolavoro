<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1" >
    <link rel="icon" href="/static/img/beta80favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="./img/beta80favicon.png" type="image/x-icon">
    <title>Pagina Login</title>
    <link rel="stylesheet" href="/static/css/stylelogin.css">
</head>
<body>
    <div class="container">
        <div class="login-left">
            <div class="login-header">
                <h1>WELCOME</h1>
                <p>Please log in to the platform</p>
            </div>
            <form class="login-form" action="login" method="post">
                <div class="login-form-content">
                    <div class="form-item">
                        <label for="username">Username</label>
                        <input id="username" type="text" name="username" placeholder="Enter Username" class="form-control" required>
                    </div>
                    <div class="form-item">
                        <label for="password">Password</label>
                        <input id="password" type="password" name="password" placeholder="Enter password" class="form-control" required>
                    </div>
                    <input type="submit" class="btn btn-primary" value="SUBMIT"/>
                </div>
            </form>
        </div>
        <div class="login-right">
            <img src="static/img/beta80.png" alt="">
        </div>
    </div>
    <script>
        function validateForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;

            // Verifica se i campi email e password sono stati compilati
            if (email === "" || password === "") {
                alert("Perfavore compila tutti i campi!");
                return false; // Impedisce l'invio del modulo se i campi sono vuoti
            }
        }
    </script>
</body>
</html>