<template>
  <div class="my-recipe-list">
      <h2>My Recipes</h2>
      <div >
          <recipe-card v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id" />
      </div>
  </div>
</template>

<script>
import RecipeCard from './RecipeCard.vue'
import recipeService from '@/services/RecipeService'

export default {
    name: "my-recipe-list",
  components: { 
      RecipeCard,
  },
  data() {
      return {
          recipes:[]
      }
  },
  methods: {
      recipesFilter(name) {
        recipeService.getRecipesByName(name).then(response => {
            this.recipes = response.data;
        });
      }
  },
  created() {
      recipeService.getRecipes().then(response => {
          this.$store.commit('ADD_RECIPES',response.data);
          this.recipes = response.data;  
      })
  }
}
</script>

<style >
.my-recipe-list {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>