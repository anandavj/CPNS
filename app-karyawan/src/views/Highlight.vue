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

    <v-layout row wrap ma-2>
      <v-flex xs12>
        <div class="text-center title">Barang yang terhighlight</div>
      </v-flex>

      <v-card v-for="i in 5" :key="i" raised>
        <v-layout row wrap>
          <v-flex xs2>
              <v-content>
                  
            <v-img
              src="https://www.caritra.org/wp-content/uploads/2017/02/db3d97_710159ed020849cea0272e6ef3836207mv2.png"
            ></v-img>
              </v-content>
          </v-flex>
          <v-flex xs10>
            <v-layout column></v-layout>
          </v-flex>
        </v-layout>
      </v-card>
    </v-layout>
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