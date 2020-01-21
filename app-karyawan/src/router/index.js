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
    path:'/managementKaryawan',
    name:'ManagementKaryawan',
    component: () => import('../views/ManagementKaryawan.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/addKaryawan',
    name:'addKaryawan',
    component: () => import('../views/addKaryawan.vue'),
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
  },
  {
    path:'/profil',
    name:'profil',
    component: () => import('../views/Profil.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/opname',
    name:'stockOpname',
    component: () => import('../views/StockOpname.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/aturPricelist',
    name:'aturPricelist',
    component: () => import('../views/aturPricelist.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/try',
    name:'try',
    component: () => import('../views/Try.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/kelolabarang',
    name:'highlight',
    component: () => import('../views/Highlight.vue'),
    meta: {
      drawer: true
    }
  },
  {
    path:'/addDivisi',
    name:'addDivisi',
    component: () => import('../views/addDivisi.vue'),
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
