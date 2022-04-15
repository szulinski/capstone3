<template>
<div>
  <div class="plan-card" v-bind:key="plan.planId">
  <h2 class="plan-name"> {{ plan.planName }}</h2>
  </div>
  </div>
</template>

<script>

export default {
    name: 'plan-card',
    props: {
        plan: Object
    },
    // methods: {
    // }

}
</script>

<style>
.plan-card {
    border: 2px solid black;
    border-radius: 10px;
    width: 500px;
    height: 100px;
    margin: 20px;
    
}
.plan-card .plan-name {
    font-size: 3rem;
}

</style>