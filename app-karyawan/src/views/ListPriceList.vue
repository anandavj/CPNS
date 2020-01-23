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
            <v-dialog v-model="editDialog" persistent max-width='350px'>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light"> Edit Open Price</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                        <v-card-title>{{editedItem.namaItem}}</v-card-title>
                        <v-card-text><v-text-field color="blue" outlined v-model="editedItem.hargaItem" placeholder="Harga Barang"></v-text-field></v-card-text>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n12" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="mt-n12" color="blue darken-1" text @click="saveEditedPrice">Ya</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
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
            editedItem: {
                idItem:null,
                namaItem:'',
                hargaItem:null
            },
            editedItemDefault: {
                idItem:null,
                namaItem:'',
                hargaItem:null
            },
            editedlist:[],
            selectedIndex: -1,
        }
    },

    methods: {
        openDetails(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barang = Object.assign({},item)
            this.detailsDialog = true
        },
        close() {
            if(this.detailsDialog) {
                this.barang = Object.assign({},this.barangDefault)
                this.selectedIndex = -1
                this.detailsDialog = false
            } else if (this.editDialog) {
                this.editedItem = Object.assign({},this.editedItemDefault)
                this.selectedIndex = -1
                this.editDialog = false
            }
        },
        quickEdit(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.editedItem.hargaItem = item.openPriceEdit
            this.editedItem.namaItem = item.namaBarang
            this.editedItem.idItem = item.no
            this.editDialog = true
        },
        saveEditedPrice() {
            this.editedItem.hargaItem = parseInt(this.editedItem.hargaItem)
            let obj = this.editedlist.find( ({idItem}) => idItem === this.editedItem.idItem )
            if (!obj) {
                this.editedlist.push(this.editedItem)
            } else {
                let editedIndex = this.editedlist.indexOf(obj)
                this.editedlist.splice(editedIndex,1)
                this.editedlist.push(this.editedItem)
            }
            this.close()
        }
    }
}
</script>