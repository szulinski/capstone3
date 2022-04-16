<template>
<div>
<!-- <h2>Search for recipes</h2>
    <form id = "form">
      <label for="recipeName">Search </label>
      <input
        type="text"
        id="searchBar"
        class="form-control"
        placeholder="enter name"
        v-model="searchValue"
      />
      <button v-on:click.prevent="filterBySearch()">Search</button>
    </form> -->
  <recipe-list-for-meal/>
  <form>
      <button>Add Recipes To Meal</button>
  </form>
  </div>

</template>

<script>
import RecipeListForMeal from '@/components/RecipeListForMeal';
export default {
    components: { RecipeListForMeal },
    name: "recipes-for-meal",
    created() {
        
    },

}
</script>

<style>

</style>