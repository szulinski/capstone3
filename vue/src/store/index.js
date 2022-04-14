import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {}
  },
  recipes: [],
  recipe: {
    id: 0,
    image: '',
    name: '',
    ingredients: '',
    directions: '',
    calories: 0,
    is_low_fat: false,
    is_high_protein: false,
    is_low_carb: false,
    is_low_sodium: false,
    is_breakfast: false,
    is_lunch: false,
    is_dinner: false,
    saved: false,
  },
  meals: [],
  meal:{
    mealId: 0,
    mealType: '',
    mealDay: '',
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_SAVED_STATUS(state, payload) {
      payload.recipe.saved = payload.value;
    },
    SAVE_RECIPE(state, recipe) {
      state.recipes.push(recipe);
    },
    ADD_RECIPES(state, recipes) {
      state.recipes = recipes;
    }
  },
  strict: true
});
