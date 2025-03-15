package com.example.service;

import com.example.model.User;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> getAllUsers() {
        logger.info("Fetching all users");
        return userRepository.getAllUsers();
    }

    @Override
    @Transactional(readOnly = true)
    public User getUserById(Long id) {
        logger.info("Fetching user by id: {}", id);
        User user = userRepository.getUserById(id);
        if (user == null) {
            logger.warn("User with id {} not found", id);
            throw new RuntimeException("User not found");
        }
        return user;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        // Дополнительная проверка имени
        if (!user.getName().matches("^[a-zA-Zа-яА-Я\\s]+$")) {
            logger.warn("Invalid name format: {}", user.getName());
            throw new IllegalArgumentException("Имя должно содержать только буквы.");
        }

        logger.info("Adding user: {}", user);
        userRepository.saveUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        logger.info("Updating user: {}", user);
        userRepository.updateUser(user);
    }

    @Override
    @Transactional
    public void deleteUser(Long id) {
        logger.info("Deleting user with id: {}", id);
        userRepository.deleteUser(id);
    }
}