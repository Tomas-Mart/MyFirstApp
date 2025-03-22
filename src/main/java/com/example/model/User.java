package com.example.model;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Objects;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Имя обязательно для заполнения")
    @Pattern(regexp = "^[a-zA-Zа-яА-Я\\s]+$", message = "Имя должно содержать только буквы")
    @Column(name = "name", nullable = false)
    private String name;

    @NotBlank(message = "Электронная почта обязательна для заполнения")
    @Email(message = "Некорректный формат электронной почты")
    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Min(value = 1, message = "Возраст должен быть больше 0")
    @Column(name = "age", nullable = false)
    private int age;

    @NotEmpty(message = "Пароль обязателен для заполнения")
    @Column(name = "password", nullable = false)
    private String password;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return age == user.age && Objects.equals(id, user.id) && Objects.equals(name, user.name) && Objects.equals(email, user.email) && Objects.equals(password, user.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, email, age, password);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", age=" + age +
                ", password='" + password + '\'' +
                '}';
    }
}
