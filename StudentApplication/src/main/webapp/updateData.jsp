<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
     <%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session.getAttribute("success") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
    
   <%--  <% String success=(String)request.getAttribute("success");
    if(success!=null){%>
    <h3><%=success %></h3>
    <%} %> --%>
    
    <% String failure=(String)request.getAttribute("failure");
    if(failure!=null){%>
    <h3><%=failure %></h3>
    <%} %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            font-size: 1.8rem;
            color: #333333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 1rem;
            color: #555555;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #dddddd;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        .update-btn {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            background-color: #007BFF;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .update-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Update Your Details</h1>
        <form action="updateData" method="get" enctype="application/x-www-form-urlencoded" autocomplete="on" target="_self">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="form-group">
                <label for="email">Email ID</label>
                <input type="email" id="email" name="email" placeholder="Enter your email ID" required>
            </div>
            <div class="form-group">
                <label for="branch">Branch</label>
                <input type="text" id="branch" name="branch" placeholder="Enter your branch" required>
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" placeholder="Enter your location" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="update-btn">Update</button>
        </form>
    </div>
</body>
</html>
    