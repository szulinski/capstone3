import axios from 'axios';

const recipeApi = new axios.create({
    baseURL: 'http://localhost:8080'
});

export default {

    getRecipes(){
        return recipeApi.get('/recipes');
    },
    getRecipe(id){
        return recipeApi.get(`/recipe/${id}`);
    },
    sendRecipe(recipe){
        return recipeApi.post(`/recipes`, recipe);
    },
    getRecipesByName(name){
        return recipeApi.get(`/recipes/${name}`);
    }


}