<template>
  <v-app>
    <v-card
      v-for="(menu,index) in menus"
      :key="index"
      :elevation="1"
      link
      :color="menu.bgcolor"
      dark
      class="mb-5"
      @click="goTo(menu.route)"
    >
      <div class="d-flex flex-no-wrap justify-space-between align-center">
        <div>
          <v-card-title>{{menu.title}}</v-card-title>
          <v-card-subtitle>{{menu.subtitle}}</v-card-subtitle>
        </div>
        <div>
          <v-card-text>
            <v-icon size="50">{{menu.icon}}</v-icon>
          </v-card-text>
        </div>
      </div>
    </v-card>
    
  </v-app>
</template>

<script>
export default {
  name: "KaryawanKelola",

  data() {
    return {
      menus: [
        {
          title: "Barang",
          subtitle: "Lihat list barang, dan pengaturan barang",
          icon: " mdi-cube-outline",
          bgcolor: "blue",
          route: "/barang"
        },
        {
          title: "Kategori",
          subtitle: "Lihat list kategori, dan pengaturan kategori",
          icon: "mdi-group",
          bgcolor: "green",
          route: "/kategori"
        },
        {
          title: "Satuan",
          subtitle: "Lihat list satuan, dan pengaturan satuan",
          icon: "mdi-omega",
          bgcolor: "indigo",
          route: "/satuan"
        }
      ]
    };
  },

  methods: {
    goTo(route, title = route) {
      this.$router.push(route);
      this.titleBar = title;
    }
  }
};
</script>