<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Barang in Barangs Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Barang"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchBarang"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Barang -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark large color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n3">
                <v-dialog v-model="popUpNew" persistent max-width='1000px'>
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Barang</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12">
                                        <v-text-field label="ID" v-model="barang.id"/>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-text-field label="Nama" v-model="barang.nama"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Open Price" v-model="barang.openPrice"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Bottom Price" v-model="barang.bottomPrice"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Stock" v-model="barang.stock"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Satuan" v-model="barang.satuan"/>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n5" color="red darken-1" text @click="close">Cancel</v-btn>
                                    <v-btn class="mt-n5" color="blue darken-1" text @click="saveNewBarang">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Edit Barang -->
            <!-- *************************************************************************************************************** -->
            <v-switch value v-model="editToggle" class="pa-0 ma-0" label="Edit Price"></v-switch>
            <v-dialog v-model="popUpQuickEdit" persistent max-width='350px'>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light"> Edit Open Price</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                        <v-card-title>{{barangQuickEdit.nama}}</v-card-title>
                       <v-form ref="form">
                            <v-card-text><v-text-field color="blue" outlined v-model="barangQuickEdit.openPrice" placeholder="Harga Barang"></v-text-field></v-card-text>
                       </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n12" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="mt-n12" color="blue darken-1" text @click="confirmSave">Ya</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                </v-card>
            </v-dialog>
            <v-dialog persistent v-model="popUpConfirmSaveQuickEdit" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin mengubah Harga Barang <b>{{barangQuickEdit.nama}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="saveEditedPrice">Ya</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- List Barang -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="barangHeaders"
                :items="barangs"
                :search="searchBarang"
                @click:row="details"
                :disable-sort="true"
                :hide-default-footer="true"
                :mobile-breakpoint="1"
                item-key="nama"
                no-data-text="Data Barang Kosong"
                no-results-text="Data Barang Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{ item }">
                    <v-icon class="mr-2" @click.stop="editBarang(item)">mdi-pencil</v-icon>
                </template>
                <template v-slot:item.openPrice="{ item }">
                    <template v-if="editToggle">
                        <v-btn
                        text 
                        @click.stop="quickEdit(item)" 
                        class="blue--text pa-0 font-weight-light"
                        >
                            {{ item.openPrice }}
                        </v-btn>
                    </template>
                    <template v-else>
                        <v-layout justify-center >{{item.openPrice}}</v-layout>
                    </template>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Details Barang -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
            <v-dialog v-if="popUpBreakPoint" v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{barang}}
                </v-card>
            </v-dialog >
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else v-model="popupDetails" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{barang}}
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Kartu Stock -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Barang',
    data() {
        return {
            barangs: [
                {id:1, nama:'Paku', openPrice:5000, bottomPrice:3000, stock:100, satuan:'biji'},
                {id:2, nama:'Kayu', openPrice:12000, bottomPrice:3000, stock:400, satuan:'biji'},
                {id:3, nama:'Atap', openPrice:100000, bottomPrice:3000, stock:1100, satuan:'biji'}
            ],
            barang: {
                id:null,
                nama:'',
                openPrice:null,
                stock:null
            },
            barangDefault: {
                id:null,
                nama:'',
                openPrice:null,
                stock:null
            },
            barangQuickEdit: {
                id:null,
                nama:'',
                openPrice:null
            },
            barangQuickEditDefault: {
                id:null,
                nama:'',
                openPrice:null
            },
            searchBarang:'',
            editToggle:false,
            popUpQuickEdit: false,
            popUpNew: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSaveQuickEdit: false,
            selectedIndex: -1,
        }
    },

    methods: {
        details(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barang = Object.assign({},item)
            this.popupDetails = true
        },
        close() {
            if(this.popupDetails) {
                this.popupDetails = false
                this.barang = Object.assign({},this.barangDefault)
                this.selectedIndex = -1
            } else {
                if(this.popUpNew) {
                    this.popUpNew = false
                    this.barang = Object.assign({},this.barangDefault)
                } else {
                    if(this.popUpQuickEdit) {
                        this.popUpQuickEdit = false
                        this.barangQuickEdit = Object.assign({},this.barangQuickEditDefault)
                    }
                }
            }
        },
        quickEdit(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barangQuickEdit.openPrice = item.openPrice
            this.barangQuickEdit.nama = item.nama
            this.barangQuickEdit.id = item.id
            this.popUpQuickEdit = true
        },
        confirmSave() {
            if(this.$refs.form.validate()) {
                this.popUpQuickEdit = false
                this.popUpConfirmSaveQuickEdit = true
            }
        },
        //this need promise to ensure that the data in the db and vue in synced !!! IMPORTANT !!!
        saveEditedPrice() {
            let obj = this.barangs.find( ({id}) => id === this.barangQuickEdit.id )
            this.barangs[this.barangs.indexOf(obj)].openPrice = this.barangQuickEdit.openPrice
            this.popUpConfirmSaveQuickEdit = false
            this.barangQuickEdit = Object.assign({},this.barangQuickEditDefault)
        }
    },
    
    computed: {
        barangHeaders() {
            return [
                {text:'Nama', value:'nama', width:'70%'},
                {text:'Open Price', value:'openPrice', align:'center'},
                {text:'Stock', value:'stock'},
                {text:'',value:'actions',width:'5%'}
            ]
        },
        //view Breakpoint
        popUpBreakPoint() {
            if (this.$vuetify.breakpoint.name == 'xs' || this.$vuetify.breakpoint.name == 'sm') {
                return true
            } else {
                return false
            }
        }
    }
    
}
</script>