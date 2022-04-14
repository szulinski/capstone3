<template>
<div>
  <div class="card" v-bind:key="recipe.id">
  <h2 class="recipe-name"> {{ recipe.name }}</h2>
  <router-link v-bind:to="{name: 'recipe', params: {id : recipe.id}}">
      <img v-bind:src="`imageURL`" />
  </router-link>
  <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
  <div class="button-container">
      <button class="mark-saved" v-on:click.prevent="setSaved(true)" v-if="!recipe.saved">Save Recipe</button>
      <button class="mark-unsaved" v-on:click.prevent="setSaved(false)" v-if="recipe.saved">Forget Recipe</button>
  </div>
  <button v-on:click.prevent="addToSaved(recipe)">Add to Favorites</button>
  </div>
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
    },
    computed() {
        let imageURL = this.$route.recipe.URL;
        return imageURL;
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

img {
    size: 50px;
}
</style>