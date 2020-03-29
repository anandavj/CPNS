<template>
  <v-app>
    <v-app-bar app dark class="absolute d-lg-none" v-if="this.$route.meta.drawer">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>
        <v-toolbar-title disabled>{{titleBar}}</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn icon @click="searchBarangSideBar"><v-icon>mdi-magnify</v-icon></v-btn>
    </v-app-bar>
    <v-navigation-drawer app dark v-model="drawer" v-if="this.$route.meta.drawer">
      <template>
        <v-list-item two-line link>
          <v-list-item-avatar size="60">
            <img src="https://image.flaticon.com/icons/svg/194/194938.svg" alt="">
          </v-list-item-avatar>
          <v-list-item-content @click="goTo('Profil')">
            <v-list-item-title>{{ this.$store.state.karyawan.name }}</v-list-item-title>
            <v-list-item-subtitle>{{ this.$store.state.karyawan.userTaskGroup }}</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>
      <v-divider/>
      <v-text-field
          placeholder="Cari Barang"
          :solo='true'
          :clearable='true'
          append-icon="mdi-magnify"
          class="font-regular font-weight-light mt-3 mb-n4 px-2"
          v-model="searchBarang"
          id="focusGain"
      />
      <v-divider></v-divider>
      <v-list dense v-for="(menu,index) in menus" :key="index" class="mb-n4">
        <v-list-group :prepend-icon="menu.icon" no-action v-if="menu.children">
          <template v-slot:activator><v-list-item-content><v-list-item-title>{{menu.name}}</v-list-item-title></v-list-item-content></template>
          <v-list-item v-for="(child,idx) in menu.children" :key="idx" link class="caption" @click="goTo(child.route,child.name)">
            <v-list-item-title>{{child.name}}</v-list-item-title>
            <v-list-item-icon><v-icon>{{child.icon}}</v-icon></v-list-item-icon>
          </v-list-item>
        </v-list-group>
        <v-list-item link v-else  @click="goTo(menu.route,menu.name)">
          <v-list-item-icon><v-icon>{{menu.icon}}</v-icon></v-list-item-icon>
          <v-list-item-title>{{menu.name}}</v-list-item-title>
        </v-list-item>
      </v-list>
      <v-list dense>
        <v-list-item link @click="logOutDialog = !logOutDialog">
          <v-list-item-icon><v-icon class="red--text">mdi-power</v-icon></v-list-item-icon>
          <v-list-item-title class="red--text">Keluar</v-list-item-title>
        </v-list-item>
      </v-list>
      <v-dialog v-model="logOutDialog" max-width="600">
        <v-card>
          <v-card-title>Confirmation</v-card-title>
            <v-card-text>Apakah Anda Yakin Ingin Keluar?</v-card-text>
            <v-card-actions>
                <v-container>
                    <v-row justify="center">
                        <v-btn class="mt-n5" color="red darken-1" text @click="logOutDialog = false">Tidak</v-btn>
                        <v-btn class="mt-n5" color="blue darken-1" text @click="logOut">Ya</v-btn>
                    </v-row>
                </v-container>
            </v-card-actions>
        </v-card>
      </v-dialog>
    </v-navigation-drawer>
    <div v-if="this.$route.meta.drawer" style="background-color: #F5F5F5">
      <v-content style="background-color: #F5F5F5" app class="mx-4 my-4 mx-md-10 my-md-n5">
        <router-view style="background-color: #F5F5F5"></router-view>
      </v-content>
    </div>
    <router-view v-else style="background-color: #F5F5F5"></router-view>
  </v-app>
</template>

<script>
import firebase from 'firebase'
// import _ from 'lodash'

export default {
  name: 'App',

  mounted() {
    
  },

  components: {
  },

  data() {
    return {
      menus: [
        {name:'Dashboard',route:'/',icon:'mdi-home-variant-outline'},
        {name:'List Karyawan',route:'/karyawan',icon:'mdi-account-group'},
        {name:'Daftar Barang',route:'/daftarBarang',icon:'mdi-cube-outline'},
        {name:'Surat Jalan',route:'/suratJalan',icon:'mdi-ballot-recount-outline'},
        {name:'Stock Opname',route:'/stockOpname',icon:'mdi-clipboard-check-outline'},
        {name:'Kelola',route:'/kelola',icon:'mdi-settings-outline',children:[
          {name:'Kelola Karyawan',route:'/kelolaKaryawan',icon:'mdi-account-key-outline'},
          {name:'Kelola Barang',route:'/kelolaBarang',icon:'mdi-briefcase-check-outline'}
        ]}
      ],
      drawer: null,
      titleBar: 'Dashboard',
      logOutDialog: false,
      searchBarang:''
    }
  },

  methods: {
    searchBarangSideBar() {
      this.drawer = true
      document.getElementById('focusGain').focus()
    },
    goTo(route, title = route) {
      this.$router.push(route)
      this.titleBar = title
    },
    logOut() {
      this.logOutDialog = false
      firebase.auth().signOut()
        .then( () => {
          this.$router.push('/login')
          this.titleBar = 'Dashboard'
        })
        .catch( (err) => {
          alert(err)
        })
    }
  }
};
</script>