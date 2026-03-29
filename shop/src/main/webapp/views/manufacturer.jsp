<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="domain.Manufacturer" %>

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

<form method="POST" action="manufacturer">

    <td>
        ${m.getId()}
        <input type="hidden" name="id" value="${m.getId()}">
    </td>

    <td><input name="name" value="${m.getName()}" class="form-control"></td>
    <td><input name="country" value="${m.getCountry()}" class="form-control"></td>
    <td><input name="contactPerson" value="${m.getContactPerson()}" class="form-control"></td>
    <td><input name="phone" value="${m.getPhone()}" class="form-control"></td>

<td>
<button 
	type="button"
    class="btn btn-primary"
    data-bs-toggle="modal"
    data-bs-target="#editModal"
    onclick="fillModal('${m.getId()}', '${m.getName()}', '${m.getCountry()}', '${m.getContactPerson()}', '${m.getPhone()}')">
    <img src="images/icon-edit.png" width="20" height="20" alt="Редактировать">
</button>
</td>

<td>
    <button type="submit" name="action" value="delete" class="btn btn-outline-danger"
            onclick="return confirmDelete('товар', '${p.name}')">
        <img src="images/icon-delete.png" width="20" height="20" alt="Удалить">
    </button>
</td>

</form>

</tr>
</c:forEach>
</tbody>
    </table>
<h3>Новый производитель</h3>
<form method="POST" action="manufacturer">
    <input type="hidden" name="action" value="add">

    <div class="mb-3">
        <label class="form-label">Название</label>
        <input type="text" name="name" class="form-control" placeholder="Название">
    </div>

    <div class="mb-3">
        <label class="form-label">Страна</label>
        <input type="text" name="country" class="form-control" placeholder="Страна">
    </div>

    <div class="mb-3">
        <label class="form-label">Контактное лицо</label>
        <input type="text" name="contactPerson" class="form-control" placeholder="Контакт">
    </div>

    <div class="mb-3">
        <label class="form-label">Телефон</label>
        <input type="text" name="phone" class="form-control" placeholder="Телефон">
    </div>

    <button type="submit" class="btn btn-primary">Добавить</button>
</form>
    <jsp:include page="/views/footer.jsp" />
</div>
<div class="modal fade" id="editModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">

      <form method="POST" action="manufacturer">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" id="editId">

        <div class="modal-header">
          <h5 class="modal-title">Редактировать производителя</h5>
        </div>

        <div class="modal-body">

          <input id="editName" name="name" class="form-control mb-2">
          <input id="editCountry" name="country" class="form-control mb-2">
          <input id="editContact" name="contactPerson" class="form-control mb-2">
          <input id="editPhone" name="phone" class="form-control mb-2">

        </div>

        <div class="modal-footer">
          <button class="btn btn-success">Сохранить</button>
        </div>

      </form>

    </div>
  </div>
</div>
<script>
function fillModal(id, name, country, contact, phone) {
    document.getElementById("editId").value = id;
    document.getElementById("editName").value = name;
    document.getElementById("editCountry").value = country;
    document.getElementById("editContact").value = contact;
    document.getElementById("editPhone").value = phone;
}
function confirmDelete(type, name) {
    return confirm(`Вы действительно хотите удалить ${type} ?`);
}
</script>
</body>
</html>