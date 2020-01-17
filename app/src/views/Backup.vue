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
    <v-layout row wrap class="ma-0 mb-2 hidden-md-and-up">
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
      <v-flex xs6 md3 lg-3 v-for="i in 12" :key="i" class="product-card">
        
          <v-card  @mouseover="show = !show" @mouseleave="show = !show" :loading="loading" class="pa-2">
            <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"></v-img>

            <v-card-title>Nama Barang</v-card-title>
            <v-card-actions>
              <v-btn color="indigo" text >
                Deskripsi
                <v-spacer></v-spacer>
                <v-icon>{{ show ? 'mdi-chevron-up' : 'mdi-chevron-down'}}</v-icon>
              </v-btn>
            </v-card-actions>
            <v-divider class="mx-4"></v-divider>
            <v-expand-transition>
              <div v-show="show">
                <v-divider></v-divider>

                <v-card-text>I'm a thing. But, like most politicians, he promised more than he could deliver. You won't have time for sleeping, soldier, not with all the bed making you'll be doing. Then we'll go with that data file! Hey, you add a one and two zeros to that or we walk! You're going to do his laundry? I've got to find a way to escape.</v-card-text>
              </div>
            </v-expand-transition>
            <v-card-actions>
              <v-btn color="deep-purple accent-4" text>Lihat Selengkapnya</v-btn>
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
      ],
      
      show: false
    };
    
  },
  props: {
    source: String
    // showNav: this.$store.state.UI.showNavbar
  },

  components: {},
  methods: {
    showDescription() {
      this.show = !this.show;
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

.category-caption {
  font-size: 6pt;
}
.product-card {
  transition: all 0.2s ease-in-out;
}
.product-card:hover {
  transform: scale(1.2);
  z-index: 1;
  overflow-y:auto;
}
</style>