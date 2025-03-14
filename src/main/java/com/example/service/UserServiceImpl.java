package com.example.service;

import com.example.model.User;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public List<User> getAllUsers() {
        return userRepository.getAllUsers(); // Используем метод getAllUsers() из репозитория
    }

    @Override
    @Transactional
    public void addUser(User user) {
        userRepository.saveUser(user); // Используем метод saveUser() из репозитория
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        userRepository.updateUser(user); // Используем метод updateUser() из репозитория
    }

    @Override
    @Transactional
    public void deleteUser(Long id) {
        userRepository.deleteUser(id); // Используем метод deleteUser() из репозитория
    }

    @Override
    @Transactional(readOnly = true)
    public User getUserById(Long id) {
        return userRepository.getUserById(id); // Используем метод getUserById() из репозитория
    }
}