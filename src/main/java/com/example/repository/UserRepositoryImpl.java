package com.example.repository;

import com.example.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class UserRepositoryImpl implements UserRepository {

    private static final Logger logger = LoggerFactory.getLogger(UserRepositoryImpl.class);
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<User> getAllUsers() {
        logger.info("Запрос на получение списка всех пользователей из базы данных");
        return entityManager.createQuery("FROM User", User.class).getResultList();
    }

    @Override
    public User getUserById(Long id) {
        logger.info("Запрос на получение пользователя по ID: {}", id);
        User user = entityManager.find(User.class, id);
        if (user == null) {
            logger.warn("Пользователь с ID {} не найден в базе данных", id);
            throw new RuntimeException("Пользователь не найден");
        }
        return user;
    }

    @Override
    public void saveUser(User user) {
        logger.info("Запрос на сохранение нового пользователя: {}", user);
        entityManager.persist(user);
        logger.info("Пользователь успешно сохранен: {}", user);
    }

    @Override
    public void updateUser(User user) {
        logger.info("Запрос на обновление пользователя с ID {}: {}", user.getId(), user);
        entityManager.merge(user);
        logger.info("Пользователь успешно обновлен: {}", user);
    }

    @Override
    public void deleteUser(Long id) {
        logger.info("Запрос на удаление пользователя с ID: {}", id);
        User user = entityManager.find(User.class, id);
        if (user == null) {
            logger.warn("Пользователь с ID {} не найден для удаления", id);
            throw new RuntimeException("Пользователь не найден");
        }
        entityManager.remove(user);
        logger.info("Пользователь с ID {} успешно удален", id);
    }
}