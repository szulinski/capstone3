<template>
  <div class="meal-card" v-bind:key="meal.id">
      <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}">
        <h2 class="meal-day">{{meal.mealDay}}'s</h2>
      </router-link>
      <h2 class="meal-type">{{meal.mealType}}</h2>
      <div v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id">
        {{recipe.name}}</div>
  </div>
</template>

<script>
 import MealService from '@/services/MealService'
export default {
    name: 'meal-card',
    props: {
    
        meal: Object
    },
    data(){
        return {
            recipes:[]
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
    height: 550px;
    margin: 20px;
    
}
</style>