<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Barang"
                solo
                clearable
                append-icon="mdi-magnify"
                v-model="searchBarang"
            />
            <v-data-table
                :headers="headers"
                :items="barang"
                :search="searchBarang"
                hide-default-footer="true"
            >                
            </v-data-table>
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Barang',
    data() {
        return {
            barang: [
                {no:1, namaBarang:'Paku', harga:50000, stock:20, satuan:'kotak'},
                {no:2, namaBarang:'Balok', harga:2000, stock:20, satuan:'meter persegi'}                
            ],
            searchBarang: ''
        }
    },
    computed: {
        headers() {
            return [
                {text:'No', value:'no',filter: () => true},
                {text:'Nama Barang', value:'namaBarang'},
                {text:'Harga', value:'harga',filter: () => true},
                {text:'Stock', value:'stock',filter: () => true},
                {text:'Satuan', value: 'satuan',filter: () => true}
            ]
        }
    }
}
</script>