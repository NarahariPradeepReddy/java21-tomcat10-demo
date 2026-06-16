
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Demo authentication
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("user", username);
            message = "Login Successful! Welcome " + username;
        } else {
            message = "Invalid Username or Password!";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beautiful Login Page</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #667eea, #764ba2);
        overflow: hidden;
    }

    .container {
        width: 380px;
        padding: 40px;
        background: rgba(255,255,255,0.15);
        backdrop-filter: blur(15px);
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.2);
        color: white;
        text-align: center;
    }

    .container h2 {
        margin-bottom: 25px;
        font-size: 32px;
        letter-spacing: 1px;
    }

    .input-box {
        margin: 20px 0;
        position: relative;
    }

    .input-box input {
        width: 100%;
        padding: 14px;
        border: none;
        outline: none;
        border-radius: 10px;
        background: rgba(255,255,255,0.2);
        color: white;
        font-size: 16px;
    }

    .input-box input::placeholder {
        color: #eee;
    }

    .btn {
        width: 100%;
        padding: 14px;
        border: none;
        border-radius: 10px;
        background: #ffffff;
        color: #764ba2;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn:hover {
        transform: translateY(-2px);
        background: #f2f2f2;
    }

    .message {
        margin-top: 20px;
        font-weight: bold;
    }

    .success {
        color: #90EE90;
    }

    .error {
        color: #ffb3b3;
    }

    .welcome {
        margin-top: 20px;
        font-size: 18px;
    }
</style>

</head>
<body>

<div class="container">

    <h2>🔐 Login</h2>

    <form method="post">
        <div class="input-box">
            <input type="text"
                   name="username"
                   placeholder="Enter Username"
                   required>
        </div>

        <div class="input-box">
            <input type="password"
                   name="password"
                   placeholder="Enter Password"
                   required>
        </div>

        <button class="btn" type="submit">
            Sign In
        </button>
    </form>

    <%
        if (!message.isEmpty()) {
            if (session.getAttribute("user") != null) {
    %>
                <div class="message success">
                    <%= message %>
                </div>

                <div class="welcome">
                    Logged in as:
                    <b><%= session.getAttribute("user") %></b>
                </div>
    <%
            } else {
    %>
                <div class="message error">
                    <%= message %>
                </div>
    <%
            }
        }
    %>

</div>

</body>
</html>
