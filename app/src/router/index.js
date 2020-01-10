import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Try from '../views/Try.vue'
import Catalogue from '../views/Catalogue'
import Grid from '@/views/Grid'
import Home from '@/views/Home'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    component: Login
  },
  {
    path: '/try',
    component: Try
  },
  {
    path: '/',
    component: Home
  },
  {
    path: '/katalog',
    component: Catalogue
  },
  {
    path: '/grid',
    component: Grid
  }
]

export default new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})


