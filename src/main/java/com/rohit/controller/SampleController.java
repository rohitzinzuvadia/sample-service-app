package com.rohit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/sample/v1")
public class SampleController {
    Logger logger = LoggerFactory.getLogger(SampleController.class);

    @RequestMapping("/ping")
    public String ping(){
        logger.debug("ping called");
        String message = "Application is running : " + LocalDateTime.now();
        return message;
    }

    @RequestMapping("/greetings/{name}")
    public ResponseEntity<String> sayHello(@PathVariable("name") String name ){
        String message = "Hello " + name.toUpperCase();
        return ResponseEntity.status(HttpStatus.OK).body(message);
    }

}
