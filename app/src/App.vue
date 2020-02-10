<template>
  <v-app>
    <v-layout column>
      <v-app-bar class="bar pl-4 pr-4" clipped-left >
        <v-layout row class="justify-start align-center">
          <v-flex md3 class="justify-center">
            <v-layout row>
              <v-icon x-large class="ml-2" color="primary">mdi-checkbox-blank</v-icon>
              <v-col class="primary--text">BUANA PAKSA INDONESIA</v-col>
            </v-layout>
          </v-flex>
          <v-flex md6 v-if="!this.$route.meta.drawer">
            <v-layout row wrap class="align-center">
              <v-col>
                <div class="align-center mt-6">
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
              </v-col>
            </v-layout>
          </v-flex>
          <v-flex md9 v-if="this.$route.meta.drawer">
            <v-row height="100%" class="justify-end">
              <v-flex xs1>
                <v-btn color="primary" text href="/katalog">Katalog</v-btn>
              </v-flex>
              <v-flex xs1>
                <v-btn color="primary" text href="/admin">Admin</v-btn>
              </v-flex>
            </v-row>
          </v-flex>
        </v-layout>
      </v-app-bar>
      <v-layout row class="ma-0">
        <v-flex md3 v-if="!this.$route.meta.drawer">
          <Toolbar />
        </v-flex>
        <v-flex xs9 v-if="!this.$route.meta.drawer">
          <v-container grid-list-xs>
            <v-card flat>
              <router-view></router-view>
            </v-card>
          </v-container>
        </v-flex>
        <v-row v-if="this.$route.meta.drawer" class="ma-5 justify-center">
          <v-flex xs8>
            <v-container>
              <v-card flat>
                <router-view></router-view>
              </v-card>
            </v-container>
          </v-flex>
        </v-row>
      </v-layout>
    </v-layout>
  </v-app>
</template>

<script>
import Toolbar from "@/components/Toolbar";
// import Searchbar from "@/components/Searchbar";
import "@/store/index.js";

export default {
  name: "App",

  components: {
    Toolbar
    // Searchbar
  },

  data: () => ({
    //
  })
};
</script>

<style>
.bar {
  position: -webkit-sticky;
  position: sticky;
  overflow: hidden;
  top: 0;
  z-index: 10;
}
</style>