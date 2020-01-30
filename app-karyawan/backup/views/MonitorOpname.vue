<template>
  <v-layout row wrap>
    <v-flex xs12 md6>
      <v-text-field
        v-model="searchOpname"
        placeholder="Cari Barang"
        :solo="true"
        :clearable="true"
        append-icon="mdi-magnify"
        class="ma-0"
      />
    </v-flex>

    <v-flex xs4 md2 ml-2>
      <v-menu
        ref="menu"
        v-model="menu"
        :close-on-content-click="false"
        :return-value.sync="date"
        transition="scale-transition"
        offset-y
        min-width="290px"
      >
        <template v-slot:activator="{ on }">
          <v-text-field
            v-model="date"
            label="Tanggal"
            prepend-icon="mdi-calendar"
            readonly
            v-on="on"
          ></v-text-field>
        </template>
        <v-date-picker v-model="date" no-title scrollable day-format>
          <v-spacer></v-spacer>
          <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
          <v-btn text color="primary" @click="$refs.menu.save(date)">OK</v-btn>
        </v-date-picker>
      </v-menu>
    </v-flex>

    <v-flex xs12>
      <v-card>
        <v-data-table :headers="headers" :items="records" :search="search"></v-data-table>
      </v-card>
    </v-flex>
    <v-spacer></v-spacer>
  </v-layout>
</template>


<script>
export default {
  data: () => ({
    date: new Date().toISOString().substr(0, 10),
    search: '',
    searchOpname: '',
    menu: false,
    headers: [
      { text: "Tanggal", value: "date" },
      {
        text: "Nama barang",
        align: "left",
        filterable: false,
        value: "name"
      },
      { text: "Stok gudang", value: "stockReal" },
      { text: "Stok database", value: "stockDatabase" },
      { text: "Pemeriksa", value: "employee" }
    ],
    records: [
      {
        date: "2020-01-20",
        name: "Atap",
        stockReal: 400,
        stockDatabase: 400,
        employee: "Fajar"
      },
      {
        date: "2020-01-19",
        name: "Galvalume",
        stockReal: 450,
        stockDatabase: 450,
        employee: "Nanda"
      },
      {
        date: "2020-01-20",
        name: "Atap 2",
        stockReal: 300,
        stockDatabase: 350,
        employee: "Fajar"
      },
      {
        date: "2020-01-20",
        name: "Atap",
        stockReal: 400,
        stockDatabase: 400,
        employee: "Fajar"
      },
      {
        date: "2020-01-19",
        name: "Galvalume",
        stockReal: 450,
        stockDatabase: 450,
        employee: "Nanda"
      },
      {
        date: "2020-01-20",
        name: "Atap 2",
        stockReal: 300,
        stockDatabase: 350,
        employee: "Fajar"
      },
      {
        date: "2020-01-20",
        name: "Atap",
        stockReal: 400,
        stockDatabase: 400,
        employee: "Fajar"
      },
      {
        date: "2020-01-19",
        name: "Galvalume",
        stockReal: 450,
        stockDatabase: 450,
        employee: "Nanda"
      },
      {
        date: "2020-01-20",
        name: "Atap 2",
        stockReal: 300,
        stockDatabase: 350,
        employee: "Fajar"
      },
    ]
  }),
  methods: {
    setDate(year, month, day) {
      return new Date(year, month, day);
    }
  },

  computed: {}
};
</script>