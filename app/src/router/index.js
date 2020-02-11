import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Try from '../views/Try.vue'
import Catalogue from '../views/Catalogue'
import Home from '@/views/Home'
import Admin from '@/views/Admin'
import Barang from '@/views/Barang'
import Kategori from '@/views/Kategori'
import Unit from '@/views/Unit'
import Image from '@/views/Image'

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
    meta:{
      drawer: false
    }
  },
  {
    path: '/admin',
    component: Admin,
    meta:{
      drawer: true
    }
  },
  {
    path: '/barang',
    component: Barang,
    meta:{
      drawer: true
    }
  },
  {
    path: '/kategori',
    component: Kategori,
    meta:{
      drawer: true
    }
  },
  {
    path: '/satuan',
    component: Unit,
    meta:{
      drawer: true
    }
  },
  {
    path: '/gambar',
    component: Image,
    meta:{
      drawer: true
    }
  },

]

export default new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})


