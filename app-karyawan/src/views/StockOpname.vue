<template>
  <v-layout row wrap justify-center>
    <v-flex xs12 md6>
      <v-card height="70vh" class="ma-3 card-outter">
        <v-col cols="12" align-center>
          <v-select :items="items" label="Nama barang"></v-select>
          <v-layout row wrap align-end>
            <v-flex xs12>
              <p class="text-center text">
                Stok di database:
                <b>{{ stockDatabase }}</b>
              </p>
            </v-flex>
            <v-flex xs12 mt-12>
              <v-row justify="space-around" :elevation="5">
                <v-btn @click="addStockReal()" color="primary" class="button button5">counter</v-btn>
              </v-row>
              <v-flex xs12></v-flex>
              <p class="text-center text">{{ stockReal }} / {{ stockDatabase }}</p>
              <p
                class="text-center"
                v-show="over"
                style="color:red"
              >stok gudang melebihi stok database</p>
              <v-row no-gutters xs12>
                <v-flex xs6>
                  <v-card class="pa-2" flat>
                    <v-btn large color="light-blue" dark block @click="dialog = true">Input Manual</v-btn>
                  </v-card>
                </v-flex>
                <v-flex xs6>
                  <v-card class="pa-2" flat>
                    <v-btn large color="error" block @click="reset()">Reset</v-btn>
                  </v-card>
                </v-flex>
              </v-row>
            </v-flex>

            <v-dialog v-model="dialog" persistent max-width="290">
             
              <v-card>
                <v-card-title class="">Masukan Jumlah</v-card-title>
                <v-text-field class="pa-4"
                  name="stockReal"
                  label="Jumlah barang"
                  id="input"
                ></v-text-field>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="red darken-1" text @click="dialog = false">batal</v-btn>
                  <v-btn color="green darken-1" text @click="inputManual()">masukan</v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-layout>
        </v-col>

        <!-- <v-layout column pa-4>
          <v-col :alignment="end">
            <v-layout row wrap justify-space-around>
              <p class="text-center text">
                Stok di database:
                <b>{{ stockDatabase }}</b>
              </p>
            </v-layout>
            <v-row justify="space-around" :elevation="5">
              <v-btn color="primary" class="button button5">counter</v-btn>
            </v-row>
            <v-layout row wrap justify-space-around>
              <p class="text-center text">{{ stockReal }} / {{ stockDatabase }}</p>
            </v-layout>
          </v-col>
        </v-layout>-->
      </v-card>
      <v-bottom-nav absolute value="value" active.sync="value" shift color="red">
        <v-card>
          <v-btn x-large color="primary" outline block>Selesai</v-btn>
        </v-card>
      </v-bottom-nav>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  data() {
    return {
      items: ["barang 1", "barang 2", "barang 3", "barang 4"],
      stockDatabase: 40,
      stockReal: 0,
      dialog: false
    };
  },
  methods: {
    addStockReal() {
      this.stockReal += 1;
      if (this.stockReal > this.stockDatabase) this.over = true;
      else this.over = false;
    },
    reset() {
      this.stockReal = 0;
      this.over = false;
    },
    inputManual(){
      this.stockReal = document.getElementById("input").value;
      if (this.stockReal > this.stockDatabase) this.over = true;
      this.dialog = false;
    }
  }
};
</script>

<style>
.button {
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 50%;
  width: 150px;
  height: 150px !important;
}
.text {
  font-size: 16pt;
}

/* .doneButton {
  position: relative;
  margin-top: 40%;
  width: 100%;
  z-index: 10;
} */
</style>