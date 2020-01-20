<template>
    <v-app>
        <v-card :elevation="1" link color="blue" dark class="mb-5" @click="goTo('addKaryawan')">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Tambah Karyawan</v-card-title>
                    <v-card-subtitle>Menambahkan Data Karyawan</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-account-plus</v-icon></v-card-text>
                </div>
            </div>
        </v-card>
        <v-card :elevation="1" link color="blue" dark class="mb-5">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Tambah Divisi</v-card-title>
                    <v-card-subtitle>Menambahkan Divisi</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-sitemap</v-icon></v-card-text>
                </div>
            </div>
        </v-card>
        <v-card :elevation="1" link color="green" dark class="mb-5">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Roles & Permission</v-card-title>
                    <v-card-subtitle>Mengatur Roles & Permission Untuk tiap Divisi</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-account-key</v-icon></v-card-text>
                </div>
            </div>
        </v-card>
        <v-card :elevation="1" link color="red" dark class="mb-5">
            <div class="d-flex flex-no-wrap justify-space-between align-center">
                <div>
                    <v-card-title>Hapus Karyawan</v-card-title>
                    <v-card-subtitle>Menghapus Data Karyawan</v-card-subtitle>
                </div>
                <div>
                    <v-card-text><v-icon size="50">mdi-account-remove</v-icon></v-card-text>
                </div>
            </div>
        </v-card>
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