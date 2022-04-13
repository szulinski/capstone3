<template>
  <div class="recipe-details">
    <h2 class="recipe-name"> {{ recipe.name }}</h2>
    <img src="https://www.seriouseats.com/thmb/TYQEkM-okEXCCMwWFk3JvSchNoo=/880x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2011__12__20111215-dt-chicken-vesuvio-primary-e81c59ea0ba74ab38c6722b7802eb0f1.jpg"/>
    <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
    <p class="recipe-ingredients">Ingredients: {{ recipe.ingredients }}</p>
    <p class="recipe-directions">Directions: {{ recipe.directions }}</p>
    <p class="recipe-image"> {{ recipe.image }}</p>

    <!-- <p></p>
    <p></p>
    <p></p>
    <p></p> -->

  </div>
</template>

<script>

export default {
    name: "recipe-details",
    props: {
        recipe : Object
    }

}
</script>

<style>

</style>