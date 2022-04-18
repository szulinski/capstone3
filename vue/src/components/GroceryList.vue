<template>
<div>
</div>
</template>

<script>
import RecipeService from '@/services/RecipeService'

export default {
    name: 'groceries-list',
    data() {
        return {
            groceries: [],
            planName: 'aljgbakuhgahlahal=',
        }
    },
    methods: {
        parseGroceries() {
            RecipeService.getIngredients(this.planName).then((response) => {
                return this.groceries = response.data.split(',');
            })
            }
        }
}
</script>

<style>

</style>