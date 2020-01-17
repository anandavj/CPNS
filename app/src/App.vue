<template>
  <v-app>
    <v-layout>
      <Toolbar />

      <v-content>
        <router-view></router-view>
      </v-content>
    </v-layout>

    <!-- </v-layout> -->
  </v-app>
</template>

<script>
import Toolbar from "@/components/Toolbar";
import "@/store/index.js";

export default {
  name: "App",

  components: {
    Toolbar
  },

  data: () => ({
    //
  })
};
</script>

<style>

</style>