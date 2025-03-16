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
        logger.info("Получен список пользователей: {}", users);
        model.addAttribute("users", users);
        return "users";
    }

    // Просмотр деталей пользователя
    @GetMapping("/details")
    public String getUserDetails(@RequestParam Long id, Model model) {
        return handleUserById(id, model, "user-details");
    }

    // Отображение формы редактирования пользователя
    @GetMapping("/edit")
    public String showEditForm(@RequestParam Long id, Model model) {
        return handleUserById(id, model, "edit-user");
    }

    // Общий метод для обработки пользователя по ID
    private String handleUserById(Long id, Model model, String viewName) {
        User user = userService.getUserById(id);
        if (user == null) {
            logger.warn("Пользователь с id {} не найден", id);
            model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
            return "redirect:/users";
        }
        model.addAttribute("user", user);
        return viewName;
    }

    // Обновление данных пользователя
    @PostMapping("/update")
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        return handleUserSave(user, result, model, "edit-user", "Пользователь успешно обновлен: {}");
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
        if (!isValidName(user.getName())) {
            logger.warn("Некорректный формат имени: {}", user.getName());
            result.rejectValue("name", "error.user", "Имя должно содержать только буквы.");
            return "add-user";
        }
        return handleUserSave(user, result, model, "add-user", "Пользователь успешно добавлен: {}");
    }

    // Общий метод для сохранения пользователя
    private String handleUserSave(User user, BindingResult result, Model model, String errorView, String successLogMessage) {
        if (result.hasErrors()) {
            logger.warn("Ошибки валидации при сохранении пользователя: {}", result.getAllErrors());
            model.addAttribute("errors", result.getAllErrors()); // Используем "errors" для ошибок валидации
            return errorView;
        }

        // Если у пользователя есть ID, значит, это обновление, иначе — добавление
        if (user.getId() != null) {
            userService.updateUser(user); // Используем метод updateUser
            logger.info(successLogMessage, user);
        } else {
            userService.addUser(user); // Используем метод addUser
            logger.info(successLogMessage, user);
        }

        return "redirect:/users";
    }

    // Удаление пользователя
    @PostMapping("/delete")
    public String deleteUser(@RequestParam Long id, Model model) {
        try {
            userService.deleteUser(id);
            logger.info("Пользователь успешно удален с id: {}", id);
        } catch (Exception e) {
            logger.error("Ошибка при удалении пользователя с id {}: {}", id, e.getMessage());
            model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
        }
        return "redirect:/users";
    }

    // Проверка валидности имени
    private boolean isValidName(String name) {
        return name.matches("^[a-zA-Zа-яА-Я\\s]+$");
    }

    // Обработка общих ошибок
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        logger.error("Произошла ошибка: {}", e.getMessage());
        model.addAttribute("error", messageSource.getMessage("error.general", null, Locale.getDefault()));
        return "error"; // Возвращает страницу с ошибкой
    }
}