package com.example.repository;

import com.example.model.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional(readOnly = true)
    public List<User> getAllUsers() {
        logger.info("Получение списка всех пользователей из базы данных");
        return entityManager.createQuery("FROM User", User.class).getResultList();
    }

    @Override
    @Transactional(readOnly = true)
    public User getUserById(Long id) {
        logger.info("Поиск пользователя по ID: {}", id);
        User user = entityManager.find(User.class, id);
        if (user == null) {
            logger.warn("Пользователь с ID {} не найден в базе данных", id);
            throw new RuntimeException("Пользователь не найден");
        }
        return user;
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        logger.info("Сохранение нового пользователя: {}", user);
        entityManager.persist(user);
        logger.info("Пользователь успешно сохранен: {}", user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        logger.info("Обновление пользователя с ID {}: {}", user.getId(), user);
        entityManager.merge(user);
        logger.info("Пользователь успешно обновлен: {}", user);
    }

    @Override
    @Transactional
    public void deleteUser(Long id) {
        logger.info("Попытка удаления пользователя с ID: {}", id);
        User user = entityManager.find(User.class, id);
        if (user != null) {
            entityManager.remove(user);
            logger.info("Пользователь с ID {} успешно удален", id);
        } else {
            logger.warn("Пользователь с ID {} не найден для удаления", id);
            throw new RuntimeException("Пользователь не найден");
        }
    }
}