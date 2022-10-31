<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <hr>
    <c:forEach var="customer" items="${custumerList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getBirthDay()}</td>
            <td>${customer.getAddress()}</td>
            <td><img src="${customer.getLinkUrl()}"
                     width="70px"
                     height="70px"
            >
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>