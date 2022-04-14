<template>
  <div class="my-meal-list">
      <h2>My Meals</h2>
      <div>
        <meal-card v-for="meal in meals" v-bind:meal="meal" v-bind:key="meal.id"/>
      </div>
   </div>   
</template>

<script>
import MealCard from './MealCard.vue'
import MealService from '@/services/MealService'
export default {
    name: "my-meals-list",
    
    components: {
        MealCard,
    },
    data() {
        return {
            meals:[]
        }
    },
    computed: {
        mealsFilter(){
            return this.$store.state.meals;
        }
    },
    created() {
        MealService.getMeals().then(response => {
            this.$store.commit('ADD_MEALS', response.data);
            this.meals = response.data;
        })
    },
}
</script>

<style>
.my-meals-list {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>