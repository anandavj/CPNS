<template>
    <v-app>
        <div>
            <v-text-field
                v-model="searchPricelist"
                placeholder="Cari Barang"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
            />
            <v-data-table
                :headers="headers"
                :items="barang"
                :search="searchPricelist"
                :disable-sort="true"
                no-data-text="Tidak ada Data T_T"
                no-results-text="Barang tidak ditemukan"
                :hide-default-footer="true"
            >
            </v-data-table>
        </div>
    </v-app>
</template>

<script>
export default {
    name:'ListPriceList',
    data() {
        return {
            barang: [
                {namaBarang:'Kayu',stock:'100',hargaBawah:50000,hargaAtas:100000,satuan:'batang'}
            ],
            searchPricelist:''
        }
    },
    computed: {
        headers() {
            return [
                {text:'Nama Barang', value:'namaBarang', width:'40%'},
                {text:'Stock', value:'stock',filter: () => true},
                {text:'Harga Bawah', value:'hargaBawah',filter: () => true},
                {text:'Harga Atas', value:'hargaAtas',filter: () => true},
                {text:'Satuan', value: 'satuan',filter: () => true}
            ]
        }
    }
}
</script>