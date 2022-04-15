<template>
  <div class="my-recipe-list">
    <h2>My Recipes</h2>
    <div>
      <recipe-card v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id"/>
    </div>
  </div>
</template>

<script>
import RecipeCard from "./RecipeCard.vue";
import recipeService from "@/services/RecipeService";

export default {
  name: "my-recipe-list",
  props: ["searchValue"],
  components: {
    RecipeCard,
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
            this.$store.commit('ADD_RECIPES',response.data);
            this.recipes = response.data;
        });
    }else{
        recipeService.getRecipes().then((response) => {
            this.$store.commit("ADD_RECIPES", response.data);
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