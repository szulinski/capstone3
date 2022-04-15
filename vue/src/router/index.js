import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import RecipeList from '@/components/RecipeList.vue'
import store from '../store/index'
import RecipeDetails from '@/components/RecipeDetails.vue'
import UpdateRecipe from '@/components/UpdateRecipe.vue'
import MealList from '@/components/MealList.vue'
import MyPlans from '../views/MyPlans.vue'
import PlanMeals from '../views/PlanMeals.vue'
import MealCard from '@/components/MealCard.vue'
import MealDetails from '@/components/MealDetails.vue'
import MyRecipes from '@/views/MyRecipes.vue'


Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/myRecipes",
      name: "my-recipes",
      component: MyRecipes,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/recipe/:id",
      name: "recipe",
      component: RecipeDetails,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/recipes/:id",
      name: "savedRecipes",
      component: RecipeList,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/recipe/:id/update",
      name: "recipe-update",
      component: UpdateRecipe,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/meals",
      name: "my-meals",
      component: MealList,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/meal/:id",
        name: "meal",
        component: MealDetails,
        meta: {
          requiresAuth: true
        }
      },
    {
      path: "/meal/:id/recipes",
      name: "meal-details",
      component: MealCard,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/plans",
      name: "my-plans",
      component: MyPlans,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/plan",
      name: "plan",
      component: PlanMeals,
      meta: {
        requiresAuth: true
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
