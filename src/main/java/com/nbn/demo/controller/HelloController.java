package com.nbn.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping(value = "hello")
    public String sayHello(){
        System.out.println("Hello world new controller");
        return "Hello World";
    }
}
