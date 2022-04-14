<template>
  <div class="card" v-bind:key="meal.id">
      <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}">
        <h2 class="meal-name">{{meal.mealDay}}</h2>
      </router-link>
      <h2 class="meal-type">{{meal.mealType}}</h2>
      <h3></h3>
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