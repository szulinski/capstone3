package com.techelevator.controller;
import com.techelevator.dao.MealDao;
import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;
@RestController
@PreAuthorize("isAuthenticated()")
public class MealController {

        private MealDao mealDao;
        public MealController(MealDao mealDao){this.mealDao = mealDao;}

        @RequestMapping(path = "/meals/{mealId}", method = RequestMethod.GET)
        public Meal findMealDetailsById(Long mealId){ return mealDao.findMealDetailsById(mealId);}

        @RequestMapping(path = "/meals/add/{recipeId}" , method = RequestMethod.POST)
        public Meal addRecipesToSingleMeal(@RequestBody Meal meal, Recipe recipeId){ return mealDao.addRecipesToSingleMeal(meal, recipeId);}

        @RequestMapping(path = "/meals/date/{mealDate}" , method = RequestMethod.GET)
        public List<Meal>findMealsByDate(Date mealDate){return mealDao.findMealsByDate(mealDate);}

        @RequestMapping(path = "/meals/type/{mealType}", method = RequestMethod.GET)
        public List <Meal> findMealsByMealType(String mealType){return mealDao.findMealsByMealType(mealType);}

        @RequestMapping(path = "/meals", method = RequestMethod.POST)
        public Meal createSingleMeal(@RequestBody Meal meal, Recipe recipeId){ return mealDao.createSingleMeal(meal, recipeId);}
    }
