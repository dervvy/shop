package domain;

/**
* Класс для данных о товаре
*/
public class Product {

// Идентификатор товара
private Long id;

// Наименование
private String name;

// Размер
private String size;

// Вес
private Double weight;

// Внешний ключ на производителя
private Long manufacturerId;

// Навигационное свойство - ссылка на производителя
private Manufacturer manufacturer;

// Конструкторы
public Product() {
}

public Product(String name, String size, Double weight, Manufacturer manufacturer) {
this.name = name;
this.size = size;
this.weight = weight;
this.manufacturer = manufacturer;
if (manufacturer != null) {
this.manufacturerId = manufacturer.getId();
}
}

public Product(Long id, String name, String size, Double weight, Long manufacturerId, Manufacturer manufacturer) {
this.id = id;
this.name = name;
this.size = size;
this.weight = weight;
this.manufacturerId = manufacturerId;
this.manufacturer = manufacturer;
}

// Геттеры и сеттеры
public Long getId() {
return id;
}

public void setId(Long id) {
this.id = id;
}

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

public String getSize() {
return size;
}

public void setSize(String size) {
this.size = size;
}

public Double getWeight() {
return weight;
}

public void setWeight(Double weight) {
this.weight = weight;
}

public Long getManufacturerId() {
return manufacturerId;
}

public void setManufacturerId(Long manufacturerId) {
this.manufacturerId = manufacturerId;
}

public Manufacturer getManufacturer() {
return manufacturer;
}

public void setManufacturer(Manufacturer manufacturer) {
this.manufacturer = manufacturer;
if (manufacturer != null) {
this.manufacturerId = manufacturer.getId();
}
}

@Override
public String toString() {
return "Product {" +
"id=" + id +
", name='" + name + '\'' +
", size='" + size + '\'' +
", weight=" + weight +
", manufacturer=" + (manufacturer != null ? manufacturer.getName() : null) +
'}';
}
}