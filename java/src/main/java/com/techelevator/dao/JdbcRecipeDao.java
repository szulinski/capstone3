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
        String sql = "SELECT * FROM recipes WHERE recipe_name ILIKE '%?%'";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,name);
        while(results.next()){
            Recipe recipe = mapRowToRecipe(results);
            listOfRecipes.add(recipe);
        }
        return listOfRecipes;
    }

    private Recipe mapRowToRecipe(SqlRowSet rowSet){
        Recipe recipe = new Recipe();
        recipe.setRecipeId(rowSet.getLong("recipe_id"));
        recipe.setName(rowSet.getString("recipe_name"));
        recipe.setIngredients(rowSet.getString("ingredients"));
        recipe.setDirections(rowSet.getString("directions"));
        recipe.setCalories(rowSet.getInt("calories"));
        recipe.setHighProtein(rowSet.getBoolean("is_high_protein"));
        recipe.setLowCarb(rowSet.getBoolean("is_low_carb"));
        recipe.setLowSodium(rowSet.getBoolean("is_low_sodium"));
        recipe.setLowFat(rowSet.getBoolean("is_low_fat"));
        return recipe;
    }
}
