<template>
  <div class="my-plans">
    <h1>My Plans</h1>
    <plan-list/>  
    <div class="button-container">
      <form>
      <button v-on:click='toggle = !toggle'>Add a Plan</button>
      <input v-show="toggle" type="text" placeholder="Add plan name" />
      <button v-show="toggle" type="submit" v-on:click.prevent="createPlan()">Submit</button>
      </form>
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
      searchValue: '',
      toggle: true
    }
  },
  methods: {
    createPlan(){
      planService.createPlanForUser(this.$store.state.user.id, name)
    }  
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