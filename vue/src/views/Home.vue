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
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      searchValue: ''
    }
  }
};
</script>
