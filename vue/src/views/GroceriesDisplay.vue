<template>
<div>
<grocery-list v-for:ingredient in planName v-bind: />    
</div>
</template>

<script>
import GroceryList from '../components/GroceryList.vue'
export default {
  components: { GroceryList },

}
</script>

<style>

</style>