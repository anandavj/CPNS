<template>
    <v-app>
        <v-card v-for="(menu,index) in menus" :key="index" :elevation="1" link :color="menu.bgcolor" dark class="mb-5" @click="goTo(menu.route)">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>{{menu.title}}</v-card-title>
                    <v-card-subtitle>{{menu.subtitle}}</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">{{menu.icon}}</v-icon></v-card-text>
                </div>
            </div>
        </v-card>
    </v-app>
</template>

<script>
export default {
    name: 'BarangKelola',

    data() {
        return {
            menus: [
                {title:'Kategori', subtitle:'Melihat Kategori, Menambah kategori, Mengatur Kategori', icon:'mdi-group', bgcolor:'blue', route:'/kategori'},
                {title:'Satuan', subtitle:'Melihat Satuan, Menambah Satuan, Mengatur Satuan', icon:'mdi-omega', bgcolor:'blue', route:'/satuan'}
            ]
        }
    },

    methods: {
        goTo(route, title = route) {
            this.$router.push(route)
            this.titleBar = title
        }
    }
}
</script>