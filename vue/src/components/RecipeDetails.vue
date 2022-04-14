<template>
  <div class="recipe-details">
    <h2 class="recipe-name"> {{ recipe.name }}</h2>
    <img v-if="recipe.image" v-bind:src="recipe.image"/>
    <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
    <p class="recipe-ingredients">Ingredients: {{ recipe.ingredients }}</p>
    <hr>
    <p class="recipe-directions">Directions: {{ recipe.directions }}</p>
    <!-- <p></p>
    <p></p>
    <p></p>
    <p></p> -->
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

</style>