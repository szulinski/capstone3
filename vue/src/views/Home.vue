<template>
  <div class="home">
    <div class="container">
    <!-- <img class="carrot" :src="require(`@/images/emptycarrot.png`)" />     -->
    <h1 class="homeTitle">MealThyme<img class="carrot" :src="require(`@/images/emptycarrot.png`)" />    
</h1>
    </div>
    <div class="router-links">
      <router-link class="my-recipes" v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My Recipes<br><br><img class="recipes" :src="require(`@/images/recipes.png`)" /></router-link>
      <router-link class="my-plans" v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''">My Plans<br><br><img class="calendar" :src="require(`@/images/calendar.png`)" /></router-link>
      <router-link class="groceries" v-bind:to="{name: 'groceries-list'}" v-if="$store.state.token != ''">Grocery Lists<br><br><img class="grocery-list" :src="require(`@/images/grocerylist.png`)" /></router-link>
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

  .my-recipes{
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
  .my-recipes:hover{
    box-shadow: 7px 7px 5px #23967f;
}
  .home .my-plans:hover{
    box-shadow: 7px 7px 5px #23967f;
}
  .groceries:hover{
    box-shadow: 7px 7px 5px #23967f;
}
  .my-recipes .recipes{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 220px;
    width: 220px;
  }
  .home .my-plans .calendar{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 200px;
    width: 200px;
  }
  .groceries .grocery-list{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 200px;
    width: 200px;
  }
  .home .my-plans{
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
    margin: auto;
    width: 50%;
    text-justify: center;
    text-align: center;
    font-size: 7rem;
    -webkit-text-stroke: 2px #5b4b49;
    -webkit-text-fill-color: #c30450;
  }

  .carrot {
    justify-self: center;
    align-self: center;
    max-width: 15%;
    max-height: 15%;
  }

   .home{
    /* background-image: url('../images/more-leaves-on-green.png'); */
    /* background-color:#7daf9c; */
    
    font-family: 'Arial';
    /* display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 
    20%
    40%
    40%; */
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
