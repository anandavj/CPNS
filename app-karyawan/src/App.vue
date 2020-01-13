<template>
  <v-app>
    <v-app-bar app dark class="d-flex d-sm-flex d-md-flex d-lg-none" v-if="this.$route.meta.drawer">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>
        <v-toolbar-title disabled> <!-- class="flex text-center" -->
            Dashboard
        </v-toolbar-title>
    </v-app-bar>
    <v-navigation-drawer app dark v-model="drawer" v-if="this.$route.meta.drawer">
      <template>
        <v-list-item two-line>
          <v-list-item-avatar size="60">
            <img src="https://image.flaticon.com/icons/svg/194/194938.svg" alt="">
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title>Ananda Vijaya</v-list-item-title>
            <v-list-item-subtitle>Lihat Profil</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>
      <v-divider/>
      <v-list dense>
        <v-list-item-group>
          <v-list-item
            v-for="menu in menus"
            :key='menu.title'
            @click="doNothing"
          >
          <v-list-item-icon><v-icon>{{menu.icon}}</v-icon></v-list-item-icon>
          <v-list-item-title>{{menu.title}}</v-list-item-title>
          </v-list-item>
          <v-list-item @click="doNothing">
            <v-list-item-icon><v-icon class="red--text">mdi-power</v-icon></v-list-item-icon>
            <v-list-item-title class="red--text">Keluar</v-list-item-title>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <v-content app class="mx-4 my-4 mx-md-10 my-md-n5">
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
export default {
  name: 'App',

  mounted() {
    console.log(this.$route.meta)
  },

  components: {
  },

  data() {
    return {
      drawer: null,
      menus: [
        {title:'Dashboard', icon:'mdi-home-variant'},
        {title:'Karyawan', icon:'mdi-account-group'},
        {title:'Barang', icon:'mdi-cube-outline'},

      ]
    }
  },

  methods: {
    doNothing() {

    }
  }
};
</script>