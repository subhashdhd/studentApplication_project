<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0c3fc, #8ec5fc);
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

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            background: #f7f9fc;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            color: #333;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        input[type="password"]:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
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

        .login-option {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .login-option a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .login-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <%String success=(String)request.getAttribute("success");
        if(success!=null){%>
        <h3><%=success %></h3>
        <%}%>
        
        <%String failure=(String)request.getAttribute("failure");
        if(failure!=null){%>
        <h3><%=failure %></h3>
        <%}%>
        <form action="signup" method="POST">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" pattern="[0-9]{10}" required>

            <label for="mailId">Email ID:</label>
            <input type="email" id="mailId" name="mailId" placeholder="Enter your email" required>

            <label for="branch">Branch:</label>
            <input type="text" id="branch" name="branch" placeholder="Enter your branch" required>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" placeholder="Enter your location" required>

            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" placeholder="Enter your password" required>

            <label for="confirmPass">Confirm Password:</label>
            <input type="password" id="confirmPass" name="confirmPass" placeholder="Confirm your password" required>

            <button type="submit">Sign Up</button>
        </form>
        <div class="login-option">
            Already have an account? <a href="login.jsp">Log In</a>
        </div>
    </div>
</body>
</html>
