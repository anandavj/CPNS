<template>
  <v-app>
    <v-toolbar dark class="d-flex d-sm-flex d-md-flex d-lg-none">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>
        <v-toolbar-title> <!-- class="flex text-center" -->
            Dashboard
        </v-toolbar-title>
    </v-toolbar>
    <v-navigation-drawer app dark v-model="drawer" absolute temporary v-if="this.$route.meta.drawer"/>
    <v-content app>
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
      drawer: null
    }
  }
};
</script>
