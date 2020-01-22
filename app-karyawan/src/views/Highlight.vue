<template>
  <v-app>
    <div>
      <v-text-field
        v-model="searchPricelist"
        placeholder="Cari Barang"
        :solo="true"
        :clearable="true"
        append-icon="mdi-magnify"
      />
    </div>

    <!-- Highlighted items -->
    <v-expansion-panels focusable>
      <v-expansion-panel>
        <v-expansion-panel-header>Barang yang disorot</v-expansion-panel-header>
        <v-expansion-panel-content>
          <v-layout row wrap v-for="i in 5" :key="i" align-center>
            <v-flex xs4>
              <v-container grid-list-xs>
                <v-avatar class="profile ml-2" color="grey" height="80px" width="80px" tile>
                  <v-img
                    src="http://jayarayabali.com/image/cache/catalog/Metal%20Roofing/COLOR%20PAINT%20FINISHED%20METAL%20ROOF%20RAINBOW%20-%20ROOF-500x500.jpg"
                  ></v-img>
                </v-avatar>
              </v-container>
            </v-flex>
            <v-flex xs8>
              <v-card-text>
                <div class="title" style="font-size:12pt !important; ">Nama barang</div>
                <div class="subtitle-1">Keterangan</div>
              </v-card-text>
            </v-flex>
            <v-btn color="red" class="cancel" x-large icon>
              <v-icon>mdi-close</v-icon>
            </v-btn>
          </v-layout>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>

    <!-- products -->
    <v-card>
      <v-layout row wrap v-for="i in 10" :key="i" align-center pa-2>
        <v-flex xs4>
          <v-container grid-list-xs>
            <v-avatar class="profile ml-2" color="grey" height="80px" width="80px" tile>
              <v-img
                src="http://jayarayabali.com/image/cache/catalog/Metal%20Roofing/COLOR%20PAINT%20FINISHED%20METAL%20ROOF%20RAINBOW%20-%20ROOF-500x500.jpg"
              ></v-img>
            </v-avatar>
          </v-container>
        </v-flex>
        <v-flex xs8>
          <v-card-text>
            <div class="title" style="font-size:12pt !important; ">Nama barang</div>
            <div class="subtitle-1">Keterangan</div>
          </v-card-text>
        </v-flex>
        <v-btn color="success" class="cancel" x-large icon>
          <v-icon>mdi-plus-circle-outline</v-icon>
        </v-btn>
      </v-layout>
    </v-card>
    <v-flex xs12>
      <!-- <v-btn color="primary" text>Barang teratas</v-btn> -->

      <!-- <v-card class="mx-auto" max-width="300" color="" >
          <v-layout row wrap>
            <v-flex xs4>
              <v-container grid-list-xs>
                <v-avatar class="profile ml-2" color="grey" height="80px" width="80px" tile>
                  <v-img
                    src="http://jayarayabali.com/image/cache/catalog/Metal%20Roofing/COLOR%20PAINT%20FINISHED%20METAL%20ROOF%20RAINBOW%20-%20ROOF-500x500.jpg"
                  ></v-img>
                </v-avatar>
              </v-container>
            </v-flex>
            <v-flex xs8>
              <v-card-text>
                <div class="title" style="font-size:12pt !important; ">Nama barang</div>
                <div class="subtitle-1">Keterangan</div>
              </v-card-text>
            </v-flex>
          </v-layout>
      </v-card>-->
    </v-flex>

    <!-- <v-card class="mx-auto" max-width="300" tile v-for="i in 5" :key="i">
      <v-img height="100%" src="https://cdn.vuetifyjs.com/images/cards/server-room.jpg">
        <v-row align="end" class="fill-height">
          <v-col align-self="start" class="pa-0" cols="12">
            <v-avatar class="profile" color="grey" size="164" tile>
              <v-img src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"></v-img>
            </v-avatar>
          </v-col>
          <v-col class="py-0">
            <v-list-item color="rgba(0, 0, 0, .4)" dark>
              <v-list-item-content>
                <v-list-item-title class="title">Marcus Obrien</v-list-item-title>
                <v-list-item-subtitle>Network Engineer</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>
          </v-col>
        </v-row>
      </v-img>
    </v-card>-->
  </v-app>
</template>

<script>
export default {
  name: "ListPriceList",

  data() {
    return {
      expanded: [],
      singleExpand: false,
      barang: [
        {
          namaBarang: "Kayu",
          stock: "100",
          hargaBawah: 50000,
          hargaAtas: 100000,
          satuan: "batang"
        },
        {
          namaBarang: "Besi",
          stock: "100",
          hargaBawah: 50000,
          hargaAtas: 100000,
          satuan: "batang"
        }
      ],
      searchPricelist: ""
    };
  },
  computed: {
    headers() {
      return [{ text: "Nama Barang", value: "namaBarang" }];
    }
  }
};
</script>

<style>
.cancel {
  position: absolute;
  z-index: 1;
  margin-left: 80%;
}
</style>