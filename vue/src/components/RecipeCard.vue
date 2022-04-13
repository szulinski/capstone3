<template>
<div>
  <div class="card" v-bind:key="recipe.id" />
  <h2 class="recipe-name"> {{ recipe.name }}</h2>
  <router-link v-bind:to="{name: 'recipe', params: {id : recipe.id}}">
      <img src="https://www.seriouseats.com/thmb/TYQEkM-okEXCCMwWFk3JvSchNoo=/880x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2011__12__20111215-dt-chicken-vesuvio-primary-e81c59ea0ba74ab38c6722b7802eb0f1.jpg"/>
  </router-link>
  <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
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