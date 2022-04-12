package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    public List<Meal> findMealsByDate(Date mealDate) {
        List <Meal> mealList = new ArrayList<>();
        String sql = "SELECT * FROM meals WHERE meal_date = ?;";
        SqlRowSet mealDetails = jdbcTemplate.queryForRowSet(sql, mealDate);
        while (mealDetails.next()){
            Meal meal = mapRowToMeal(mealDetails);
            mealList.add(meal);
        }
        return mealList;
    }

    @Override
    public List<Meal> findMealsByMealType(String mealType) {
        List <Meal> meals = new ArrayList<>();
        String sql = "SELECT * FROM meals WHERE type_of_meal = ?;";
        SqlRowSet mealResults = jdbcTemplate.queryForRowSet(sql, mealType);
        while (mealResults.next()){
            Meal meal =mapRowToMeal(mealResults);
            meals.add(meal);
        }
        return meals;
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


    private Meal mapRowToMeal(SqlRowSet mealSet) {
        Meal meal = new Meal();
        meal.setMealId(mealSet.getLong("meal_id"));
        meal.setRecipeId(mealSet.getLong("recipe_id"));
        meal.setMealType(mealSet.getString("type_of_meal"));
        meal.setMealDate(mealSet.getDate("meal_date"));

        return meal;
    }

}
