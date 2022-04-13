package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.GenericArrayType;
import java.util.List;

@RestController
@PreAuthorize("permitAll()")
@CrossOrigin
public class RecipeController {

    private RecipeDao recipeDao;

    public RecipeController(RecipeDao recipeDao){this.recipeDao = recipeDao;}

    @RequestMapping(path = "/recipes", method = RequestMethod.GET)
    public List<Recipe> getAllRecipes(){
        return recipeDao.findAll();
    }

    @RequestMapping(path = "/recipe/{recipeId}", method = RequestMethod.GET)
    public Recipe getRecipeById(@PathVariable Long recipeId){
        return recipeDao.findRecipeById(recipeId);
    }

    @RequestMapping(path = "/recipes/{recipeName}", method = RequestMethod.GET)
    public List<Recipe> getRecipesByName(@PathVariable String recipeName){
        return recipeDao.findRecipeByName(recipeName);
    }

    @RequestMapping(path = "/recipes/calories/{calories}", method = RequestMethod.GET)
    public List<Recipe> getRecipesByCalorieCount(@PathVariable int calories){
        return recipeDao.findRecipesByCalorieCount(calories);
    }

    @RequestMapping(path = "/recipes/type/{type}", method = RequestMethod.GET)
    public List<Recipe> getRecipesByType(@PathVariable String type){
        return recipeDao.findRecipesByType(type);
    }

    @RequestMapping(path = "/recipes/recipe/{mealId}", method = RequestMethod.GET)
    public List <Recipe> displayRecipesInMeal(@PathVariable Long mealId){
        return recipeDao.displayRecipesInMeal(mealId);}

}
