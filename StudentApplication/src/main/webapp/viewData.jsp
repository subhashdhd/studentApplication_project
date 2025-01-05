<%@ page import="java.util.*" %>
<%@ page import="com.student.dto.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%--    <%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session.getAttribute("success") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
 --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .user-table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .user-table th, .user-table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .user-table th {
            background-color: #007bff;
            color: #fff;
        }

        .user-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .user-table tr:hover {
            background-color: #f1f1f1;
        }

        .delete-btn {
            padding: 5px 10px;
            color: #fff;
            background-color: #dc3545;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-transform: uppercase;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <!-- Display success or failure messages -->
    <% String success = (String) request.getAttribute("success");
       if (success != null) { %>
        <h3 style="color: green;"><%= success %></h3>
    <% } %>

    <% String failure = (String) request.getAttribute("failure");
       if (failure != null) { %>
        <h3 style="color: red;"><%= failure %></h3>
    <% } %>

    <% String failure1 = (String) request.getAttribute("failure1");
       if (failure1 != null) { %>
        <h3 style="color: red;"><%= failure1 %></h3>
    <% } %>
    
    <h1>All Students</h1>
   
    <table class="user-table">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Branch</th>
                <th>Location</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
                    for (Student s : students) { 
            %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getMailId() %></td>
                <td><%= s.getPhone() %></td>
                <td><%= s.getBranch() %></td>
                <td><%= s.getLocation() %></td>
                <td><%= s.getDate() %></td>
                <td>
                    <form action="deleteUser" method="POST">
                        <input type="hidden" name="email" value="<%= s.getMailId() %>">
                        <input type="hidden" name="phone" value="<%= s.getPhone() %>">
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <% } 
                } else { 
            %>
            <tr>
                <td colspan="8">No users found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

    