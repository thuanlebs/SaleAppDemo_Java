<%-- 
Document   : index
Created on : Apr 1, 2024, 11:06:14 PM
Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-info mt-1">Quản trị sản phẩm</h1>
<div>
    <a class="btn btn-info" href="<c:url value="/products"/>">Thêm sản phẩm</a>
</div>
<table class="table table-striped mt-1">
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
            <td>${String.format("%,d", p.price)}VND</td>
            <td>
                <a class="btn btn-info" href="<c:url value="/products/${p.id}" />"  >Cập nhật</a>
                <button class="btn btn-danger">Xóa</button>
            </td>
        </tr>
    </c:forEach>
</table>
