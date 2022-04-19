<template>
  <div class="home">
    <img :src="require(`@/images/emptycarrot.png`)" />
    <h1 class="homeTitle">MealThyme</h1>
    <p>Description text.</p>
    <div class="router-links">
      <router-link class="myrecipes" v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My Recipes</router-link>
      <router-link class="myplans" v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''">My Plans</router-link>
      <router-link class="groceries" v-bind:to="{name: 'groceries-list'}" v-if="$store.state.token != ''">Grocery Lists</router-link>
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
    text-align: center;
    
  }

  .myrecipes{
    text-decoration: none;
    font-size: 34px;
    -webkit-text-stroke: 1px #5b4b49;
    -webkit-text-fill-color: #f7bfb4;
    padding: 5%;
    margin: 5%;
    background-color:#23967f;
    border-radius: 100px;
    height: 200px;
    width: 400px;
    border: 2px solid #5b4b49;
  }
  .myplans{
    text-decoration: none;
     font-size: 34px;
    -webkit-text-stroke: 1px #5b4b49;
    -webkit-text-fill-color: #f7bfb4;
    padding: 5%;
    margin: 5%;
    background-color:#23967f;
    border-radius: 100px;
    height: 200px;
    width: 100px;
    border: 2px solid #5b4b49;
  }
  .groceries {
    text-decoration: none;
     font-size: 34px;
    -webkit-text-stroke: 1px #5b4b49;
    -webkit-text-fill-color: #f7bfb4;
    padding: 5%;
    margin: 5%;
    background-color:#23967f;
    border-radius: 100px;
    height: 200px;
    width: 150px;
    border: 2px solid #5b4b49;
  }
  .home{
    
    background-color:#7daf9c;
    font-family: 'Arial';
    
  }
  .homeTitle{
    font-size: 60px;
    -webkit-text-stroke: 2px #5b4b49;
    -webkit-text-fill-color: #db93b0;
  }
</style>
