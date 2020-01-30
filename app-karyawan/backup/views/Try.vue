<template>
  <v-app>
     <v-expansion-panels focusable>
      <v-expansion-panel>
        <v-expansion-panel-header>Barang yang disorot</v-expansion-panel-header>
        <v-expansion-panel-content>
          
            <v-card v-for="i in 5" :key="i">
              <div class="d-flex">
                <v-avatar class="profile ml-2" color="grey" height="80px" width="80px" tile>
                  <v-img
                    src="http://jayarayabali.com/image/cache/catalog/Metal%20Roofing/COLOR%20PAINT%20FINISHED%20METAL%20ROOF%20RAINBOW%20-%20ROOF-500x500.jpg"
                  ></v-img>
                </v-avatar>
                <div>
                  <v-card-title>Tambah Barang</v-card-title>
                  <v-card-subtitle>Menambahkan barang baru</v-card-subtitle>
                </div>
                <v-spacer></v-spacer>
                <div>
                  <v-card-text>
                    <v-icon size="50">mdi-plus-box-outline</v-icon>
                  </v-card-text>
                </div>
              </div>
            </v-card>
          
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </v-app>
</template>

<script>
export default {};
</script>

<style>
</style>