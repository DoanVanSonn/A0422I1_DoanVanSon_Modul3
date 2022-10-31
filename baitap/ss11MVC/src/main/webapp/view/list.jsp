<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/product?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <td>Id Product</td>
        <td>Name Product</td>
        <td>Price Product</td>
        <td>MenuFactoProduct</td>
        <td>GrenteeByYear</td>
    </tr>
    <c:forEach items='${requestScope["productList"]}' var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.getIdProduct}">${product.getNameProduct}</a></td>
            <td>${product.getPriceProduct()}</td>
            <td>${product.getMenufactureProduct()}</td>
            <td>${product.getGranteeByYear()}</td>
            <td><a href="/product?action=edit&id=${product.getIdProduct()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getIdProduct()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
