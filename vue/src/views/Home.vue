<template>
  <div class="home">
    <h1>Meal Planner v1.0</h1>
    <p>Description text.</p>
    <div class="router-links">
      <router-link class="myrecipes" v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My Recipes</router-link>
      <router-link class="myplans" v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''">My Plans</router-link>
    </div>
  </div>
</template>
  
<script>
export default {
  name: "home",
};
</script>
<style>
  .router-links {
    display: flex;
  }

  .myrecipes{
    padding: 5%;
    margin: 5%;
    background-color:#23967f;
    border-radius: 100px;
    height: 200px;
    width: 400px;
  }

  .myplans{
    padding: 5%;
    margin: 5%;
    background-color:#23967f;
    border-radius: 100px;
    height: 200px;
    width: 100px;
  }

  .home{
    background-color:#7daf9c;
  }

</style>
