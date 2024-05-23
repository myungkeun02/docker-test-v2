package org.myungkeun.dockertestv2;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {
    @GetMapping
    ResponseEntity<Object> test() {
        String result = "test success";
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
