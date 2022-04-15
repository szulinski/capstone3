<template>
  <div class="my-plans">
    <h1>My Plans</h1>
    <plan-list/>  
  </div>
</template>

<script>
import PlanList from '../components/PlanList.vue';
export default {
  components: { PlanList },
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