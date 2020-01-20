<template>
  <v-app>
    <v-app-bar app dark class="d-flex d-sm-flex d-md-flex d-lg-none" v-if="this.$route.meta.drawer">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>
        <v-toolbar-title disabled>{{titleBar}}</v-toolbar-title>
    </v-app-bar>
    <v-navigation-drawer app dark v-model="drawer" v-if="this.$route.meta.drawer">
      <template>
        <v-list-item two-line link>
          <v-list-item-avatar size="60">
            <img src="https://image.flaticon.com/icons/svg/194/194938.svg" alt="">
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title>Ananda Vijaya</v-list-item-title>
            <v-list-item-subtitle>Manager</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>
      <v-divider/>
      <v-list dense>
          <v-list-item link>
            <v-list-item-icon><v-icon>mdi-home-variant-outline</v-icon></v-list-item-icon>
            <v-list-item-title @click="goTo('/','Dashboard')">Dashboard</v-list-item-title>
          </v-list-item>
          <v-list-group prepend-icon="mdi-account-group" no-action>
            <template v-slot:activator><v-list-item-content><v-list-item-title>Karyawan</v-list-item-title></v-list-item-content></template>
            <v-list-item link class="caption" @click="goTo('Karyawan')">
              <v-list-item-title>Lihat Karyawan</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-account-group</v-icon></v-list-item-icon>
            </v-list-item>
            <v-list-item link class="caption">
              <v-list-item-title>Pengaturan Karyawan</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-account-key-outline</v-icon></v-list-item-icon>
            </v-list-item>
          </v-list-group>
          <v-list-group prepend-icon="mdi-cube-outline" no-action>
            <template v-slot:activator><v-list-item-content><v-list-item-title>Barang</v-list-item-title></v-list-item-content></template>
            <v-list-item link class="caption" @click="goTo('Barang','Kartu Stock Barang')">
              <v-list-item-title>Kartu Stock Barang</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-ballot-recount-outline</v-icon></v-list-item-icon>
            </v-list-item>
            <v-list-item link class="caption" @click="goTo('baranginout','Barang Masuk Keluar')">
              <v-list-item-title>Barang Masuk/Keluar</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-clipboard-flow-outline</v-icon></v-list-item-icon>
            </v-list-item>
          </v-list-group>
          <v-list-group prepend-icon="mdi-currency-usd" no-action>
            <template v-slot:activator><v-list-item-content><v-list-item-title>Pricelist</v-list-item-title></v-list-item-content></template>
            <v-list-item link class="caption" @click="goTo('listpricelist','Pricelist')">
              <v-list-item-title>List Pricelist</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-format-list-text</v-icon></v-list-item-icon>
            </v-list-item>
            <v-list-item link class="caption" @click="goTo('')">
              <v-list-item-title>Atur Pricelist</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-wallet-outline</v-icon></v-list-item-icon>
            </v-list-item>
          </v-list-group>
          <v-list-group prepend-icon="mdi-store" no-action>
            <template v-slot:activator><v-list-item-content><v-list-item-title>Gudang</v-list-item-title></v-list-item-content></template>
            <v-list-item link class="caption" @click="goTo('barangbongkarmuat','Bongkar Muat Barang')">
              <v-list-item-title>Bongkar/Muat</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-truck-outline</v-icon></v-list-item-icon>
            </v-list-item>
            <v-list-item link class="caption" @click="goTo('')">
              <v-list-item-title>Stock Opname</v-list-item-title>
              <v-list-item-icon><v-icon>mdi-clipboard-check-outline</v-icon></v-list-item-icon>
            </v-list-item>
          </v-list-group>
          <v-list-item link @click="logOutDialog = true">
            <v-list-item-icon><v-icon class="red--text">mdi-power</v-icon></v-list-item-icon>
            <v-list-item-title class="red--text">Keluar</v-list-item-title>
          </v-list-item>
          <v-dialog v-model="logOutDialog">
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
      </v-list>
    </v-navigation-drawer>
    <v-content app class="mx-4 my-4 mx-md-10 my-md-n5">
      <router-view></router-view>
    </v-content>
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
      drawer: null,
      // menus: [
      //   {title:'Dashboard', icon:'mdi-home-variant'},
      //   {title:'Karyawan', icon:'mdi-account-group'},
      //   {title:'Barang', icon:'mdi-cube-outline'},
      // ],
      titleBar: 'Dashboard',
      logOutDialog: false
    }
  },

  methods: {
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