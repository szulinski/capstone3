<template>
  <div class="plan-details">
      <div class ="meal-cards">
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
.meal-cards {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  /* grid-auto-flow: column;
  grid-template-columns: auto auto auto auto auto auto auto;
  grid-template-rows: auto auto auto; */
}

.plan-details {
    display: flex;
    flex-direction: column;
}
</style>