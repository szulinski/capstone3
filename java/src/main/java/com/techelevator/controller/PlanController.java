package com.techelevator.controller;

import com.techelevator.dao.PlanDao;
import com.techelevator.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@PreAuthorize("isAuthenticated()")
public class PlanController {
    private PlanDao planDao;

    public PlanController(PlanDao planDao) {this.planDao = planDao;}

    @RequestMapping(path = "/plans/{id}", method = RequestMethod.GET)
    public Plan getPlan(@PathVariable Long id) {
        return planDao.findPlanById(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public void register(@Valid @RequestBody RegisterUserDTO newUser) {
    }

//    @ResponseStatus(HttpStatus.CREATED)
//    @RequestMapping(path = "/createPlan", method = RequestMethod.POST)
//    public void createPlan(@RequestBody) {
//
//    }
}
