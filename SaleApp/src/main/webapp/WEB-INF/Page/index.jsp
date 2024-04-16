<%-- 
Document   : index
Created on : Apr 1, 2024, 11:06:14 PM
Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">WEBSITE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Trang chủ</a>
                        </li>
                        <c:forEach items="${categories}" var ="c">
                            <li class="nav-item">
                                <c:url value="/" var="myUrl">
                                    <c:param name="cateId" value="${c.id}"/>
                                </c:url>
                                <a class="nav-link" href="${myUrl}">${c.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <form action="<c:url value="/"/>" class="d-flex">
                        <input class="form-control me-2" name="kw" type="text" placeholder="Search">
                        <button class="btn btn-primary" type="submit">Tim</button>
                    </form>
                </div>
            </div>
        </nav>
        <section class="container">
            <table class="table table-striped">
                <tr>
                    <th></th>
                    <th>Id</th>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th></th>
                </tr>
                <c:forEach items="${products}" var="p">
                    <tr>
                        <td><img class="card-img-top" src="${p.image}" alt="${p.name}" style="width: 300px;"/></td>
                        <td>${p.name}</td>
                        <td>${p.price} VND</td>
                        <td>
                            <button class="btn btn-info">Cập nhật</button>
                            <button class="btn btn-danger">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </section>
    </body>
</html>
