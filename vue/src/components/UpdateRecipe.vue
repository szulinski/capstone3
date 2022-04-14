<template>
  <form>
      <div class="nameField">
          <label for="name">Name: </label>
          <input type="text" v-model="updatedRecipe.name"/>
      </div>
  </form>
</template>

<script>

export default {
    name: 'update-recipe',
    props: ['recipe'],
    data() {
        return {
            updatedRecipe: {
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
    }

}
</script>

<style>

</style>