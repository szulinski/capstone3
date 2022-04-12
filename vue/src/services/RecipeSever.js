import axios from 'axios';

const recipeApi = new axios.create({
    baseURL: 'http://localhost:8081'
});

export default {

    getRecipes(){
        return recipeApi.get('/recipes');
    },
    getRecipe(id){
        return recipeApi.get(`/recipes/${id}`);
    },


}