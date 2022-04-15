import axios from 'axios';
const mealApi = new axios.create({
    baseURL: 'http://localhost:8080'
});

export default {

    findMealById(mealId){
        return mealApi.get(`/meals/${mealId}`);
    },

    findMealsByMealType(mealType){
        return mealApi.get(`/meals/mealType/${mealType}`);
    },
    findMealsByDay(mealDay){
        return mealApi.get(`/meals/mealDay/${mealDay}`);
    },
    addRecipeToAMeal(mealId, recipeId){
        return mealApi.post(`/meals/${mealId}/addRecipe/${recipeId}`, mealId, recipeId);
    },
    addRecipeToAMealByName(recipeName, mealId){
        return mealApi.post(`/meals/${mealId}/addRecipe/recipeName/${recipeName}`, recipeName, mealId);
    },
    getMeals(userId){
        return mealApi.get(`user/${userId}/meals`);
    },
    getRecipesFromMeal(mealId){
        return mealApi.get(`/meal/${mealId}/recipes`)

    }
    


}