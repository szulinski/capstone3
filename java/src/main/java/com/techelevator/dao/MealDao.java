package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;

import java.util.Date;
import java.util.List;

public interface MealDao {

    Meal findMealDetailsById(Long mealId);

    Meal addRecipesToSingleMeal(Meal meal, Recipe recipe);

    List <Meal> findMealsByDate(Date mealDate);

    List <Meal> findMealsByMealType(String mealType);

    Meal createSingleMeal(Meal meal, Recipe recipe);

}
