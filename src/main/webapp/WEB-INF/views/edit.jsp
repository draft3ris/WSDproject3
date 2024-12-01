<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="inc/header.jsp"%>
<%@page import="project.jspfileuploadtest.ForumDAO, project.jspfileuploadtest.ForumVO"%>
<%
    String id = request.getParameter("id");
    System.out.println("edit.jsp id: " + id);
    boolean hasFile = false;
    ForumDAO dao = new ForumDAO();
    ForumVO forum_post = dao.getForumPost(Integer.parseInt(id));
    System.out.println("edit.jsp forum_post id: " + id);
    if(forum_post.getFileName() != null && !forum_post.getFileName().isEmpty()){
        hasFile = true;
    }
%>
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
<link rel="stylesheet" href="./my_2.css">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit a post</title>
</head>

<body>
<div class="container">
    <form class="row g-3 needs-validation" action="edit_ok.jsp" enctype="multipart/form-data" method="post" novalidate>
        <div class="col-md-2">
            <input type="text" class="form-control" name="id" value="<%=id%>" hidden required>
            <label for="validationCustom01" class="form-label">Name</label>
            <input type="text" class="form-control" id="validationCustom01" name="name" value="<%=forum_post.getName()%>" required>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please provide a name.
            </div>
        </div>
        <div class="col-md-10">
            <label for="validationCustom02" class="form-label">Title</label>
            <input type="text" class="form-control" id="validationCustom02" name="title" value="<%=forum_post.getTitle()%>" required>
            <div class="valid-feedback">
                Looking good!
            </div>
            <div class="invalid-feedback">
                Please provide a title.
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustom03" class="form-label">Phone no.</label>
            <input type="tel" class="form-control" id="validationCustom03" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="<%=forum_post.getPhone()%>" required>
            <div class="valid-feedback">
                Looking good!
            </div>
            <div class="invalid-feedback">
                Please provide a valid phone no.
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustom04" class="form-label">Post Type</label>
            <select class="form-select" id="validationCustom04" name="post_type" required>
                <option value="">Choose...</option>
                <option value="Discussion" <%= "Discussion".equals(forum_post.getPost_type()) ? "selected" : "" %>>Discussion</option>
                <option value="Announcement" <%= "Announcement".equals(forum_post.getPost_type()) ? "selected" : "" %>>Announcement</option>
                <option value="Poll" <%= "Poll".equals(forum_post.getPost_type()) ? "selected" : "" %>>Poll</option>
            </select>
            <div class="valid-feedback">
                Nice!
            </div>
            <div class="invalid-feedback">
                Please select one option.
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustom05" class="form-label">User Type</label>
            <select class="form-select" id="validationCustom05" name="user_type" required>
                <option value="">Choose...</option>
                <option value="Admin" <%= "Admin".equals(forum_post.getUser_type()) ? "selected" : "" %>>Admin</option>
                <option value="Moderator" <%= "Moderator".equals(forum_post.getUser_type()) ? "selected" : "" %>>Moderator</option>
                <option value="User" <%= "User".equals(forum_post.getUser_type()) ? "selected" : "" %>>User</option>
            </select>
            <div class="valid-feedback">
                Nice!
            </div>
            <div class="invalid-feedback">
                Please select one option.
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustom06" class="form-label">Attach file</label>
            <input type="file" class="form-control" id="validationCustom06" name="file">
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please provide a name.
            </div>
        </div>
        <div class="col-md-4 pt-5 pb-2">
            <a href="download.jsp?filename=<%=forum_post.getFileName()%>" id="fileLink"></a>
        </div>
        <div class="col-8">
            <button class="btn btn-primary d-inline-flex align-items-center" type="submit">
                <i class="bi bi-pencil-fill"></i>&nbsp; Edit
            </button>
            <a href="view.jsp?id=<%=forum_post.getId()%>"><button class="btn btn-danger d-inline-flex align-items-center" type="button">
                <i class="bi bi-x-square-fill"></i>&nbsp; Cancel
            </button></a>
            <a href="index.jsp"><button class="btn btn-secondary d-inline-flex align-items-center" type="button">
                <i class="bi bi-arrow-return-left"></i>&nbsp; Return to list
            </button></a>
        </div>
    </form>
</div>

<%@include file="inc/footer.jsp"%>
<script>
(() => {
    'use strict'

    const forms = document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false)
    })
})()
</script>
<script>
    let a = <%=hasFile%>;
    if(a){document.getElementById("fileLink").innerHTML = "Download currently uploaded file."}
</script>
</body>
</html>
