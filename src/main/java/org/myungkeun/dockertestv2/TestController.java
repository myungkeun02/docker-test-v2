package org.myungkeun.dockertestv2;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/test")

public class TestController {

    private final SampleRepository sampleRepository;

    public TestController(SampleRepository sampleRepository) {
        this.sampleRepository = sampleRepository;
    }

    @GetMapping("/appTest")
    ResponseEntity<Object> test() {
        String result = "test success";
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/dbTest")
    ResponseEntity<Object> getAllSample() {
        List<Sample> samples = sampleRepository.findAll();
        return new ResponseEntity<>(samples, HttpStatus.OK);
    }
}
