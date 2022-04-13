<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <h2>Search for recipes</h2>
    <label for="recipeName">Search </label>
    <input
      type="search"
      id="searchBar"
      class="form-control"
      placeholder="enter name"
      v-model="searchValue"
    />
    <recipe-list/>
  </div>
</template>

<script>
import RecipeList from '../components/RecipeList.vue';
export default {
  components: { RecipeList },
  name: "home",
  data() {
    return {
      searchValue: ''
    }
  },
};
</script>
