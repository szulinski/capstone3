<template>
  <div class="plan-details">
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
    props: {
        plan : Object
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

        MealService.findMealsByPlanId(this.$route.params.id).then(response => {
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