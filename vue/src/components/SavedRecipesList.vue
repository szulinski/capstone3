<template>
  <div class="my-saved-recipe-list">
    <h2>My Saved Recipes</h2>
    <div>
      <recipe-card v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id"/>
    </div>
  </div>
</template>

<script>
import RecipeCard from "./RecipeCard.vue";
import recipeService from "@/services/RecipeService";

export default {
  name: "my-saved-recipe-list",
  components: {
    RecipeCard,
  },
  data() {
    return {
      recipes: [],
    };
  },
  created() {
    recipeService.getRecipesBySaved(this.$store.state.user.id).then((response) => {
        this.recipes = response.data;
    });
}
};
</script>

<style >
.my-saved-recipe-list {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>