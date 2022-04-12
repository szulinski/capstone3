package com.techelevator.dao;

import com.techelevator.model.Meal;

import java.util.Date;
import java.util.List;

public interface MealDao {

    Meal findMealDetailsById(Long mealId);

    Meal addRecipesToSingleMeal(String recipeId);

    Meal findMealsByDate(Date mealDate);

    Meal findMealByType(String mealType);

    Meal createSingleMeal();

}
