<template>
    <v-app>
        <v-card v-for="(menu,index) in menus" :key="index" :elevation="1" link :color="menu.bgcolor" dark class="mb-5" @click="goTo(menu.route)">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>{{menu.title}}</v-card-title>
                    <v-card-subtitle>{{menu.subtitle}}</v-card-subtitle>
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
                {title:'Kategori', subtitle:'Melihat Kategori, menambah kategori, mengatur Kategori', icon:'mdi-group', bgcolor:'blue', route:'/kategori'}
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