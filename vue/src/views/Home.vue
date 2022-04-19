<template>
  <div class="home">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'all-recipes'}" v-if="$store.state.toke != ''">Recipes</router-link>     
    </div>
    <h1>Meal Planner v1.0</h1>
    <p>Description text.</p>
    <div class="router-links">
      <router-link class="myrecipes" v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My Recipes</router-link>
      <router-link class="myplans" v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''">My Plans</router-link>
      <router-link class="groceries" v-bind:to="{name: 'groceries-list'}" v-if="$store.state.token != ''">Groceries List</router-link>
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
