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
        logger.info("Fetching all users");
        return entityManager.createQuery("FROM User", User.class).getResultList();
    }

    @Override
    @Transactional(readOnly = true)
    public User getUserById(Long id) {
        logger.info("Fetching user by id: {}", id);
        User user = entityManager.find(User.class, id);
        if (user == null) {
            logger.warn("User with id {} not found", id);
            throw new RuntimeException("User not found");
        }
        return user;
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        logger.info("Saving user: {}", user);
        entityManager.persist(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        logger.info("Updating user: {}", user);
        entityManager.merge(user);
    }

    @Override
    @Transactional
    public void deleteUser(Long id) {
        logger.info("Deleting user with id: {}", id);
        User user = entityManager.find(User.class, id);
        if (user != null) {
            entityManager.remove(user);
        } else {
            logger.warn("User with id {} not found", id);
            throw new RuntimeException("User not found");
        }
    }
}