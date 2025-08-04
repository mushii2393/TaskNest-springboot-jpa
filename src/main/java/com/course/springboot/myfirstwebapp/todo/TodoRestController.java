package com.course.springboot.myfirstwebapp.todo;

import org.springframework.web.bind.annotation.*;

@RestController
public class TodoRestController {

    private final TodoRepository todoRepository;

    public TodoRestController(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }

    @PostMapping("/toggle-done")
    public String toggleDone(@RequestParam int id) {
        Todo todo = todoRepository.findById(id).orElse(null);
        if (todo != null) {
            todo.setDone(!todo.isDone());
            todoRepository.save(todo);
            return "success";
        }
        return "error";
    }
}