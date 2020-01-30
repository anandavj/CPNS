import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue'),
    meta: {
      drawer:false
    }
  },
  {
    path: '/',
    name: 'Dashboard',
    component: () => import('../views/Dashboard.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path: '/karyawan',
    name: 'Karyawan',
    component: () => import('../views/Karyawan.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path: '/daftarBarang',
    name: 'Barang',
    component: () => import('../views/Barang.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path: '/suratJalan',
    name: 'SuratJalan',
    component: () => import('../views/SuratJalan.vue'),
    meta: {
      drawer: true
    }
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
