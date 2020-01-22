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
                item-key="namaBarang"
                :single-expand="singleExpand"
                :expanded.sync="expanded"
                show-expand
            >
                <template v-slot:expanded-item="{ headers, item }">
                    <td :colspan="headers.length">
                        <!-- {{ item.hargaBawah }} -->
                        <v-data-table
                            :headers="itemHeaders"
                            :items="item.details"
                            :disable-filtering="true"
                            :disable-sort="true"
                            :hide-default-footer="true"
                            :hide-default-header="true"
                            :mobile-breakpoint="4000"
                            class="transparent"
                        >
                        </v-data-table>
                    </td>
                </template>
            </v-data-table>
        </div>
    </v-app>
</template>

<script>

export default {
    name:'ListPriceList',
    
    data() {
        return {
            expanded: [],
            singleExpand: false,
            headers: [
                {text:'Nama Barang', value:'namaBarang'},
            ],
            barang: [
                {
                    namaBarang:'Kayu',
                    details: [
                        {hargaBawah:1000, hargaAtas:5000, stock: 100, satuan:'Batang'}
                    ]
                },
                {
                    namaBarang:'Besi',
                    details: [
                        {hargaBawah:1000, hargaAtas:5000, stock: 100, satuan:'Batang'}
                    ]    
                }
            ],
            itemHeaders: [
                {text:'Harga Bawah', value:'hargaBawah'},
                {text:'Harga Atas', value:'hargaAtas'},
                {text:'Stock', value:'stock'},
                {text:'Satuan', value:'satuan'}
            ],

            searchPricelist:''
        }
    }
}
</script>