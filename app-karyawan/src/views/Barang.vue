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
                disable-filtering="true"
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
            headers: [
                {text:'No', value:'no'},
                {text:'Nama Barang', value:'namaBarang'},
                {text:'Harga', value:'harga'},
                {text:'Stock', value:'stock'},
                {text:'Satuan', value: 'satuan'}
            ],
            barang: [
                {no:1, namaBarang:'Paku', harga:50000, stock:20, satuan:'kotak'},
                {no:2, namaBarang:'Balok', harga:2000, stock:20, satuan:'meter persegi'}                
            ],
            searchBarang: ''
        }
    }
}
</script>