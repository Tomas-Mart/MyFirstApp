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

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;
    private final MessageSource messageSource;

    @Autowired
    public UserController(UserService userService, MessageSource messageSource) {
        this.userService = userService;
        this.messageSource = messageSource;
    }

    @ModelAttribute
    public void setCharacterEncoding(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    @GetMapping
    public String getAllUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }

    @GetMapping("/details")
    public String getUserDetails(@RequestParam Long id, Model model) {
        User user = userService.getUserById(id);
        if (user == null) {
            model.addAttribute("errorMessage", messageSource.getMessage("error.general", null, Locale.getDefault()));
            return "redirect:/users";
        }
        model.addAttribute("user", user);
        return "user-details";
    }

    @GetMapping("/edit")
    public String showEditForm(@RequestParam Long id, Model model) {
        User user = userService.getUserById(id);
        if (user == null) {
            model.addAttribute("errorMessage", messageSource.getMessage("error.general", null, Locale.getDefault()));
            return "redirect:/users";
        }
        model.addAttribute("user", user);
        return "edit-user";
    }

    @PostMapping("/update")
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "edit-user";
        }
        userService.updateUser(user);
        return "redirect:/users";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new User());
        return "add-user";
    }

    @PostMapping("/add")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "add-user";
        }
        userService.addUser(user);
        return "redirect:/users";
    }

    @PostMapping("/delete")
    public String deleteUser(@RequestParam Long id, Model model) {
        try {
            userService.deleteUser(id);
        } catch (Exception e) {
            model.addAttribute("errorMessage", messageSource.getMessage("error.general", null, Locale.getDefault()));
        }
        return "redirect:/users";
    }
}
