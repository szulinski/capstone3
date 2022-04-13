import axios from 'axios';
const mealApi = new axios.create({
    baseURL: 'http://localhost:8080'
});

export default {

    findMealById(mealId){
        return mealApi.get(`/meals/${mealId}`);
    },

    findMealsByMealType(mealType){
        return mealApi.get(`/meals/mealType/${mealType}`);
    },

    findMealsByDay(mealDay){
        return mealApi.get(`/meals/mealDay/${mealDay}`);
    }



}