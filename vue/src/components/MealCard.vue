<template>
  <div class="meal-card" v-bind:key="meal.id">
      <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}">
        <h2 class="meal-day">{{meal.mealDay}}'s</h2>
      </router-link>
      <h2 class="meal-type">{{meal.mealType}}</h2>
      <div v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id">
        <h3>{{recipe.name}}</h3>
        <button v-on:click="showRecipe = !showRecipe">Recipe</button>
        <p v-show="showRecipe">{{recipe.directions}}</p>
        </div>
        <router-link v-bind:to="{name: '', params: {id : meal.mealId}}"><button v-on:click = 'toggle =!toggle'>Remove</button></router-link>
        <form v-on:submit.prevent="addRecipe">
       <router-link v-bind:to="{name: 'recipe-list-for-meals', params: {id : meal.mealId}}"><button v-on:click='toggle = !toggle'>Add A Recipe</button></router-link>
      <input v-show="toggle" v-model="planName" type="text" placeholder="Add plan name" />
      <button v-show="toggle" type="submit">Submit</button>
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
            showRecipe: false
        }
    },
    created() {
        const id = this.meal.mealId
        MealService.getRecipesFromMeal(id).then(response => {
            this.$store.commit('ADD_RECIPES', response.data)
            this.recipes = response.data;
        })
    }
    
}
</script>

<style scoped>
.meal-card {
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 850px;
    margin: 20px;
    
}
</style>