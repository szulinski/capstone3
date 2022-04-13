package com.techelevator.dao;

import com.techelevator.model.Recipe;

import java.util.List;

public interface RecipeDao {

    List<Recipe> findAll();

    Recipe findRecipeById(Long recipeId);

    List<Recipe> findRecipeByName(String name);

    List<Recipe> findRecipesByCalorieCount(int calories);

    List<Recipe> findRecipesByType(String type);
}
