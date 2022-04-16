<template>
  <div class="my-plans">
    <h1>My Plans</h1>
    <plan-list/>  
    <div class="button-container">
      <form v-on:submit.prevent="createPlan">
      <button v-on:click='toggle = !toggle'>Add a Plan</button>
      <input v-show="toggle" v-model="planName" type="text" placeholder="Add plan name" />
      <button v-show="toggle" type="submit"  >Submit</button>
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
      toggle: true,
      planName: '',
      savedName: ''
    }
  },
  methods: {
    createPlan(){
      // const planName = this.plan.planName;
      this.savedName = this.planName
      planService.createPlanForUser(this.$store.state.user.id, this.savedName)
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