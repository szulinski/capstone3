<template>
<div>
  <div class="card" v-bind:key="recipe.recipeId">
  <h2 class="recipe-name"> {{ recipe.name }}</h2>
  <router-link v-bind:to="{name: 'recipe', params: {id : recipe.recipeId}}">
        <img v-if="recipe.image" v-bind:src="recipe.image"/>
  </router-link>
  <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
  <div class="checkbox-container">
    <!-- v-bind:value="isChecked" -->
      <input type="checkbox" id="addRecipe"  v-on:change="saveChecked($event)" >
      <label for="addRecipe">Add Recipe To Meal</label>
  </div>
  </div>
  </div>
</template>

<script>
export default {
    name: 'recipe-card-for-meal',
    props: {
        recipe: Object
    },
    data() {
    return {
      checkedRecipes: [],
    };

  },
  computed: {
      isChecked(){
          return this.$store.state.checkedRecipes.contains(this.recipe.recipeId);
      }
  },
  methods: {
      saveChecked(event){
          if ( event.target.checked){
            this.$store.commit('SET_CHECKED', this.recipe.recipeId)
          }else {
            this.$store.commit('SET_UNCHECKED', this.recipe.recipeId)
          }
      }
  }

}
</script>

<style>
.card {
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 550px;
    margin: 20px;
    
}
.card.saved {
    background-color: crimson;
}
.card .recipe-name {
    font-size: 1.5rem;
}
.card .book-author {
    font-size: 1rem;
}
.checkbox-container{
     align-content: center;
     align-items: center;
     justify-content: center;

}
img {
   
    max-width: 100%;
    max-height: 50%;

}
</style>
