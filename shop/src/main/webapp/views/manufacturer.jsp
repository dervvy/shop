<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="domain.Manufacturer" %>
<%
    // Тестовые данные
    Manufacturer m1 = new Manufacturer(1L, "Samsung", "South Korea", "Иванов И.И.", "+7 900 111-22-33");
    Manufacturer m2 = new Manufacturer(2L, "Apple", "USA", "Смит С.", "+1 555-222-33-44");
    Manufacturer m3 = new Manufacturer(3L, "Xiaomi", "China", "Ли Л.", "+86 123456789");
    Manufacturer m4 = new Manufacturer(4L, "Xiafdsfdsomi", "Chifdsfsdna", "Ли fdsdsЛ.", "+86 123456789");
    Manufacturer[] manufacturers = new Manufacturer[]{m1, m2, m3, m4};
    pageContext.setAttribute("manufacturers", manufacturers);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Производители</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script defer src="js/jquery-3.6.4.js"></script>
<script defer src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="/views/header.jsp" />

    <h3>Список производителей</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Страна</th>
                <th>Контактное лицо</th>
                <th>Телефон</th>
                <th>Редактировать</th>
                <th>Удалить</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="m" items="${manufacturers}">
                <tr>
                    <td>${m.getId()}</td>
                    <td>${m.getName()}</td>
                    <td>${m.getCountry()}</td>
                    <td>${m.getContactPerson()}</td>
                    <td>${m.getPhone()}</td>
					 <td><a href="#" class="btn btn-outline-primary"><img src="images/icon-edit.png" width="20" height="20" alt="Редактировать"></a></td>
                    <td><a href="#" class="btn btn-outline-danger"><img src="images/icon-delete.png" width="20" height="20" alt="Удалить"></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h3>Новый производитель</h3>
    <form method="POST" action="">
        <div class="mb-3">
            <label class="form-label">Название</label>
            <input type="text" name="name" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Страна</label>
            <input type="text" name="country" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Контактное лицо</label>
            <input type="text" name="contactPerson" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Телефон</label>
            <input type="text" name="phone" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Добавить</button>
    </form>

    <jsp:include page="/views/footer.jsp" />
</div>
</body>
</html>