package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Date;

public class JdbcMealDao implements MealDao{

    private JdbcTemplate jdbcTemplate;

    @Override
    public Meal findMealDetailsById(Long mealId) {
        String sql = "SELECT * FROM meals WHERE meal_id = ?;";
        Meal mealDetailsByMealId = jdbcTemplate.queryForObject(sql, Meal.class, mealId);
        return mealDetailsByMealId;
    }

    @Override
    public Meal addRecipesToSingleMeal(Meal meal, Recipe recipe) {
        String sql = "INSERT INTO meals(meal_id, recipe_id) VALUES (?, ?);";
        try {
            return jdbcTemplate.queryForObject(sql, Meal.class, meal.getMealId(), recipe.getRecipeId();
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public Meal findMealsByDate(Date mealDate) {
        String sql = "SELECT * FROM meals WHERE meal_date = ?;";
        Meal mealsByDate = jdbcTemplate.queryForObject(sql, Meal.class, mealDate);
        return mealsByDate;
    }

    @Override
    public Meal findMealByType(String mealType) {
        String sql = "SELECT * FROM meals WHERE type_of_meal = ?;";
        Meal mealsByType = jdbcTemplate.queryForObject(sql, Meal.class, mealType);
        return mealsByType;
    }

    @Override
    public Meal createSingleMeal(Meal meal, Recipe recipe) {
        String sql= "INSERT into meals VALUES (DEFAULT, ?, ?, ?) RETURNING meal_id;";
        try{
            return jdbcTemplate.queryForObject(sql, Meal.class, recipe.getRecipeId(), meal.getMealType(), meal.getMealDate());
        } catch (DataAccessException e){
            return null;
        }
    }


}
