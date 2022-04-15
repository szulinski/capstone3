<template>
  <div class="my-plans">
    <h1>My Plans</h1>
    <plan-list/>  
    <div class="button-container">
      <button v-on:click.prevent="setSaved(false)">Add a Plan</button>
  </div>
  </div>
</template>

<script>
import PlanList from '../components/PlanList.vue';
import planService from '../services/PlanService.js';
export default {
  components: { PlanList },
  name: "my-plans",
  data() {
    return {
      searchValue: ''
    }
  },
  created() {
      planService.createPlanForUser(this.$store.state.user.id, name)
  }  
};
</script>

<style>
.my-plans {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>