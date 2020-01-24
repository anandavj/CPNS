<template>
  <div id="app">
  <v-app id="inspire">
    <v-card>
      <v-card-title>
        Nutrition
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="desserts"
        :search="search"
      ></v-data-table>
    </v-card>
  </v-app>
</div>
</template>

<script>
export default {
  data() {
    return {
      headers: [
        {
          text: "Dessert (100g serving)",
          align: "left",
          sortable: false,
          value: "name"
        },
        {
          text: "Category",
          value: "category",
          align: " d-none d-lg-table-cell"
        },
        {
          text: "Calories",
          value: "calories",
          align: " d-none d-lg-table-cell"
        },
        { text: "Fat (g)", value: "fat" },
        { text: "Carbs (g)", value: "carbs" },
        { text: "Protein (g)", value: "protein" },
        { text: "Iron (%)", value: "iron" }
      ],
      desserts: [
          {
              name: "chocolate",
              category: "choco",
              fat: 20,
          }
      ]

      
    };
  }
};
</script>

<style>
</style>