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
        logger.info("Запрос на получение списка всех пользователей");
        return userRepository.getAllUsers();
    }

    @Override
    @Transactional(readOnly = true)
    public User getUserById(Long id) {
        logger.info("Запрос на получение пользователя по ID: {}", id);
        return userRepository.getUserById(id);
    }

    @Override
    @Transactional
    public void addUser(User user) {
        validateUserName(user.getName());
        logger.info("Запрос на добавление нового пользователя: {}", user);
        userRepository.saveUser(user);
        logger.info("Пользователь успешно добавлен: {}", user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        validateUserName(user.getName());
        logger.info("Запрос на обновление пользователя: {}", user);
        userRepository.updateUser(user);
        logger.info("Пользователь успешно обновлен: {}", user);
    }

    @Override
    @Transactional
    public void deleteUser(Long id) {
        logger.info("Запрос на удаление пользователя с ID: {}", id);
        userRepository.deleteUser(id);
        logger.info("Пользователь с ID {} успешно удален", id);
    }

    private void validateUserName(String name) {
        if (name == null || !name.matches("^[a-zA-Zа-яА-Я\\s]+$")) {
            logger.warn("Некорректный формат имени: {}", name);
            throw new IllegalArgumentException("Имя должно содержать только буквы и пробелы.");
        }
    }
}