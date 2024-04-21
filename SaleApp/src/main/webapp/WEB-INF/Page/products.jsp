<%-- 
    Document   : product
    Created on : Apr 17, 2024, 12:16:59 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-info mt-1">Quản lý sản phẩm</h1>

<c:url value="/products" var="action"/>
<form:form method="post" action="${action}" modelAttribute="product" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    
    <div class="form-floating mt-3 mb-3">
        <form:input class="form-control" id="name" placeholder="Tên sản phẩm" path="name" />
        <label for="name">Tên sản phẩm</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <form:input class="form-control" id="price" placeholder="Giá" path="price" />
        <label for="name">Giá sản phẩm</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <form:input type="file" class="form-control" id="image" path="file" />
        <label for="image">Ảnh sản phẩm</label>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="categoryId" path="categoryId">
            <c:forEach items="${categories}" var="c"> 
                <option value="${c.id}">${c.name}</option>
            </c:forEach>    
        </form:select>
        <label for="sel1" class="form-label">Danh mục</label>
    </div>
    <div class="form-floating">
        <button class="btn btn-info mt-1"type="submit">Thêm</button>
    </div>
</form:form>