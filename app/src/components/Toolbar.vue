<template>  
  <div>
    <v-toolbar color="orange darken-3" dark height="80px">
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>Buana Paksa Indonesia</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-heart</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-toolbar>
  </div>
</template>


<script>
export default {
  name: "Toolbar",
  props: {
    source: String
  },

  components: {},
  methods: {}
};
</script>

<style>
/* .v-navigation-drawer_content{
      background-color: skyblue;
  } */
</style>>
