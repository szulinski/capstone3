<template>
  <div class="meal-card" v-bind:key="meal.id">
      <!-- <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}"> -->
       <h1 class="meal-day">{{meal.mealDay}}</h1>
      <!-- </router-link> -->
      <h2 class="meal-type">{{meal.mealType}}</h2>
      <div v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.recipeId">
        <h3>{{recipe.name}}
        <button id="remove" v-on:click.prevent="remove(meal.mealId, recipe.recipeId)"><font-awesome-icon icon="fa-solid fa-xmark" /></button>
        </h3>
        </div>
        <form v-on:submit.prevent="addRecipe">
       <router-link v-bind:to="{name: 'recipe-list-for-meals', params: {id : meal.mealId}}">
           <button v-on:click='toggle = !toggle'>Add A Recipe</button></router-link>
      </form>
  </div>
</template>

<script>
import MealService from '@/services/MealService';
export default {
    name: 'meal-card',
    components: {
    },
    props: {
        meal: Object
    },
    data(){
        return {
            recipes:[],
        }
    },
    created() {
        const id = this.meal.mealId
        MealService.getRecipesFromMeal(id).then(response => {
            this.$store.commit('ADD_RECIPES', response.data)
            this.recipes = response.data;
        })
    },
      methods:{
        remove(mealId, recipeId){
            MealService.removeRecipeFromMeal(mealId, recipeId).then(resp =>{
                if (resp.status === 200 || resp.status === 204){
                    this.$router.push({name: 'plan'});
                }
            })
        }
    },
    
}
</script>

<style scoped>
.meal-card {
    display: flex;
    flex-direction: column;
    flex-basis: content;
    flex-grow: auto;
    justify-content: flex-start;
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 300px;
    margin: 10px;
    margin-block: 15px;
    font-size: 14px;
}
#add-recipe{
}
#remove {
  background-color: #7daf9c;
  color: #23967f;
  border-color: #7daf9c;
  display: inline-block;
  font-size: 20px; 
}
</style>