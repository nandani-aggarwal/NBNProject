package com.nbn.demo;

import com.nbn.demo.controller.HelloController;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.springframework.test.util.AssertionErrors.assertNotNull;

import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;

@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = DemoApplication.class)
public class SmokeHelloControllerTest {

    @Autowired
    private HelloController helloController;

    @Test
    public void testApplicationLload() {
        assertNotNull("HelloController is not loaded", helloController);
    }
}
