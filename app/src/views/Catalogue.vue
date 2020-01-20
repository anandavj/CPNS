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
    <v-layout row wrap class="ma-2" hidden-sm-and-down v-show="!showProduct">
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

    <!-- Selected Product -->
     <v-layout row hidden-md-and-down wrap ma-2 v-show="showProduct" class="selected-product">
      <v-flex xs12>
        <v-card>
          <v-layout row wrap>
            <v-flex xs12 md6>
              <v-img
                class="ma-3"
                :aspect-ratio="1/1"
                max-height="400px"
                src="https://cdn.vuetifyjs.com/images/carousel/bird.jpg"
              >
                <v-layout row wrap justify-end>
                  <v-btn text color="white" @click="showProduct = !showProduct">
                    Tutup
                    <v-icon>mdi-close</v-icon>
                  </v-btn>
                </v-layout>
              </v-img>
            </v-flex>
            <v-flex xs12 md6 align-end pa-2>
              <v-card-title primary-title>Nama Barang</v-card-title>
              <v-card-text>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eleifend lacinia arcu quis varius. Pellentesque dapibus sem vitae aliquam tempor. Integer ligula erat, iaculis sit amet leo et, porta consectetur est. Proin accumsan orci mi, ac dignissim ex scelerisque a. Fusce gravida eros eget erat sagittis vehicula. Pellentesque faucibus malesuada dolor, congue pulvinar enim egestas a. Suspendisse ac purus sed erat tincidunt egestas dictum in lectus. Aenean sodales, nibh ut semper maximus, diam eros cursus dolor, ut tristique neque neque non ligula. Mauris eget metus dictum, congue felis in, sollicitudin leo. Nulla finibus nulla eget cursus euismod. Cras neque augue, commodo sed euismod quis, consequat a purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae cursus justo.</v-card-text>
              <div class="ma-2">
                <v-chip v-for="i in 5" :key="i" class="ma-2" color="primary">Ukuran {{ i }}</v-chip>
              </div>
            </v-flex>
          </v-layout>
        </v-card>
      </v-flex>
    </v-layout>

    <v-layout row wrap  v-show="showProductSM" class="selected-product ma-0">
     <v-dialog hidden-sm-and-down v-model="showProductSM" fullscreen transition="dialog-bottom-transition">
        <v-flex xs12>
          <v-card >
            <v-layout row wrap ma-0>
              <v-flex xs12 md6>
                <v-img
                  
                  class="ma-4"
                  :aspect-ratio="1/1"
                  max-height="400px"
                  src="https://cdn.vuetifyjs.com/images/carousel/bird.jpg"
                >
                  <v-layout row wrap justify-end>
                    <v-btn text color="white" @click="showProductSM = !showProductSM">
                      Tutup
                      <v-icon>mdi-close</v-icon>
                    </v-btn>
                  </v-layout>
                </v-img>
              </v-flex>
              <v-flex xs12 md6 align-end pa-2>
                <v-card-title primary-title>Nama Barang</v-card-title>
                <v-card-text>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eleifend lacinia arcu quis varius. Pellentesque dapibus sem vitae aliquam tempor. Integer ligula erat, iaculis sit amet leo et, porta consectetur est. Proin accumsan orci mi, ac dignissim ex scelerisque a. Fusce gravida eros eget erat sagittis vehicula. Pellentesque faucibus malesuada dolor, congue pulvinar enim egestas a. Suspendisse ac purus sed erat tincidunt egestas dictum in lectus. Aenean sodales, nibh ut semper maximus, diam eros cursus dolor, ut tristique neque neque non ligula. Mauris eget metus dictum, congue felis in, sollicitudin leo. Nulla finibus nulla eget cursus euismod. Cras neque augue, commodo sed euismod quis, consequat a purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae cursus justo.</v-card-text>
                <div class="ma-2">
                  <v-chip v-for="i in 5" :key="i" class="ma-2" color="primary">Ukuran {{ i }}</v-chip>
                </div>
              </v-flex>
            </v-layout>
          </v-card>
        </v-flex>
      </v-dialog>
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
      <v-flex xs12 md3 lg-3 v-for="i in 12" :key="i" class="product-card pa-2">
        <!-- @click="showProduct = !showProduct"
          @mouseover="show = !show"
        @mouseleave="show = !show"-->
        

        <v-card class="pa-2" @click="showSelectedProduct()">
          <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"></v-img>
          <v-card-title>Nama Barang</v-card-title>
          <v-card-actions>
            <v-layout row wrap>
              <v-flex xs12 md6>
                <v-btn color="indigo" @click="showSelectedProduct()" text>Lihat Detail</v-btn>
              </v-flex>
              <v-flex xs12 md6>
                <v-btn color="indigo" @click.stop="show = !show" text z-index="100"> 
                  Deskripsi
                  <v-spacer></v-spacer>
                  <v-icon>{{ show ? 'mdi-chevron-up' : 'mdi-chevron-down'}}</v-icon>
                </v-btn>
              </v-flex>
            </v-layout>
          </v-card-actions>
          <v-divider class="mx-4"></v-divider>
          <v-expand-transition>
            <div v-show="show">
              <v-divider></v-divider>

              <v-card-text>I'm a thing. But, like most politicians, he promised more than he could deliver. You won't have time for sleeping, soldier, not with all the bed making you'll be doing. Then we'll go with that data file! Hey, you add a one and two zeros to that or we walk! You're going to do his laundry? I've got to find a way to escape.</v-card-text>
            </div>
          </v-expand-transition>
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

      showProductSM: false,
      showProduct: false,
      show: false
    };
  },
  props: {
    source: String
    // showNav: this.$store.state.UI.showNavbar
  },

  components: {},
  ready: function(){
    window.addEventListener('resize', this.checkSelectedProduct())
  },
  methods: {
    showSelectedProduct(){
      this.showProduct = !this.showProduct
      if(window.innerWidth < 992){
        if (this.showProduct){
          this.showProduct = false;
          this.showProductSM = true;
        }
        // alert(window.innerHeight
        else if(this.showProductSM){
          this.showProductSM = false;
          this.showProduct = true;
        }
      }
        
      }
    },
    checkSelectedProduct(){
        alert("resized");
      if(this.showProductSM){
        if(window.innerWidth > 992) this.showProductSM = !this.showProductSM
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

.selected-product {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  z-index: 1;
  
}

/* .product-card {
  transition: all 0.2s ease-in-out;
} */
/* @media not all and (pointer: coarse) {
  .product-card:hover {
    transform: scale(1.2);
    z-index: 1;
    overflow-y: auto;
  }
} */
</style>