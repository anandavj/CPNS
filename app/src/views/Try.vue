<template>
  <v-layout column>
    <v-toolbar flat dense relative height="60">
      <v-layout row class="justify-end mt-5">
        <v-flex xs8 md6 class="mt-5">
          <div>
            <v-text-field outlined rounded clearable single-line dense label="search"></v-text-field>
          </div>
        </v-flex>
        <v-flex xs4 md6 justify-start>
          <v-btn icon x-large color="primary" class="mt-4">
            <v-icon>mdi-magnify</v-icon>
          </v-btn>
        </v-flex>
        <!-- <v-flex xs4 md2 class="mt-7">
          <v-select label="pilih kategori"></v-select>
        </v-flex>-->
      </v-layout>
    </v-toolbar>

    <v-layout row wrap justify-center class="ma-2">
      <v-flex xs12>
        <v-carousel cycle show-arrows-on-hover height="250" class="ma-0">
          <v-carousel-item v-for="i in images" :key="i" :src="i"></v-carousel-item>
        </v-carousel>
      </v-flex>
    </v-layout>

    <v-layout row wrap class="ma-2"  hidden-sm-and-down>
      <v-flex xs6>
        <v-card flat class="ma-2 mt-5">
          <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" class="card-image"></v-img>
        </v-card>
      </v-flex>
      <v-flex xs6>
        <v-layout row wrap class>
          <v-flex xs6 v-for="i in 4" :key="i">
            <v-card flat class="ma-2">
              <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" class="card-image"></v-img>
            </v-card>
          </v-flex>
        </v-layout>
      </v-flex>
    </v-layout>

    <v-layout row wrap justify-center class="ma-2">
      <v-layout row wrap justify-center>
        <v-flex xs6 md4 lg-3 v-for="i in 12" :key="i" class="">
          <v-card class="pa-2">
            <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" class="card-image"></v-img>
            <v-card-title>
              Nama Barang
            </v-card-title>
            <v-card-actions>
              <v-btn justify-end color="indigo" dark>Lihat Detail</v-btn>
            </v-card-actions>
          </v-card>
          <!-- <v-card>
            <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" class="card-image"></v-img>
            <v-card-title primary-title>
            Nama Barang
            </v-card-title>
            <v-divider></v-divider>
            vcardt
              <v-chip label color="blue darken--2" text-color="white">
                Nama Barang
              </v-chip> 
          </v-card>-->
        </v-flex>
      </v-layout>
    </v-layout>
  </v-layout>
</template>
<script>
export default {
  name: "Catalogue",
  data() {
    return {
      images: [
        "https://cdn.vuetifyjs.com/images/carousel/squirrel.jpg",
        "https://cdn.vuetifyjs.com/images/carousel/sky.jpg",
        "https://cdn.vuetifyjs.com/images/carousel/bird.jpg",
        "https://cdn.vuetifyjs.com/images/carousel/planet.jpg"
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