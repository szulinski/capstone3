<template>
  <div class="home">
    <div class="container">
    <img class="carrot" :src="require(`@/images/emptycarrot.png`)" />    
    <h1 class="homeTitle">MealThyme</h1>
    </div>
    <div class="router-links">
      <router-link class="myrecipes" v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My Recipes<br><br><img :src="require(`@/images/book.png`)" /></router-link>
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
    grid-area: routerlinks;
    
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
    height: auto;
    width: 100%;
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
    height: auto;
    width: 100%;
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
    height: auto;
    width: 100%;
    border: 2px solid #5b4b49;
  }
  .homeTitle{
    text-justify: center;
    text-align: center;
    font-size: 7rem;
    -webkit-text-stroke: 2px #5b4b49;
    -webkit-text-fill-color: #db93b0;
  }

  .carrot {
    justify-self: center;
    align-self: center;
  }

   .home{
    
    background-color:#7daf9c;
    font-family: 'Arial';
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 
    20%
    40%
    40%;
    grid-template-areas:
      "container container ." 
      "routerlinks routerlinks routerlinks"
      "routerlinks routerlinks routerlinks"
  }

  .container {
    grid-area: container;
    display: flex;
    align-content: space-evenly;
    justify-content: space-between;
  }

</style>
