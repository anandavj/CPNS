<template>
  <v-app>
    <v-layout row wrap class="pa-10">
      <v-flex 
      v-for="n in 20"
      :key="n"
      xs6 md4 lg3 xl2 color="primary">
        <v-card class="ma-2">
        <v-img src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg" :aspect-ratio="1/1"></v-img>
        <v-card-title primary-title>
          Nama Barang
        </v-card-title>
        
        </v-card>
      </v-flex>
    </v-layout>
    
  </v-app>
</template>

<script>
export default {

}
</script>

<style>

</style>