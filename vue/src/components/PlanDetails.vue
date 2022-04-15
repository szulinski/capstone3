<template>
  <div class="plan-details">
      <h2>Plan Meals</h2>
      <div>
        <meal-card v-for="meal in meals" v-bind:meal="meal" v-bind:key="meal.id"/>
      </div>
   </div>   
</template>

<script>
import MealCard from './MealCard.vue'
import MealService from '@/services/MealService'
export default {
    name: "plan-details",
    
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

        MealService.getMeals(this.$store.state.user.id).then(response => {
            this.$store.commit('ADD_MEALS', response.data);
            this.meals = response.data;
        })
    },
}
</script>

<style >
.plan-details {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>