<template>
  <form>
      <div class="nameField">
          <div>
            <label for="name">Name: </label>
            <input type="text" v-model="recipe.name"/>
          </div>
          <div>
            <label for="calories">Calories: </label>
            <input type="number" v-model="recipe.calories"/>
          </div>
          <div>
            <label for="description">Description: </label>
            <input type="text" v-model="recipe.description"/>
          </div>
          <div>
              <label for="ingredients">Ingredients: </label>
              <input type="text" v-model="recipe.ingredients"/>
          </div>
          <div>
              <router-link :to="{name: 'my-recipes'}"><button type="submit" v-on:click="sendUpdatedRecipe()">Submit</button></router-link>
          </div>
      </div>
  </form>
</template>

<script>

import RecipeService from '@/services/RecipeService';

export default {
    name: 'update-recipe',
    data() {
        return {
            recipe: {
                id: 0,
                image: '',
                name: '',
                ingredients: '',
                directions: '',
                calories: 0,
                is_low_fat: false,
                is_high_protein: false,
                is_low_carb: false,
                is_low_sodium: false,
                saved: false,
            }
        }
    },
    methods: {
        sendUpdatedRecipe(){
            const updatedRecipe = {
                image: this.recipe.image,
                name: this.recipe.name,
                ingredients: this.recipe.ingredients,
                directions: this.recipe.directions,
                calories: this.recipe.calories,
                is_low_fat: this.recipe.is_low_fat,
                is_high_protein: this.recipe.is_high_protein,
                is_low_carb: this.recipe.is_low_carb,
                is_low_sodium: this.recipe.is_low_sodium,
                saved: this.recipe.saved,
            }
            RecipeService.sendRecipe(updatedRecipe);
        }
    },
    created() {
        RecipeService.getRecipe(this.$route.params.id).then(response => {
            this.recipe = response.data;
      });
    }

}
</script>

<style>

</style>