<template>
  <v-layout column pa-md-3 pa-xs-0>
    <!-- Search bar -->
    <v-toolbar flat dense relative height="60">
      <v-layout row class="justify-start mt-5">
        <v-flex xs12 md4 class="mt-5">
          <div>
            <v-text-field
              outlined
              rounded
              clearable
              single-line
              dense
              label="search"
              append-icon="mdi-magnify"
            ></v-text-field>
          </div>
        </v-flex>
      </v-layout>
    </v-toolbar>

    <!-- carousel -->
    <v-layout row wrap justify-center class="ma-2">
      <v-flex xs12>
        <v-carousel cycle show-arrows-on-hover height="250" class="ma-0">
          <v-carousel-item v-for="i in images" :key="i" :src="i"></v-carousel-item>
        </v-carousel>
      </v-flex>
    </v-layout>

    <!-- Highlighted products -->
    <v-layout row wrap class="ma-2" hidden-sm-and-down>
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

    <!-- horizontal-scroll-wrapper -->
    <v-layout row wrap class="ma-0 mb-2">
      <v-flex xs2 mt-2>
        <v-btn color="primary" text>
          <v-layout column>
            <v-icon>mdi-view-grid</v-icon>
            <div class="category-caption">
              Semua
              <br />Kategori
            </div>
          </v-layout>
        </v-btn>
      </v-flex>

      <v-flex xs9>
        <div class="scrollmenu ml-2" hidden-sm-and-up>
          <v-btn color="primary" text dark v-for="i in 10" :key="i" class="mt-2 mb-2 ma-1">
            <v-layout column>
              <v-icon>mdi-border-all</v-icon>
              <div class="category-caption">
                Kategori
                {{ i }}
              </div>
            </v-layout>
          </v-btn>
        </div>
      </v-flex>
    </v-layout>
    
    <!-- Product Card Contents -->
    <v-layout row wrap justify-space-around class="ma-3">
      <v-flex xs6 md3 lg-3 v-for="i in 12" :key="i">
        <v-card outlined class="ma-1">
          <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" class="card-image"></v-img>
          <v-card-title>Nama Barang</v-card-title>
          <v-card-actions>
            <v-btn outlined justify-end color="indigo" dark>Lihat Detail</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
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
div.scrollmenu {
  overflow-x: auto;
  overflow-y: hidden;
  white-space: nowrap;
}

/* div.scrollmenu a {
  display: inline-block;
  text-align: center;
  padding: 14px;
  text-decoration: none;
} */

.category-caption {
  font-size: 6pt;
}
</style>