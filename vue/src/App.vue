<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''"><img class="homeIcon" :src="require(`@/images/home.png`)" />HOME</router-link>
      <router-link v-bind:to="{ name: 'all-recipes'}" v-if="$store.state.token != ''"><img class="recipesIcon" :src="require(`@/images/recipes.png`)" />RECIPES</router-link>
      <router-link v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''"><img class="calendarIcon" :src="require(`@/images/calendar.png`)" />PLANS</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"><img class="logoutIcon" :src="require(`@/images/logout.png`)" />LOGOUT</router-link>


    </div>
    <router-view />
  </div>
</template>

<style>
#link {
    text-decoration: none;
}
#nav {
   font-family: 'Arial';
   top: 0;
   height: 50px;
   width: 100%;
   z-index: 1000;
   display: flex;
   position: sticky;
   justify-content: center;
   background-color: #f7bfb4;
}
#nav a:hover {
  background-color: #5b4b49;
  color: #f7bfb4;
;
}
.homeIcon{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
  }
  .recipesIcon{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
  }
  .calendarIcon{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
  }
  .logoutIcon{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
  }

</style>
