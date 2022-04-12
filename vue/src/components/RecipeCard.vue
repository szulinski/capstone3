<template>
<div>
  <div class="card" v-bind:class="{ saved: recipe.saved }" />
  <h2 class="recipe-name"> {{ recipe.name }}</h2>
  <!-- <img v-if= ***Placeholder for images*** /> -->
  <h3 class="recipe-calories"> {{ recipe.calories }}</h3>
  <div class="button-container">
      <button class="mark-saved" v-on:click.prevent="setSaved(true)" v-if="!recipe.saved">Save Recipe</button>
      <button class="mark-unsaved" v-on:click.prevent="setSaved(false)" v-if="recipe.saved">Forget Recipe</button>
  </div>
  <button v-on:click.prevent="addToSaved(recipe)">Add to Favorites</button>
  </div>
</template>

<script>
export default {
    name: 'recipe-card',
    props: {
        recipe: Object
    },
    methods: {
        setSaved(value) {
            this.$store.commit('SET_SAVED_STATUS', {recipe: this.recipe, value: value});
        },
        addToSaved(recipe) {
            let addedRecipe = Object.assign({ saved: true }, recipe);
            this.$store.commit('SAVE_RECIPE', addedRecipe)

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
</style>