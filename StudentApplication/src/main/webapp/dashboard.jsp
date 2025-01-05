<%@ page import="com.student.dto.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session.getAttribute("success") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
    
    <%
   /*  Student success=(Student)request.getAttribute("success");  */ 
   
   Student success=(Student)session.getAttribute("success");
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Welcome <%=success.getName() %></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
               
               <!-- admine -->
                <% if (success.getId() == 7) { %>
    				<li class="nav-item">
       					 <a class="nav-link" href="viewData"><p>View Data</p></a>
    				</li><% } %>
    				
    				
					<li class="nav-item">
                        <a class="nav-link" href="forgot.jsp">Reset Password</a>
                    </li>
                    <li class="nav-item">
  						<a class="nav-link" href="updateData.jsp">Update Data</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-danger nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Header -->
    <div class="container mt-4">
        <h1 class="text-center mb-4">Dashboard</h1>
    </div>

    <!-- User Section -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>View Your Data</h3>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Mail ID</th>
                            <th>Branch</th>
                            <th>Location</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- Data rows will go here -->
                        <tr>
                        <td><%= success.getId() %></td>
                        <td><%= success.getName() %></td>
                        <td><%= success.getPhone() %></td>
                        <td><%= success.getMailId() %></td>
                        <td><%= success.getBranch() %></td>
                        <td><%= success.getLocation() %></td>
                        </tr>
                        
                     </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>