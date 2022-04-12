package com.techelevator.controller;

import com.techelevator.dao.PlanDao;
import com.techelevator.model.Plan;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@PreAuthorize("isAuthenticated()")
public class PlanController {
    private PlanDao planDao;

    public PlanController(PlanDao planDao) {this.planDao = planDao;}

    @RequestMapping(path = "/plans/{id}", method = RequestMethod.GET)
    public Plan getPlan(@PathVariable Long id) {
        return planDao.getPlan(id);
    }

//    @ResponseStatus(HttpStatus.CREATED)
//    @RequestMapping(path = "/createPlan", method = RequestMethod.POST)
//    public void createPlan(@RequestBody) {
//
//    }
}
