<template>
  <div class="my-plans">
    <h1>My Plans</h1>
    <plan-list :key="this.version"/>  
    <div class="button-container">
      <button v-show='toggle' v-on:click='toggle = !toggle'>Add a Plan</button>
      <form v-on:submit.prevent="createPlan">
      <input v-show="!toggle" v-model="planName" type="text" placeholder="Add plan name" />
      <button v-show="!toggle" type="submit"  >Submit</button>
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
      savedName: '',
      version: 0
    }
  },
  methods: {
    createPlan(){
      // const planName = this.plan.planName;
      this.savedName = this.planName
      planService.createPlanForUser(this.$store.state.user.id, this.savedName).then(()=>{
        this.version++
      })
      this.toggle = true;
      this.planName = "";
    }  
  }  
};
</script>

<style>
.my-plans {
  display: grid;
  grid-template-co: 1fr 2fr;
  grid-template-areas: "title button" 
    "plans plans";
    
  background-color:#7daf9c;
    /* display: flex; */
    /* justify-content: space-evenly; */
    /* flex-wrap: wrap; */
}
h1 {
  grid-area: title; 
}
plan-list {
  grid-area: plans ;
}
.button-container{
  grid-area: button;
}
</style>