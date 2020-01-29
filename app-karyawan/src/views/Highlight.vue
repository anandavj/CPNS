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
          
            <v-card  v-for="i in 5" :key="i" class="ma-2" flat>
              <div class="d-flex">
                <v-avatar class="profile" color="grey" height="80px" width="80px" tile>
                  <v-img
                    src="http://jayarayabali.com/image/cache/catalog/Metal%20Roofing/COLOR%20PAINT%20FINISHED%20METAL%20ROOF%20RAINBOW%20-%20ROOF-500x500.jpg"
                  ></v-img>
                </v-avatar>
                <div>
                  <v-card-title>Nama Barang</v-card-title>
                  <v-card-subtitle>Deskripsi barang</v-card-subtitle>
                </div>
                <v-spacer></v-spacer>
                <div>
                  <v-card-text>
                    <v-icon size="50" color="red">mdi-close</v-icon>
                  </v-card-text>
                </div>
              </div>
            </v-card>

        <div style="color:red;">*Barang yang disorot maksimal 5</div>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>

    
  <v-card class=pa-5>
    
    <!-- products -->
    <v-card  v-for="i in 10" :key="i" flat class="ma-2">
              <div class="d-flex">
                <v-avatar class="profile ma-1" color="grey" height="80px" width="80px" tile>
                  <v-img
                    src="http://jayarayabali.com/image/cache/catalog/Metal%20Roofing/COLOR%20PAINT%20FINISHED%20METAL%20ROOF%20RAINBOW%20-%20ROOF-500x500.jpg"
                  ></v-img>
                </v-avatar>
                <div>
                  <v-card-title>Nama Barang</v-card-title>
                  <v-card-subtitle>Deskripsi barang</v-card-subtitle>
                </div>
                <v-spacer></v-spacer>
                <div>
                  <v-card-text>
                    <v-icon size="50" color="green">mdi-plus</v-icon>
                  </v-card-text>
                </div>
              </div>
            </v-card>


  </v-card>
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
/* .cancel {
  position: absolute;
  z-index: 1;
  margin-left: 80%;
} */
</style>