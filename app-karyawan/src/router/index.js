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
    path:'/karyawan',
    name:'Karyawan',
    component: () => import('../views/Karyawan.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/barang',
    name:'Barang',
    component: () => import('../views/Barang.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/baranginout',
    name:'BarangInOut',
    component: () => import('../views/BarangMasukKeluar.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/barangbongkarmuat',
    name:'barangBongkarMuat',
    component: () => import('../views/BongkarMuatBarang.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/listpricelist',
    name:'listPriceList',
    component: () => import('../views/ListPriceList.vue'),
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
