<template>
<div>
    <h1>Groceries List</h1>
    <plan-name-list v-on:click="updatePlanName"/>
    <ul>
        <li v-for="grocery in groceries" v-bind:key="grocery">{{grocery}}</li>
    </ul>
</div>
</template>

<script>
import RecipeService from '@/services/RecipeService'
import PlanNameList from './PlanNameList.vue';

export default {
  components: { PlanNameList },
    name: 'groceries-list',
    data() {
        return {
            version: 0,
            groceries: [],
            planName: 'test=',
        }
    },
    methods: {
        updatePlanName(){
            this.planName = this.$store.state.currentPlanName;
            this.version++;
        }
    },
    created() {
        RecipeService.getIngredients(this.planName).then((response) => {
            return this.groceries = response.data.split(',');
        });
    }
}

</script>

<style>

</style>