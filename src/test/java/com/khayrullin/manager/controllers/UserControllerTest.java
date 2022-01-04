package com.khayrullin.manager.controllers;

import com.khayrullin.manager.domain.User;
import com.khayrullin.manager.repos.UserRepo;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UserControllerTest {

    UserRepo userRepo;

    @Test
    void userList() {
        List<User> userList = userRepo.findAll();
        System.out.println(userList);
    }

    @Test
    void userEditForm() {
    }

    @Test
    void userSave() {
    }
}