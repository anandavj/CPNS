<template>
    <v-app>
        <div>
            <v-text-field
                v-model="searchPricelist"
                placeholder="Cari Barang"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
            />
            <v-switch value v-model="editToggle" class="pa-0 ma-0" label="Edit Price"></v-switch>
            <v-data-table
                :headers="headers"
                :items="barangs"
                :search="searchPricelist"
                :disable-sort="true"
                :mobile-breakpoint="1"
                no-data-text="Tidak ada Data T_T"
                no-results-text="Barang tidak ditemukan"
                :hide-default-footer="true"
                item-key="no"
                class="font-regular font-weight-light"
                @click:row="openDetails"
            >
                <template v-slot:item.openPrice="{ item }">
                    <template v-if="editToggle">
                        <v-btn
                        text 
                        @click.stop="quickEdit(item)" 
                        class="blue--text pa-0 font-weight-light"
                        >
                            {{ item.openPriceEdit }}
                        </v-btn>
                    </template>
                    <template v-else>
                        <v-layout justify-center >{{item.openPriceEdit}}</v-layout>
                    </template>
                </template>
            </v-data-table>
            <v-dialog v-model="detailsDialog" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-text>{{barang}}</v-card-text>
                </v-card>
            </v-dialog>
        </div>
    </v-app>
</template>

<script>

export default {
    name:'ListPriceList',
    
    data() {
        return {
            headers: [
                {text:'Nama Barang', value:'namaBarang', width:'60%'},
                {text:'Open Price', value:'openPrice', align:'center'}
            ],
            barangs: [
                {
                    no:1,
                    namaBarang:'Kayu',
                    openPriceEdit: 10000,
                    details: [
                        {bottomPrice:1000, stock: 100, satuan:'Batang'}
                    ]
                },
                {
                    no:2,
                    namaBarang:'Besi',
                    openPriceEdit: 5000,
                    details: [
                        {bottomPrice:1000, stock: 100, satuan:'Batang'}
                    ]    
                }
            ],
            itemHeaders: [
                {text:'Bottom Price', value:'bottomPrice'},
                {text:'Stock', value:'stock'},
                {text:'Satuan', value:'satuan'}
            ],
            searchPricelist:'',
            editToggle: false,
            detailsDialog: false,
            editDialog: false,
            barang: [],
            barangDefault: [],
            selectedIndex: -1
        }
    },

    methods: {
        openDetails(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barang = Object.assign({},item)
            this.detailsDialog = true
        },
        close() {
            this.barang = Object.assign({},this.barangDefault)
            this.selectedIndex = -1
            this.detailsDialog = false
        }
    }
}
</script>