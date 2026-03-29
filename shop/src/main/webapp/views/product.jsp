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

<form method="POST" action="product">

    <td>
        ${p.getId()}
        <input type="hidden" name="id" value="${p.getId()}">
    </td>

    <td><input name="name" value="${p.getName()}" class="form-control"></td>
    <td><input name="size" value="${p.getSize()}" class="form-control"></td>
    <td><input name="weight" value="${p.getWeight()}" class="form-control"></td>

    <td>
        <select name="manufacturerId" class="form-control">
            <c:forEach var="m" items="${manufacturers}">
                <option value="${m.getId()}"
                    <c:if test="${m.getId() == p.getManufacturer().getId()}">selected</c:if>>
                    ${m.getName()}
                </option>
            </c:forEach>
        </select>
    </td>

<td>
<button 
type="button"
 class="btn btn-outline-primary""
 data-bs-toggle="modal"
 data-bs-target="#editProductModal"
 onclick="fillProductModal('${p.getId()}', '${p.getName()}', '${p.getSize()}', '${p.getWeight()}', '${p.getManufacturer().getId()}')">
 <img src="images/icon-edit.png" width="20" height="20" alt="Редактировать">
</button>
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

    <h3>Новый товар</h3>
<form method="POST" action="product">
    <input type="hidden" name="action" value="add">

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
<div class="modal fade" id="editProductModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <form method="POST" action="product">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" id="pId">

        <div class="modal-body">

          <input id="pName" name="name" class="form-control mb-2">
          <input id="pSize" name="size" class="form-control mb-2">
          <input id="pWeight" name="weight" class="form-control mb-2">

          <select id="pManufacturer" name="manufacturerId" class="form-control">
              <c:forEach var="m" items="${manufacturers}">
                  <option value="${m.getId()}">${m.getName()}</option>
              </c:forEach>
          </select>

        </div>

        <button class="btn btn-success">Сохранить</button>

      </form>

    </div>
  </div>
</div>
<script>
function fillProductModal(id, name, size, weight, manufacturerId) {
    document.getElementById("pId").value = id;
    document.getElementById("pName").value = name;
    document.getElementById("pSize").value = size;
    document.getElementById("pWeight").value = weight;
    document.getElementById("pManufacturer").value = manufacturerId;
}
function confirmDelete(type, name) {
    return confirm(`Вы действительно хотите удалить ${type} "${name}"?`);
}
</script>
</body>
</html>