<%-- 
    Document   : base
    Created on : Apr 16, 2024, 10:35:21 PM
    Author     : cis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title"/>
        </title>
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <section class="container">
            <tiles:insertAttribute name="content"/>
        </section>
            <tiles:insertAttribute name="footer"/>
    </body>
</html>
