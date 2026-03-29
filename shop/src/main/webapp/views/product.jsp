<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="domain.Product, domain.Manufacturer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Товары</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script defer src="js/jquery-3.6.4.js"></script>
<script defer src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="/views/header.jsp" />

    <h3>Список товаров</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Размер</th>
                <th>Вес</th>
                <th>Производитель</th>
                <th>Редактировать</th>
                <th>Удалить</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.getId()}</td>
                    <td>${p.getName()}</td>
                    <td>${p.getSize()}</td>
                    <td>${p.getWeight()}</td>
                    <td>${p.getManufacturer().getName()}</td>
                    <td><a href="#" class="btn btn-outline-primary"><img src="images/icon-edit.png" width="20" height="20" alt="Редактировать"></a></td>
                    <td><a href="#" class="btn btn-outline-danger"><img src="images/icon-delete.png" width="20" height="20" alt="Удалить"></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h3>Новый товар</h3>
    <form method="POST" action="">
        <div class="mb-3">
            <label class="form-label">Название</label>
            <input type="text" name="name" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Размер</label>
            <input type="text" name="size" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Вес (кг)</label>
            <input type="number" step="0.01" name="weight" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Производитель</label>
            <select name="manufacturerId" class="form-control">
                <option value="">Выберите производителя</option>
                <c:forEach var="m" items="${manufacturers}">
                    <option value="${m.getId()}">${m.getName()}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Добавить</button>
    </form>

    <jsp:include page="/views/footer.jsp" />
</div>
</body>
</html>