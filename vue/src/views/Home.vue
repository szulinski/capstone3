<template>
  <div class="home">
    <h1>Meal Planner v1.0</h1>
    <p>Description text.</p>
    <div class="router-links">
      <router-link v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My Recipes</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''">My Plans</router-link>
    </div>
  </div>
</template>
  
<script>
export default {
  name: "home",
};
</script>
