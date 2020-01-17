import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Try from '../views/Try.vue'
import Catalogue from '../views/Catalogue'

import Home from '@/views/Home'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    component: Login,
    meta:{
      drawer: true
    }
  },
  {
    path: '/try',
    component: Try
  },
  {
    path: '/',
    component: Home,
    meta:{
      drawer: true
    }
  },
  {
    path: '/katalog',
    component: Catalogue,
  },

]

export default new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})


