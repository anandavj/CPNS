<template>
  <v-app>
    <v-row>
      <v-col cols="12" class="my-0">
        <v-card color="grey lighten-4" flat max-height="70vh">
          <v-toolbar color="primary" dark>
            <v-btn text @click="showProductImages = true; showCarouselImages = false">Product</v-btn>
            <v-btn text @click="showProductImages = false; showCarouselImages = true">Carousel</v-btn>
          </v-toolbar>
          <v-card-text v-if="showProductImages">
            <v-radio-group v-model="radioGroup">
              <v-radio v-for="n in 3" :key="n"></v-radio>
            </v-radio-group>
          </v-card-text>

          <v-card-text v-if="showCarouselImages">carousel</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    showProductImages: true,
    showCarouselImages: false
  })
};
</script>

<style>
</style>