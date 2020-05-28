package com.nbn.demo;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.assertj.core.api.Assertions.assertThat;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, classes = DemoApplication.class)
public class HTTPRequestTest {

    @LocalServerPort
    private int localPort;

    @Autowired
    private TestRestTemplate testRestTemplate;

    @Test
    public void testShouldReturnMessage() {
        //String text = testRestTemplate.getForObject("http://localhost:" + localPort + "/hello", String.class);
        assertThat(testRestTemplate.getForObject("http://localhost:" + localPort + "/hello", String.class)
                .contains("Hello World"));
        //assertTrue("Failure",text.contains("Hello World"));

    }
}

