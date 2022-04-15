<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <h2>Search for recipes</h2>
    <form id = "form">
      <label for="recipeName">Search </label>
      <input
        type="text"
        id="searchBar"
        class="form-control"
        placeholder="enter name"
        v-model="searchValue"
      />
      <button v-on:click.prevent="filterBySearch()">Search</button>
    </form>
    <recipe-list v-bind:searchValue="savedSearchValue" v-bind:key="savedSearchValue"/>
  </div>
</template>
  
<script>
import RecipeList from '../components/RecipeList.vue';
export default {
  components: { RecipeList },
  name: "home",
  data() {
    return {
      searchValue: '',
      savedSearchValue: ''
    }
  },
  methods: {
    filterBySearch(){
      this.savedSearchValue = this.searchValue;
    }
  }
};
</script>
