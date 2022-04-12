package com.techelevator.dao;

import com.techelevator.model.Plan;

public interface PlanDao {

    Plan findPlanById(Long planId);

    boolean createPlan(Long userId, String planName);
}

