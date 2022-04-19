<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''">Home | </router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout | </router-link>
      <router-link v-bind:to="{ name: 'all-recipes'}" v-if="$store.state.token != ''">Recipes</router-link>     
    </div>
    <router-view />
  </div>
</template>

<style>
</style>
