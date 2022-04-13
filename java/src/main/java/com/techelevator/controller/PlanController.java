package com.techelevator.controller;

import com.techelevator.dao.PlanDao;
import com.techelevator.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.List;

@RestController
@PreAuthorize("isAuthenticated()")
@CrossOrigin(origins = "http://localhost:8081")
public class PlanController {
    private PlanDao planDao;

    public PlanController(PlanDao planDao) {this.planDao = planDao;}

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/plans/{id}", method = RequestMethod.GET)
    public Plan getPlan(@PathVariable Long id) {
        return planDao.findPlanById(id);
    }
    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/plan/create", method = RequestMethod.POST)
    public void register(@RequestBody Plan plan) {
        Long planId = plan.getPlanId();
        String planName = plan.getPlanName();
        if (!planDao.createPlan(planName)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Transfer failed.");
        }

    }

//    @ResponseStatus(HttpStatus.CREATED)
//    @RequestMapping(path = "/createPlan", method = RequestMethod.POST)
//    public void createPlan(@RequestBody) {
//
//    }
}
