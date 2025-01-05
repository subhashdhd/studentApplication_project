<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0c3fc, #8ec5fc); /* Gradient background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 26px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
            font-size: 14px;
        }

        input[type="email"], 
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            background: #f9f9f9;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            color: #333;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        input:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .forgot-password {
            text-align: right;
            margin-bottom: 15px;
        }

        .forgot-password a {
            font-size: 14px;
            color: #007BFF;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .signup-option {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .signup-option a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
    
     <% String usuccess=(String)request.getAttribute("usuccess");
    if(usuccess!=null){%>
    <h3><%=usuccess %></h3>
    <%} %>
    
    <% String psuccess=(String)request.getAttribute("psuccess");
    if(psuccess!=null){%>
    <h3><%=psuccess %></h3>
    <%} %>
    
    <% String failure = (String)request.getAttribute("failure");
if(failure!=null){%>
<h3><%=failure %></h3><%} %><br>
    
        <h1>Log In</h1>
        <form action="login" method="GET">
            <label for="mailId">Email ID:</label>
            <input type="email" id="mailId" name="mailId" placeholder="Enter your email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <div class="forgot-password">
                <a href="forgot.jsp">Forgot Password?</a>
            </div>

            <button type="submit">Log In</button>
        </form>
        <div class="signup-option">
            Don't have an account? <a href="signup.jsp">Sign Up</a>
        </div>
    </div>
</body>
</html>