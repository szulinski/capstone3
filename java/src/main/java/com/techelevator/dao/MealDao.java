package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;

import java.util.Date;
import java.util.List;

public interface MealDao {

    Meal findMealDetailsById(Long mealId);

    List <Meal> findMealsByDay(String mealDay);

    List <Meal> findMealsByMealType(String mealType);

}
