<template>
  <v-app id="inspire">
    <v-navigation-drawer show-md-and-up color="primary" dark
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
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title>Buana Paksa Indonesia</v-toolbar-title>
    </v-app-bar>
  </div>
   

   
    <v-footer app>
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