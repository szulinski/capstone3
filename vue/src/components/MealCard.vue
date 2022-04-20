<template>
  <div class="meal-card" v-bind:key="meal.id">
      <!-- <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}"> -->
       <h1 class="meal-day">{{meal.mealDay}}</h1>
      <!-- </router-link> -->
      <div class= "add-recipe">
      <h2 class="meal-type">{{meal.mealType}}</h2>
      <form v-on:submit.prevent="addRecipe">
      <router-link v-bind:to="{name: 'recipe-list-for-meals', params: {planId: planId,  id : meal.mealId}}">
           <button id="add" ><font-awesome-icon icon="fa-solid fa-plus" />Add</button></router-link>
      </form>
      </div>
      <div v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.recipeId">
        <h3>{{recipe.name}}
        <button id="remove" v-on:click.prevent="remove(meal.mealId, recipe.recipeId)"><font-awesome-icon icon="fa-solid fa-xmark" /></button>
        </h3>
        </div>
  </div>
</template>

<script>
import MealService from '@/services/MealService';
export default {
    name: 'meal-card',
    components: {
    },
    props: {
        meal: Object,
        planId: Number
    },
    data(){
        return {
            isDeleted: false,
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
            this.isDeleted = !this.isDeleted;
            MealService.removeRecipeFromMeal(mealId, recipeId).then(resp =>{
                if (resp.status === 200 || resp.status === 204){
                    this.$emit("deleteMeal",this.isDeleted);
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
    width: 275px;
    height: 275px;
    margin: 10px;
    margin-block: 15px;
    font-size: 14px;
    background-color: #23967f;
}
.add-recipe{
    display:flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: bottom;
}
#add {
    background-color: #7daf9c;
  color: #23967f;
  border-color: #7daf9c;
  font-size: 18px; 
  ;
}
#remove {
  background-color: #7daf9c;
  color: #23967f;
  border-color: #7daf9c;
  font-size: 18px; 
}
</style>