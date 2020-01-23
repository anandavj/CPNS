<template>
    <v-app>

        <!-- add product -->
        <v-card :elevation="1" link color="blue" dark class="mb-5" @click="goTo('addBarang')">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Tambah Barang</v-card-title>
                    <v-card-subtitle>Menambahkan barang baru</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-plus-box-outline</v-icon></v-card-text>
                </div>
            </div>
        </v-card>

        <!-- add unit -->
        <v-card :elevation="1" link color="indigo darken-1" dark class="mb-5" @click="goTo('addSatuan')">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Tambah Satuan</v-card-title>
                    <v-card-subtitle>Menambahkan satuan baru</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-plus-box-outline</v-icon></v-card-text>
                </div>
            </div>
        </v-card>

        <!-- add category -->
        <v-card :elevation="1" link color="teal darken-1" dark class="mb-5" @click="goTo('addKategori')">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Tambah kategori</v-card-title>
                    <v-card-subtitle>Menambahkan kategori baru</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-plus-box-outline</v-icon></v-card-text>
                </div>
            </div>
        </v-card>

        <!-- highlight -->
        <v-card :elevation="1" link color="orange darken-1" dark class="mb-5" @click="goTo('highlight')">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Highlight Barang</v-card-title>
                    <v-card-subtitle>Mengelola barang yang disorot di landing page dan katalog</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-lightbulb</v-icon></v-card-text>
                </div>
            </div>
        </v-card>
        <!-- <v-card :elevation="1" link color="red" dark class="mb-5">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Hapus Karyawan</v-card-title>
                    <v-card-subtitle>Menghapus Data Karyawan</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-account-remove</v-icon></v-card-text>
                </div>
            </div>
        </v-card> -->
    </v-app>
</template>

<script>
export default {
    name:'managementKaryawan',
    data() {
        return {

        }
    },
    methods: {
        goTo(route) {
            this.$router.push(route)
        }
    }
}
</script>