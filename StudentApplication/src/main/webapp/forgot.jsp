<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--   <%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session.getAttribute("success") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>--%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
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

        .back-option {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .back-option a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .back-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Forgot Password</h1>
        <%-- <% String success=(String)request.getAttribute("success");
        if(success!=null){%>
        <h3><%=success %></h3>
        <%} %> --%>
        
        <% String failure=(String)request.getAttribute("failure");
        if(failure!=null){%>
        <h3><%=failure %></h3>
        <%} %>
        
        <% String user=(String)request.getAttribute("user");
        if(user!=null){%>
        <h3><%=user %></h3>
        <%} %>
        
        <% String mismatch=(String)request.getAttribute("mismatch");
        if(mismatch!=null){%>
        <h3><%=mismatch %></h3>
        <%} %>
        <form action="resetpassword" method="POST">
            <label for="mailId">Email ID:</label>
            <input type="email" id="mailId" name="mailId" placeholder="Enter your email" required>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" pattern="[0-9]{10}" required>

            <label for="newPass">New Password:</label>
            <input type="password" id="newPass" name="newPass" placeholder="Enter new password" required>

            <label for="confirmPass">Confirm Password:</label>
            <input type="password" id="confirmPass" name="confirmPass" placeholder="Confirm new password" required>

            <button type="submit">Reset Password</button>
        </form>
        <div class="back-option">
            <a href="login.jsp">Back to Login</a>
        </div>
    </div>
</body>
</html>
