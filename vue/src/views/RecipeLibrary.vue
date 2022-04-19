<template>
<div>
<h2>Search for recipes</h2>
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
    </form  >
  
  <form v-on:submit.prevent="addRecipeToThisMeal">
    <recipe-list-for-meal v-bind:searchValue="savedSearchValue" v-bind:key="savedSearchValue"/>
    <button type="submit">Add Recipes To Meal</button>
  </form>
  </div>

</template>

<script>

 import MealService from '@/services/MealService.js'
import RecipeListForMeal from '@/components/RecipeListForMeal';
export default {
    components: { RecipeListForMeal,  },
    name: "recipes-for-meal",
     
    props: [  ],
    data(){
      return {
        searchValue: "",
        savedSearchValue: "",
         
      }
      
    },
    methods: {
      filterBySearch(){
        this.savedSearchValue = this.searchValue;
      },
      
      addRecipeToThisMeal(){
        const mealId = this.$route.params.id;
        const ids = this.$store.state.checkedRecipes.slice();
        ids.forEach( id => {
          MealService.addRecipeToAMeal(mealId, id.id ).then(r => { 
             console.log(r)
           });
          
        });
        this.$store.state.checkedRecipes = []; 
        const planId = this.$route.params.planId;
       this.$router.push({ name: 'plan', params: { id: planId } });
      }
    }

}
</script>

<style>

</style>
