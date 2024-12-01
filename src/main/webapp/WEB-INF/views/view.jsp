<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="inc/header.jsp"%>
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
    <title>Add a contact</title>
</head>

<body>
<div class="container">
    <form class="row g-3 needs-validation" action="../edit_ok" method="post" novalidate>
        <div class="col-md-2">
            <input type="text" class="form-control" name="id" value="${vo.id}" hidden required disabled>
            <label for="validationCustom01" class="form-label">Name</label>
            <input type="text" class="form-control" id="validationCustom01" name="name" value="${vo.name}" required disabled>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please provide a name.
            </div>
        </div>
        <div class="col-md-10">
            <label for="validationCustom02" class="form-label">Title</label>
            <input type="text" class="form-control" id="validationCustom02" name="title" value="${vo.title}" required disabled>
            <div class="valid-feedback">
                Looking good!
            </div>
            <div class="invalid-feedback">
                Please provide a title.
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustom03" class="form-label">Phone no.</label>
            <input type="tel" class="form-control" id="validationCustom03" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${vo.phone}" required disabled>
            <div class="valid-feedback">
                Looking good!
            </div>
            <div class="invalid-feedback">
                Please provide a valid phone no.
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustom04" class="form-label">Post Type</label>
            <select class="form-select" id="validationCustom04" name="post_type" required disabled>
                <option value="">Choose...</option>
                <option value="Discussion">Discussion</option>
                <option value="Announcement">Announcement</option>
                <option value="Poll">Poll</option>
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
            <select class="form-select" id="validationCustom05" name="user_type" required disabled>
                <option value="">Choose...</option>
                <option value="Admin">Admin</option>
                <option value="Moderator">Moderator</option>
                <option value="User">User</option>
            </select>
            <div class="valid-feedback">
                Nice!
            </div>
            <div class="invalid-feedback">
                Please select one option.
            </div>
        </div>
        <div class="col-8">
            <a href="../edit/${vo.id}"><button class="btn btn-primary d-inline-flex align-items-center" type="button">
                <i class="bi bi-pencil-fill"></i>&nbsp; Go to Edit
            </button></a>
            <a href="../list"><button class="btn btn-secondary d-inline-flex align-items-center" type="button">
                <i class="bi bi-arrow-return-left"></i>&nbsp; Back to list
            </button></a>
        </div>
        <div class="col-4">
            <p class="text-end">Views: ${vo.view_count}</p>
        </div>
    </form>
</div>

<%@include file="inc/footer.jsp"%>
<script>
    window.onload = function () {
        let valPost = '${vo.post_type}';
        let valUser = '${vo.user_type}';

        let postOptions = document.querySelector("select[name=post_type]").options;
        let userOptions = document.querySelector("select[name=user_type]").options;
        for(let i=0; i<postOptions.length; i++){
            if(postOptions[i].value === valPost) postOptions[i].selected = true;
        }
        for(let i=0; i<userOptions.length; i++){
            if(userOptions[i].value === valUser) userOptions[i].selected = true;
        }
    }
</script>
</body>
</html>
