<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./inc/header.jsp"%>
<%@page import="project.jspfileuploadtest.ForumDAO, project.jspfileuploadtest.ForumVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String title = request.getParameter("title");
    String user_type = request.getParameter("user_type");
    System.out.println("title: " + title);
    System.out.println("user_type: " + user_type);
    ForumDAO dao = new ForumDAO();
    ArrayList<ForumVO> post_list = dao.getForumList(user_type , title);
%>
<!DOCTYPE html>

<html lang="en" data-bs-theme="dark">
<!--bootstrap cdn-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!--font awesome-->
<script src="https://kit.fontawesome.com/49eb66b820.js" crossorigin="anonymous"></script>

<!--bootstrap icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      integrity="sha384-tViUnnbYAV00FLIhhi3v/dWt3Jxw4gZQcNoSCxCIFNJVCx7/D55/wXsrNIRANwdD" crossorigin="anonymous">

<!--bootstrap js-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!--custom css-->
<link rel="stylesheet" href="./my_1.css">

<script src="my_1.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project 2-1</title>
</head>
<body>
<div class="container-fluid row g-3">
    <h4>Search post</h4>
    <form class="row g-3 needs-validation" action="" method="get" novalidate>
        <div class="col-md-4">
            <label for="validationCustom05" class="form-label">User Type</label>
            <select class="form-select" id="validationCustom05" name="user_type">
                <option selected value="">Choose...</option>
                <option value="Admin">Admin</option>
                <option value="Moderator">Moderator</option>
                <option value="User">User</option>
            </select>
        </div>
        <div class="col-md-4">
            <label for="validationCustom01" class="form-label">Post Title</label>
            <input type="text" class="form-control" id="validationCustom01" name="title">
        </div>
        <div class="col-md-4 pt-4">
            <button class="btn btn-primary d-inline-flex align-items-center" type="submit">
                <i class="bi bi-search"></i>&nbsp Search
            </button>
            <a href="index.jsp"><button class="btn btn-danger d-inline-flex align-items-center" type="button">
                <i class="bi bi-x-square-fill"></i>&nbsp; Clear
            </button></a>
        </div>
    </form>
</div>
<hr>
<!--table-->
<div class="container-fluid" id="table-container">
    <div class="table-responsive small">
        <table class="table table-striped table-sm table-hover" style="margin:auto;">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Title</th>
                <th scope="col">Phone no.</th>
                <th scope="col">Post Type</th>
                <th scope="col">User Type</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="<%=post_list%>" var="o">
                <tr>
                    <td class="align-middle"><c:out value="${o.id}"/></td>
                    <td class="align-middle"><c:out value="${o.name}"/></td>
                    <td class="align-middle">
                        <a class="link-info link-offset-2 link-opacity-75-hover link-opacity-underline-50-hover" href='view.jsp?id=${o.id}'>
                            <c:out value="${o.fileName eq null ? '' : '[FILE] '}${o.title}"/>
                        </a>
                    </td>
                    <td class="align-middle"><c:out value="${o.phone}"/></td>
                    <td class="align-middle"><c:out value="${o.post_type}"/></td>
                    <td class="align-middle"><c:out value="${o.user_type}"/></td>
                    <td class="align-middle">
                        <div class="btn-group">
                            <a href='edit.jsp?id=${o.id}'><button class="btn btn-outline-primary d-inline-flex align-items-center" type="button">
                                <i class="bi bi-pencil-fill"></i>&nbsp <div id="actionbuttontext">Edit</div>
                            </button></a>
                            <button type="button" class="btn btn-outline-danger d-inline-flex align-items-center" onclick="confirmDelete(${o.id});">
                                <i class="bi bi-trash-fill"></i>&nbsp <div id="actionbuttontext">Delete</div>
                            </button>
                            <a href='view.jsp?id=${o.id}'><button type="button" class="btn btn-outline-info d-inline-flex align-items-center">
                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp <div id="actionbuttontext">Details</div>
                            </button></a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="container-fluid">
    <a href='add.jsp'><button type="button" class="btn btn-success d-inline-flex align-items-center">
        <i class="bi bi-plus-square-fill"></i>&nbsp <div id="actionbuttontext">Add</div>
    </button></a>
</div>
</div>

<%@include file="./inc/footer.jsp"%>
</body>
</html>