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
                :mobile-breakpoint="1"
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
                {text:'Nama Barang', value:'namaBarang'},
            ]
        }
    }
}
</script>