<template>
  <v-app id="inspire" v-if="!this.$route.meta.drawer">
    <v-navigation-drawer show-sm-and-up color="primary" dark
      v-model="drawer"
      app
      clipped
    >
      <v-list dense
      v-for="x in 10"
      :key="x">
        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Kategori {{ x }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

      </v-list>
    </v-navigation-drawer>
  <div>

    <v-app-bar
      app
      clipped-left
      color="primary"
      dark
    >
      <!-- <v-col hidden-sm-and-up>  -->
        
      <v-app-bar-nav-icon  class="hidden-sm-and-down" @click.stop="drawer = !drawer" />
      <!-- </v-col> -->
      <v-toolbar-title>Buana Paksa Indonesia</v-toolbar-title>
    </v-app-bar>
  </div>
   

   
    <v-footer app color="primary" dark>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
  export default {
    props: {
      source: String,
    },
    data: () => ({
        drawer: null,
        
    }),
    created () {
      this.$vuetify.theme.dark = false
    },
  }
</script>