<template>
<div>
  <div class="card" v-bind:key="recipe.recipeId">
  <h2 class="recipe-name"> {{ recipe.name }}</h2>
  <router-link v-bind:to="{name: 'recipe', params: {id : recipe.recipeId}}">
        <img v-if="recipe.image" v-bind:src="recipe.image"/>
  </router-link>
  <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
  <div class="button-container">
      <button class="mark-saved" v-on:click.prevent="setSaved()" v-if="!recipe.saved">Save Recipe</button>
      <button class="mark-unsaved" v-on:click.prevent="unSave()" v-if="recipe.saved">Forget Recipe</button>
  </div>
  </div>
  </div>
</template>

<script>
import RecipeService from '@/services/RecipeService.js';
export default {
    name: 'recipe-card',
    props: {
        recipe: Object
    },
    data(){
        return {
            isSaved: false
        }
    },
    methods: {
        setSaved() {
            this.isSaved = !this.isSaved;
            RecipeService.saveRecipe(this.recipe.recipeId, this.$store.state.user.id).then((response) => {
                if (response.status === 201) {
                    console.log("weeeee");
                }
            });
        },
        unSave() {
            this.isSaved = !this.isSaved;
            RecipeService.forgetRecipe(this.recipe.recipeId, this.$store.state.user.id).then(response => {
                if(response.status === 201){
                    console.log('WEEE');
                }
            })
        }
    }
};
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
.button-container{
     align-content: center;
     align-items: center;
     justify-content: center;

}
img {
   
    max-width: 100%;
    max-height: 50%;

}
</style>