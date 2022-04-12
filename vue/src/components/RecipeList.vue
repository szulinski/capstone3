<template>
  <div>
      <h2>My Recipes</h2>
      <div class="my-recipe-list">
          <recipe-card v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id" />
      </div>
  </div>
</template>

<script>
import RecipeCard from './RecipeCard.vue'

export default {
    name: "my-recipe-list",
  components: { 
      RecipeCard 
  },
  computed: {
      recipes() {
          return this.$store.state.recipes.filter((recipe) => {
              return recipe.saved === true;
          });
      }
  },
}
</script>

<style>
.my-recipe-list {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>