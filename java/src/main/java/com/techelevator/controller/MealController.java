package com.techelevator.controller;
import com.techelevator.dao.MealDao;
import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@PreAuthorize("isAuthenticated()")
public class MealController {

        private MealDao mealDao;

        public MealController(MealDao mealDao) {
                this.mealDao = mealDao;
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/mealId/{mealId}", method = RequestMethod.GET)
        public Meal findMealDetailsById(@PathVariable Long mealId) {
                return mealDao.findMealDetailsById(mealId);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/mealType/{mealType}", method = RequestMethod.GET)
        public List<Meal> findMealsByMealType(@PathVariable String mealType) {
                return mealDao.findMealsByMealType(mealType);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/mealDay/{mealDay}", method = RequestMethod.GET)
        public List<Meal> findMealsByDay(@PathVariable String mealDay) {
                return mealDao.findMealsByDay(mealDay);
        }

}

