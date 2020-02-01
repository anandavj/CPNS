<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Barang"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchBarang"
            />
            <v-data-table
                :headers="headers"
                :items="barang"
                :search="searchBarang"
                :mobile-breakpoint="1"
                :disable-sort='true'
                class="font-regular font-weight-light"
                :hide-default-footer="true"
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
                {no:1, namaBarang:'Paku', stock:20, satuan:'kotak'},
                {no:2, namaBarang:'Balok', stock:20, satuan:'meter persegi'}                
            ],
            searchBarang: ''
        }
    },
    computed: {
        headers() {
            return [
                {text:'No', value:'no',filter: () => true},
                {text:'Nama Barang', width:'40%', value:'namaBarang'},
                {text:'Stock', value:'stock',filter: () => true},
                {text:'Satuan', value: 'satuan',filter: () => true}
            ]
        }
    }
}
</script>