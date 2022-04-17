<template>
  <div class="my-recipe-list">
    <h2>Recipes</h2>
    <div>
      <recipe-card-for-meal v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.recipeId"/>
    </div>
    
  </div>
</template>

<script>
import RecipeCardForMeal from "./RecipeCardForMeal.vue";
import recipeService from "@/services/RecipeService";

export default {
  name: "my-recipe-list-for-meal",
  props: ["searchValue"],
  components: {
    RecipeCardForMeal,
  },
  data() {
    return {
      recipes: [],

    };
  },
  methods: {
    filteredRecipes() {
      if (this.searchValue) {
        recipeService.getRecipesByName(this.searchValue).then(response => {
            this.recipes = response.data;
        });
      }
    }
  },
  created() {
    if (this.searchValue) {
        recipeService.getRecipesByName(this.searchValue).then(response => {
            this.recipes = response.data;
        });
    }else{
        recipeService.getRecipes().then((response) => {
            this.recipes = response.data;
        });
    }
  },
};
</script>

<style >
.my-recipe-list {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>
