<template>
  <v-card
    color="indigo"
    elevation="15"
    width="100%"
    height="55vh"
    max-height="55vh"
    class="admin-nav"
  >
    <v-card height=100% width=95% class="mr-auto">
      <v-navigation-drawer>
        <v-list dense rounded>
          <v-list-item v-for="item in menus" :key="item.title" link @click="goTo(item.route)">
            <v-list-item-icon>
              <v-icon color="indigo" large>{{ item.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title style="color: #3F51B5; ">{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>
    </v-card>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      menus: [
        {
          title: "Home",
          subtitle: "Admin main page",
          icon: " mdi-account",
          route: "/admin"
        },
        {
          title: "Barang",
          subtitle: "Lihat list barang, dan pengaturan barang",
          icon: " mdi-cube-outline",
          route: "/barang"
        },
        {
          title: "Gambar",
          subtitle: "Menambahkan gambar ke database",
          icon: " mdi-file-image",
          route: "/gambar"
        },
        {
          title: "Kategori",
          subtitle: "Lihat list kategori, dan pengaturan kategori",
          icon: "mdi-group",
          route: "/kategori"
        },
        {
          title: "Satuan",
          subtitle: "Lihat list satuan, dan pengaturan satuan",
          icon: "mdi-omega",
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

<style scoped>
.admin-nav {
  position: -webkit-sticky;
  position: sticky;
  top: 13%;
  z-index: 1;
  overflow-y: auto;
}
</style>