<template>
  <div>
    <v-toolbar flat dense relative height="60">
      <v-layout row class="justify-center mt-5">
        <v-flex xs10 md3 class="mt-5">
          <div>
            <v-text-field outlined rounded clearable single-line dense label="search"></v-text-field>
          </div>
        </v-flex>
        <v-btn icon x-large color="primary" class="mt-4">
          <v-icon>mdi-magnify</v-icon>
        </v-btn>
        <!-- <v-flex xs4 md2 class="mt-7">
          <v-select label="pilih kategori"></v-select>
        </v-flex>-->
      </v-layout>
    </v-toolbar>
    <v-layout row wrap justify-center hidden-sm-and-down>
      <v-card color="primary" dark raised width="700px" class="ma-4" height="550px">
        <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" height="550px"></v-img>
      </v-card>
      <v-card color="white" dark flat width="700" class="ma-4" height="550px">
        <v-layout row wrap justify-center>
          <v-card v-for="i in 4" :key="i" color="primary" dark raised width="260px" class="ma-3">
            <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" height="250px"></v-img>
          </v-card>
        </v-layout>
      </v-card>
    </v-layout>
    <v-layout row wrap justify-center>
      <v-card v-for="x in 10" :key="x" raised width="260px" class="ma-4">
        <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" height="250px"></v-img>
        <v-card-title primary-title>Nama Barang</v-card-title>
        <v-layout row wrap>
          <v-card>boi</v-card>
        </v-layout>
      </v-card>
    </v-layout>
  </div>
</template>
<script>
export default {
  name: "Catalogue",
  data() {
    return {
      items: [
        { title: "Home", icon: "dashboard" },
        { title: "About", icon: "question_answer" }
      ]
    };
  },
  props: {
    source: String
    // showNav: this.$store.state.UI.showNavbar
  },

  components: {},
  methods: {
    showNavbar() {
      return this.$store.state.UI.showNavbar;
    }
  }
};
</script>
  
<style scoped>
</style>