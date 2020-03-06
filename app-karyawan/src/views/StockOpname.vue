<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search nomorStockOpname in nomorStockOpnames Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Nomor Stock Opname"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchNomorStockOpname"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Stock Opname -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark large color="primary" fixed right bottom @click="popUpNewStockOpname = !popUpNewStockOpname">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n3">
                <v-dialog v-model="popUpNewStockOpname" fullscreen hide-overlay transition="dialog-bottom-transition">
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Stock Opname</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form" class="px-2">
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12" class="mb-n8 mt-n4">
                                        <v-row justify="end">
                                            <v-col cols="2">
                                                <v-text-field v-model="nomorStockOpname.tanggalMulaiPeriksa" dense color="accent" outlined label="Tanggal Mulai"/>
                                            </v-col>
                                            <v-col cols="2">
                                                <v-text-field v-model="nomorStockOpname.tanggalBerakhirPeriksa" dense color="accent" outlined label="Tanggal Selesai"/>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <v-col cols="12" class="mt-n5">
                                        <v-row justify="end">
                                            <v-col cols="4">
                                                <v-divider></v-divider>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <v-col cols="6" class="my-n5">
                                        <v-text-field v-model="nomorStockOpname.nomor" dense color="accent" outlined label="Nomor Stock Opname"/>
                                    </v-col>
                                    <v-col cols="4" class="my-n5" v-if="!popUpBreakPoint">
                                        <v-text-field v-model="nomorStockOpname.hasilPeriksa" dense color="accent" outlined label="Hasil Periksa"/>
                                    </v-col>
                                    <v-col cols="6" class="my-n5" v-else>
                                        <v-text-field v-model="nomorStockOpname.hasilPeriksa" dense color="accent" outlined label="Hasil Periksa"/>
                                    </v-col>
                                    <v-col cols="2" class="my-n5" v-if="!popUpBreakPoint">
                                        <v-btn width="100%" outlined color="blue" @click="addNewPemeriksa = !addNewPemeriksa"><v-icon class="mr-3">mdi-account-group</v-icon>Daftarkan Pemeriksa</v-btn>
                                    </v-col>
                                    <v-col cols="12" class="mt-n5" v-else>
                                        <v-btn width="100%" outlined color="blue" @click="addNewPemeriksa = !addNewPemeriksa"><v-icon class="mr-3">mdi-account-group</v-icon>Daftarkan Pemeriksa</v-btn>
                                    </v-col>
                                    <v-container class="my-n3">
                                        <v-dialog style="z-index:999" v-model="addNewPemeriksa" persistent width="500px">
                                            <v-card>
                                                <v-toolbar dense flat>
                                                    <span class="title font-weight-light">Tambah Pemeriksa</span>
                                                </v-toolbar>
                                                <v-card-text>
                                                    <v-row justify="center">
                                                        <v-col cols="12" class="mb-n6">
                                                            <v-text-field dense id="newPemeriksaFocusGained" v-on:keyup.enter="pushNewPemeriksa" v-model="newPemeriksa.nama" color="accent" outlined label="Nama Pemeriksa" append-icon="mdi-plus" @click:append="pushNewPemeriksa"/>
                                                        </v-col>
                                                        <v-col cols="12">
                                                            <v-data-table
                                                                :headers="listPemeriksaHeader"
                                                                :items="nomorStockOpname.pemeriksa"
                                                                :hide-default-footer="true"
                                                                :disable-filtering="true"
                                                                :disable-pagination="true"
                                                                :disable-sort="true"
                                                            ></v-data-table>
                                                        </v-col>
                                                    </v-row>
                                                    <v-card-actions>
                                                        <v-container>
                                                            <v-row justify="center">
                                                                <v-btn class="my-n8" color="blue white--text" @click="saveNewPemeriksa">Save</v-btn>
                                                            </v-row>
                                                        </v-container>
                                                    </v-card-actions>
                                                </v-card-text>
                                            </v-card>
                                        </v-dialog>
                                    </v-container>
                                    <v-col cols="12" class="my-n5">
                                        <v-textarea v-model="nomorStockOpname.keterangan" dense color="accent" outlined auto-grow="true" label="Keterangan"/>
                                    </v-col>
                                    <v-col cols="12" class="my-n4">
                                        <v-data-table
                                            :headers="newBarangStockOpnameHeader"
                                            :items="nomorStockOpname.barangs"
                                            :disable-sort="true"
                                            :disable-filtering="true"
                                            :mobile-breakpoint="1"
                                            :hide-default-footer="true"
                                        >

                                        </v-data-table>
                                        <v-container fluid class="my-n4 px-n4">
                                            <v-row justify="center">
                                                <v-col cols="6">
                                                    <v-text-field color="accent" id="focusGained" v-on:keyup.enter="addStockOpnameNewItem" outlined dense v-model="newBarang.id" label="ID Barang"/>
                                                </v-col>
                                                <v-col cols="6">
                                                    <v-text-field color="accent" v-on:keyup.enter="addStockOpnameNewItem" outlined dense v-model="newBarang.namaBarang" label="Nama Barang"/>
                                                </v-col>
                                            </v-row>
                                        </v-container>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        
            <!-- *************************************************************************************************************** -->
            <!-- List Nomor Stock Opname -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="nomorStockOpnameHeaders"
                :items="nomorStockOpnames"
                @click:row="details"
                :mobile-breakpoint="1"
                :disable-sort="true"
                :hide-default-footer="true"
                no-data-text="tidak ada Stock Opname Hari ini"
                no-results-text="Nomor Stock Opname tidak ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Details -->
            <!-- *************************************************************************************************************** -->
            <v-dialog v-model="popUpDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat> 
                        <span class="title font-weight-light">LAPORAN STOCK OPNAME</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-text>
                        <v-row>
                            <v-col cols="12" class="mb-n8 mt-n4">
                                <v-row justify="end">
                                    <v-col cols="2">
                                        <v-text-field v-model="nomorStockOpname.tanggalMulaiPeriksa" dense color="accent" filled disabled outlined label="Tanggal Mulai"/>
                                    </v-col>
                                    <v-col cols="2">
                                        <v-text-field v-model="nomorStockOpname.tanggalBerakhirPeriksa" dense color="accent" filled disabled outlined label="Tanggal Selesai"/>
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col cols="12" class="mt-n5">
                                <v-row justify="end">
                                    <v-col cols="4">
                                        <v-divider></v-divider>
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col cols="6" class="my-n5">
                                <v-text-field v-model="nomorStockOpname.nomor" dense color="accent" filled disabled outlined label="Nomor Stock Opname"/>
                            </v-col>
                            <v-col cols="4" class="my-n5" v-if="!popUpBreakPoint">
                                <v-text-field v-model="nomorStockOpname.hasilPeriksa" dense color="accent" outlined label="Hasil Periksa"/>
                            </v-col>
                            <v-col cols="6" class="my-n5" v-else>
                                <v-text-field v-model="nomorStockOpname.hasilPeriksa" dense color="accent" outlined label="Hasil Periksa"/>
                            </v-col>
                            <v-col cols="2" class="my-n5" v-if="!popUpBreakPoint">
                                <v-btn width="100%" outlined color="blue" @click="addNewPemeriksa = !addNewPemeriksa"><v-icon class="mr-3">mdi-account-group</v-icon>Daftarkan Pemeriksa</v-btn>
                            </v-col>
                            <v-col cols="12" class="mt-n5" v-else>
                                <v-btn width="100%" outlined color="blue" @click="addNewPemeriksa = !addNewPemeriksa"><v-icon class="mr-3">mdi-account-group</v-icon>Daftarkan Pemeriksa</v-btn>
                            </v-col>
                            <v-col cols="12" class="my-n5">
                                <v-textarea v-model="nomorStockOpname.keterangan" dense color="accent" filled disabled outlined auto-grow="true" label="Keterangan"/>
                            </v-col>
                            <v-col cols="12" class="my-n4">
                                <v-data-table
                                    :headers="detailBarangStockOpnameHeader"
                                    :items="listAllBarang"
                                    :disable-sort="true"
                                    :disable-filtering="true"
                                    :mobile-breakpoint="1"
                                    :hide-default-footer="true"
                                >

                                </v-data-table>
                            </v-col>
                        </v-row>
                    </v-card-text>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'StockOpname',

    data() {
        return {
            searchNomorStockOpname:'',
            // list all stock Opname
            nomorStockOpnames: [
                {nomor:'12345xe11',hasilPeriksa:'Proses',barangs:[{namaBarang:'a'}],barangsDone:[{namaBarang:'b'}]},
                {nomor:'12345xe11',hasilPeriksa:'Belum Diperiksa'},
                {nomor:'12345xe11',hasilPeriksa:'Selesai'}
            ],
            // Passing data to this object
            nomorStockOpname: {
                id:null,
                nomor:'',
                hasilPeriksa:'',
                keterangan:'',
                barangs:[],
                barangsDone:[],
                pemeriksa:[],
                tanggalMulaiPeriksa:'',
                tanggalBerakhirPeriksa:''
            },
            nomorStockOpnameDefault: {
                id:null,
                nomor:'',
                hasilPeriksa:'',
                keterangan:'',
                barangs:[],
                barangsDone:[],
                pemeriksa:[],
                tanggalMulaiPeriksa:'',
                tanggalBerakhirPeriksa:''
            },
            listAllBarang: [],
            // Details
            detailBarangStockOpnameHeader: [
                {text:'ID Barang', value:'id'},
                {text:'Nama Barang', value:'namaBarang'},
                {text:'Pemeriksa', value:'pemeriksa'},
                {text:'Tanggal Periksa', value:'tanggalPeriksa'}
            ],
            // New
            newBarangStockOpnameHeader: [
                {text:'ID Barang', value:'id'},
                {text:'Nama Barang', value:'namaBarang'},
            ],
            newBarang: {
                id:null,
                namaBarang:'',
                pemeriksa:'',
                tanggalPeriksa:''
            },
            newBarangDefault: {
                id:null,
                namaBarang:'',
                pemeriksa:'',
                tanggalPeriksa:''
            },
            listPemeriksaHeader: [
                {text:"ID", value:'id'},
                {text:'Nama', value:'nama'},
                {value:'actions'}
            ],
            newPemeriksa:{
                id:null,
                nama:''
            },
            newPemeriksaDefault:{
                id:null,
                nama:''
            },
            popUpDetails:false,
            popUpNewStockOpname: false,
            addNewPemeriksa: false,
            selectedIndex: -1
        }
    },

    methods: {
        details(item) {
            this.selectedIndex = this.nomorStockOpnames.indexOf(item)
            this.nomorStockOpname = Object.assign({},item)
            this.popUpDetails = true
            this.listAllBarang = [...this.nomorStockOpname.barangs,...this.nomorStockOpname.barangsDone]
        },

        close() {
            if(this.popUpDetails) {
                this.selectedIndex = -1
                this.nomorStockOpname = Object.assign({},this.nomorStockOpnameDefault)
                this.listAllBarang = []
                this.popUpDetails = false
            }
        },

        addStockOpnameNewItem() {
            this.nomorStockOpname.barangs.push(this.newBarang)
            this.newBarang = Object.assign({},this.newBarangDefault)
            document.getElementById("focusGained").focus()
        },
        pushNewPemeriksa() {
            this.nomorStockOpname.pemeriksa.push(this.newPemeriksa)
            document.getElementById("newPemeriksaFocusGained").focus()
            this.newPemeriksa = Object.assign({},this.newPemeriksaDefault)
        }
    },

    computed: {
        nomorStockOpnameHeaders() {
            return [
                {text:'Nomor',value:'nomor'},
                {text:'Hasil Periksa',value:'hasilPeriksa'}
            ]
        },
        stockOpnameHeaders() {
            return [
                {text:'Nama Barang',value:'namaBarang'},
                {text:'Pemeriksa',value:'pemeriksa'},
                {text:'Stock Asli',value:'stockAsli'},
                {text:'Stock Di Gudang',value:'stockDiGudang'}
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