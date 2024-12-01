<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="./inc/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <form class="row g-3 needs-validation" action="/search" method="get" novalidate>
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
            <button class="btn btn-primary d-inline-flex align-items-center" type="button" onclick="javascript:search()">
                <i class="bi bi-search"></i>&nbsp Search
            </button>
            <a href="list"><button class="btn btn-danger d-inline-flex align-items-center" type="button">
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
                <th scope="col" class="align-middle text-center">#</th>
                <th scope="col" class="align-middle text-center">ID</th>
                <th scope="col" class="align-middle text-center">Name</th>
                <th scope="col" class="align-middle text-center">Title</th>
                <th scope="col" class="align-middle text-center">Phone no.</th>
                <th scope="col" class="align-middle text-center">Post Type</th>
                <th scope="col" class="align-middle text-center">User Type</th>
                <th scope="col" class="align-middle text-center">Actions</th>
                <th scope="col" class="align-middle text-center">Views</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="o" varStatus="status">
                <tr>
                    <td class="align-middle text-center">${fn:length(list)-status.index}</td>
                    <td class="align-middle text-center"><c:out value="${o.id}"/></td>
                    <td class="align-middle text-center"><c:out value="${o.name}"/></td>
                    <td class="align-middle text-center">
                        <a class="link-info link-offset-2 link-opacity-75-hover link-opacity-underline-50-hover" href='view/${o.id}'>
                            <c:out value="${o.title}"/>
                        </a>
                    </td>
                    <td class="align-middle text-center"><c:out value="${o.phone}"/></td>
                    <td class="align-middle text-center"><c:out value="${o.post_type}"/></td>
                    <td class="align-middle text-center"><c:out value="${o.user_type}"/></td>
                    <td class="align-middle text-center">
                        <div class="btn-group">
                            <a href='edit/${o.id}'><button class="btn btn-outline-primary d-inline-flex align-items-center" type="button">
                                <i class="bi bi-pencil-fill"></i>&nbsp <div id="actionbuttontext">Edit</div>
                            </button></a>
                            <button type="button" class="btn btn-outline-danger d-inline-flex align-items-center" onclick="javascript:delete_ok('${o.id}')">
                                <i class="bi bi-trash-fill"></i>&nbsp <div id="actionbuttontext">Delete</div>
                            </button>
                        </div>
                    </td>
                    <td class="align-middle text-center"><c:out value="${o.view_count}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="container-fluid">
    <a href='./add'><button type="button" class="btn btn-success d-inline-flex align-items-center">
        <i class="bi bi-plus-square-fill"></i>&nbsp <div id="actionbuttontext">Add</div>
    </button></a>
</div>
<script>
    function delete_ok(id){
        if(confirm("Are you sure you want to delete this post?")){
            location.href = 'delete_ok/' + id;
        }
    }
    function search(){
        const title = document.getElementById("validationCustom01").value.trim();
        const user_type = document.getElementById("validationCustom05").value.trim();
        let uri = "search?";
        if(!title && !user_type){
            alert("Query is empty!")
        }
        else{
            if(title){
                uri = uri + "title=" + encodeURIComponent(title);
            }else{
                uri = uri + "title="
            }
            if(user_type){
                uri = uri + "&userType=" + encodeURIComponent(user_type);
            }
            else{
                uri = uri + "&userType=";
            }
            location.href = uri;
        }
    }
</script>
<%@include file="./inc/footer.jsp"%>
</body>
</html>