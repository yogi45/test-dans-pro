package com.app.danspro.job;

import java.util.Map;

import javax.annotation.security.RolesAllowed;

import org.apache.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/job")
public class JobController {
	
	static final Logger log= LoggerFactory.getLogger(JobController.class);

	@Autowired
	JobService jobService;
	
	@GetMapping("/getList")
    public ResponseEntity<?> getList(){

	 	Map[] map = jobService.getlistJob();
        return  ResponseEntity
                .status(HttpStatus.SC_ACCEPTED)
                .contentType(MediaType.APPLICATION_JSON)
                .body(map);

    }
	
	@GetMapping("/getDetail/{jobId}")
    public ResponseEntity<?> getJobDetail(@PathVariable(value="jobId") String jobId){

	 	Map map = jobService.getDetailJob(jobId);
        return  ResponseEntity
                .status(HttpStatus.SC_ACCEPTED)
                .contentType(MediaType.APPLICATION_JSON)
                .body(map);

    }
}
