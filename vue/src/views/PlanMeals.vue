<template>
  <div class="my-plans">
    <h1>Plan Meals</h1>
    <plan-details/>  
  </div>
</template>

<script>
import PlanDetails from '../components/PlanDetails.vue';
export default {
  components: { PlanDetails },
  name: "my-plans",
  data() {
    return {
      searchValue: ''
    }
  },
  
};
</script>

<style>
.my-plans {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>