<template>
<div>
    <h1>Groceries List</h1>
    <ul>
        <li v-for="grocery in groceries" v-bind:key="grocery">{{grocery}}</li>
    </ul>
</div>
</template>

<script>
import RecipeService from '@/services/RecipeService'

export default {
    name: 'groceries-list',
    data() {
        return {
            groceries: [],
            planName: 'testname',
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