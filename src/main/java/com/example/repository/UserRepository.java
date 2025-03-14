package com.example.repository;

import com.example.model.User;
import java.util.List;

public interface UserRepository {
    List<User> getAllUsers();
    User getUserById(Long id);
    void saveUser(User user);
    void updateUser(User user);
    void deleteUser(Long id);
}