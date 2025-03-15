package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/users")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;
    private final MessageSource messageSource;

    @Autowired
    public UserController(UserService userService, MessageSource messageSource) {
        this.userService = userService;
        this.messageSource = messageSource;
    }

    // Установка кодировки для всех POST-запросов
    @ModelAttribute
    public void setCharacterEncoding(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    // Получение списка всех пользователей
    @GetMapping
    public String getAllUsers(Model model) {
        List<User> users = userService.getAllUsers();
        logger.info("Fetched users: {}", users);
        model.addAttribute("users", users);
        return "users";
    }

    // Просмотр деталей пользователя
    @GetMapping("/details")
    public String getUserDetails(@RequestParam Long id, Model model) {
        User user = userService.getUserById(id);
        if (user == null) {
            logger.warn("User with id {} not found", id);
            model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
            return "redirect:/users";
        }
        model.addAttribute("user", user);
        return "user-details";
    }

    // Отображение формы редактирования пользователя
    @GetMapping("/edit")
    public String showEditForm(@RequestParam Long id, Model model) {
        User user = userService.getUserById(id);
        if (user == null) {
            logger.warn("User with id {} not found", id);
            model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
            return "redirect:/users";
        }
        model.addAttribute("user", user);
        return "edit-user";
    }

    // Обновление данных пользователя
    @PostMapping("/update")
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            logger.warn("Validation errors while updating user: {}", result.getAllErrors());
            model.addAttribute("errors", result.getAllErrors());
            return "edit-user";
        }
        userService.updateUser(user);
        logger.info("User updated successfully: {}", user);
        return "redirect:/users";
    }

    // Отображение формы добавления пользователя
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new User());
        return "add-user";
    }

    // Добавление нового пользователя
    @PostMapping("/add")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            logger.warn("Validation errors while adding user: {}", result.getAllErrors());
            model.addAttribute("errors", result.getAllErrors());
            return "add-user";
        }

        // Дополнительная проверка имени
        if (!user.getName().matches("^[a-zA-Zа-яА-Я\\s]+$")) {
            logger.warn("Invalid name format: {}", user.getName());
            result.rejectValue("name", "error.user", "Имя должно содержать только буквы.");
            return "add-user";
        }

        userService.addUser(user);
        logger.info("User added successfully: {}", user);
        return "redirect:/users";
    }

    // Удаление пользователя
    @PostMapping("/delete")
    public String deleteUser(@RequestParam Long id, Model model) {
        try {
            userService.deleteUser(id);
            logger.info("User deleted successfully with id: {}", id);
        } catch (Exception e) {
            logger.error("Error deleting user with id {}: {}", id, e.getMessage());
            model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
        }
        return "redirect:/users";
    }

    // Обработка общих ошибок
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        logger.error("An error occurred: {}", e.getMessage());
        model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
        return "error"; // Возвращает страницу с ошибкой
    }
}