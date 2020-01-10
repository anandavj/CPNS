<template>
  <v-app>
    <v-layout row wrap>
      <v-flex block xs12>
        <Toolbar />
        <v-flex xs2>
        <Navbar/>
          <!-- <v-btn color="success" block>text</v-btn> -->

        </v-flex>
      </v-flex>
      
      <!-- <v-btn block color="primary" dark>text</v-btn> -->
    </v-layout>
  </v-app>
</template>

<script>
import Navbar from "@/components/Navbar";
import Toolbar from "@/components/Toolbar";
export default {
  name: "Catalogue",
  props: {
    source: String
  },

  components: { Toolbar, Navbar },
  methods: {}
};
</script>
  
<style>
</style>