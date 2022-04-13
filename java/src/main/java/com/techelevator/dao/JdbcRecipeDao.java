package com.techelevator.dao;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRecipeDao implements RecipeDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcRecipeDao(JdbcTemplate jdbcTemplate){this.jdbcTemplate = jdbcTemplate;}

    @Override
    public List<Recipe> findAll() {
        List<Recipe> listOfRecipes = new ArrayList<>();
        String sql = "SELECT * FROM recipes";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()){
            Recipe recipe = mapRowToRecipe(results);
            listOfRecipes.add(recipe);
        }
        return listOfRecipes;
    }

    @Override
    public Recipe findRecipeById(Long recipeId) {
        Recipe recipe = null;
        String sql = "SELECT * FROM recipes WHERE recipe_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,recipeId);
        if(results.next()){
            return mapRowToRecipe(results);
        }else {
            //Throw a user not found exception.
            return null;
        }
    }

    @Override
    public List<Recipe> findRecipeByName(String name) {
        List<Recipe> listOfRecipes = new ArrayList<>();
        String namee ="%" + name+ "%";
        String sql = "SELECT * FROM recipes WHERE recipe_name ILIKE ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,namee);
        while(results.next()){
            Recipe recipe = mapRowToRecipe(results);
            listOfRecipes.add(recipe);
        }
        return listOfRecipes;
    }

    @Override
    public List<Recipe> findRecipesByCalorieCount(int calories) {
        List<Recipe> listOfRecipes = new ArrayList<>();
        String sql = "SELECT * FROM recipes WHERE calories < ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,calories);
        while(results.next()){
            Recipe recipe = mapRowToRecipe(results);
            listOfRecipes.add(recipe);
        }
        return listOfRecipes;
    }

    @Override
    public List<Recipe> findRecipesByType(String type) {
        List<Recipe> listOfRecipes = new ArrayList<>();
        SqlRowSet results;
        String dinnersql = "SELECT * FROM recipes WHERE is_dinner";
        String lunchsql = "SELECT * FROM recipes WHERE is_lunch";
        String breakfastsql = "SELECT * FROM recipes WHERE is_breakfast";
        if(type.equals("dinner")){
            results = jdbcTemplate.queryForRowSet(dinnersql);
        }else if(type.equals("lunch")){
            results = jdbcTemplate.queryForRowSet(lunchsql);
        }else{
            results = jdbcTemplate.queryForRowSet(breakfastsql);
        }
        while(results.next()){
            Recipe recipe = mapRowToRecipe(results);
            listOfRecipes.add(recipe);
        }
        return listOfRecipes;
    }

    public List <Recipe> displayRecipesInMeal(Long mealId) {
        List <Recipe> recipesInMeal = new ArrayList<>();
        String sql = "SELECT * FROM recipes r\n" +
                "JOIN meal_recipe mr ON r.recipe_id = mr.recipe_id\n" +
                "JOIN meals m ON m.meal_id = mr.meal_id \n" +
                "WHERE m.meal_id = ?;";
        SqlRowSet recipesResult = jdbcTemplate.queryForRowSet(sql, mealId);
        while(recipesResult.next()) {
            Recipe recipes = mapRowToRecipe(recipesResult);
            recipesInMeal.add(recipes);
        }
        return recipesInMeal;
    }

    private Recipe mapRowToRecipe(SqlRowSet rowSet){
        Recipe recipe = new Recipe();
        recipe.setRecipeId(rowSet.getLong("recipe_id"));
        recipe.setName(rowSet.getString("recipe_name"));
        recipe.setIngredients(rowSet.getString("ingredients"));
        recipe.setDirections(rowSet.getString("directions"));
        recipe.setCalories(rowSet.getInt("calories"));
        recipe.setLowFat(rowSet.getBoolean("is_low_fat"));
        recipe.setHighProtein(rowSet.getBoolean("is_high_protein"));
        recipe.setLowCarb(rowSet.getBoolean("is_low_carb"));
        recipe.setLowSodium(rowSet.getBoolean("is_low_sodium"));
        recipe.setBreakfast(rowSet.getBoolean("is_breakfast"));
        recipe.setLunch(rowSet.getBoolean("is_lunch"));
        recipe.setDinner(rowSet.getBoolean("is_dinner"));
        recipe.setImage(rowSet.getString("img"));
        return recipe;
    }
}
