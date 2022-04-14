<template>
  <div class="card" v-bind:key="meal.id">
      <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}">
        <h2 class="meal-name">{{meal.name}}</h2>
      </router-link>
      <h2 class="meal-type">{{meal.type}}</h2>
  </div>
</template>

<script>
export default {
    name: 'meal-card',
    props: {
        meal: Object
    },
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
</style>