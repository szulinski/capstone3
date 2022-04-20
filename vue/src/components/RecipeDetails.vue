<template>
  <div class="recipe-details">
    <h2 class="recipe-name"> {{ recipe.name }}</h2>
    <img id="detail-img" v-if="recipe.image" v-bind:src="recipe.image"/>
    <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
    <p class="recipe-ingredients">Ingredients: {{ recipe.ingredients }}</p>
    <hr>
    <p class="recipe-directions">Directions: {{ recipe.directions }}</p>
    <router-link :to="{name: 'recipe-update',params: {recipe : recipe}}">Edit</router-link>
  </div>
</template>

<script>

import RecipeService from '@/services/RecipeService';
export default {
    name: "recipe-details",
    props: {
        recipeId : Number
    },
    data() {
      return {
        recipe: {
        id: 0,
        image: '',
        name: '',
        ingredients: '',
        directions: '',
        calories: 0,
        is_low_fat: false,
        is_high_protein: false,
        is_low_carb: false,
        is_low_sodium: false,
        is_breakfast: false,
        is_lunch: false,
        is_dinner: false,
        saved: false,
        }
      }
    },
    created() {
      RecipeService.getRecipe(this.$route.params.id).then(response => {
        this.recipe = response.data;
      });
    }

}
</script>

<style>
.recipe-details{
  max-width: 80%;
  margin-left: 5%;
  font-family: 'Arial';
}
#detail-img{
  min-width: 50%;
  max-width: 75%;
  
}
</style>