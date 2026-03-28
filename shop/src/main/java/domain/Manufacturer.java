package domain;

/**
* Класс для данных о производителе
*/
public class Manufacturer {

// Идентификатор производителя
private Long id;

// Название производителя
private String name;

// Страна производителя
private String country;

// Контактное лицо
private String contactPerson;

// Телефон
private String phone;

// Конструкторы
public Manufacturer() {
}

public Manufacturer(String name, String country, String contactPerson, String phone) {
this.name = name;
this.country = country;
this.contactPerson = contactPerson;
this.phone = phone;
}

public Manufacturer(Long id, String name, String country, String contactPerson, String phone) {
this.id = id;
this.name = name;
this.country = country;
this.contactPerson = contactPerson;
this.phone = phone;
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

public String getCountry() {
return country;
}

public void setCountry(String country) {
this.country = country;
}

public String getContactPerson() {
return contactPerson;
}

public void setContactPerson(String contactPerson) {
this.contactPerson = contactPerson;
}

public String getPhone() {
return phone;
}

public void setPhone(String phone) {
this.phone = phone;
}

@Override
public String toString() {
return "Manufacturer {" +
"id=" + id +
", name='" + name + '\'' +
", country='" + country + '\'' +
", contactPerson='" + contactPerson + '\'' +
", phone='" + phone + '\'' +
'}';
}
}