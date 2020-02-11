<template>
 

  <v-card elevation="12" width="256" max-height="80vh" class="toolbar ma-12" flat>
    <v-navigation-drawer floating permanent color="primary" dark>
      <v-list dense rounded>
        <v-list-item v-for="n in 20" :key="n" link>
          <v-list-item-icon>
            <v-icon>mdi-view-grid</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Kategori {{ n }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </v-card>


  <!-- <v-navigation-drawer show-sm-and-up color="primary" dark
      v-model="drawer"
      app
      clipped
    >
      <v-list dense
      v-for="x in 10"
      :key="x">
        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Kategori {{ x }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

      </v-list>
  </v-navigation-drawer>-->

  <!-- <div>

    <v-app-bar
      app
      clipped-left
      color="primary"
      dark
    >
      
        
      <v-app-bar-nav-icon  class="hidden-sm-and-down" @click.stop="drawer = !drawer" />
      
      <v-toolbar-title>Buana Paksa Indonesia</v-toolbar-title>
    </v-app-bar>
  </div>-->

  <!-- <v-footer app color="primary" dark>
      <span>&copy; {{ new Date().getFullYear() }}</span>
  </v-footer>-->
</template>

<script>
export default {
  data() {
    return {
      items: [
        { title: "Home", icon: "mdi-account" },
        { title: "About", icon: "mdi-item" }
      ]
    };
  }
};
</script>

<style scoped>
.toolbar {
  position: -webkit-sticky;
  position: sticky;
  top: 15%;
  z-index: 1;
  overflow-y:auto;
}

.toolbar::-webkit-scrollbar{
  display: none;
}
</style>