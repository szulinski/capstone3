<template>
<div>
    <h1>Groceries List</h1>
    <ul class="goceries">
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
        }
    },
    created() {
        RecipeService.getIngredients(this.$route.params.planName).then((response) => {
            return this.groceries = response.data.split(',');
        });
    }
}

</script>

<style>

.groceries {

}

</style>