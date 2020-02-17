<template>
    <v-app>
        <div class="mx-n4 my-n4 mx-md-n10 my-md-n11">
            <v-card tile elevation="0">
                <v-tabs
                v-model="tab"
                icons-and-text
                grow
                >
                <v-tabs-slider></v-tabs-slider>
                    <v-tab href="#SuratJalan">
                        <span class="caption">Surat Jalan</span>
                        <v-icon>mdi-arrow-up-bold</v-icon>
                    </v-tab>
                    <v-tab href="#DO">
                        <span class="caption">Delivery Order</span>
                        <v-icon>mdi-arrow-down-bold</v-icon>
                    </v-tab>
                </v-tabs>
                <v-tabs-items v-model="tab">
                    <!-- *************************************************************************************************************** -->
                    <!-- Surat Jalan -->
                    <!-- *************************************************************************************************************** -->
                    <v-tab-item value="SuratJalan" class="mx-4 my-4 mx-md-10">
                        <v-text-field
                            placeholder="Cari Nomor Surat Jalan"
                            :solo="true"
                            :clearable="true"
                            append-icon="mdi-magnify"
                            v-model="searchSuratJalan"
                        />
                        <div v-if="popUpBreakPoint">
                            <v-data-table
                                :headers="suratJalanHeaders"
                                :items="suratJalans"
                                :search="searchSuratJalan"
                                :disable-sort='true'
                                :hide-default-footer="true"
                                    class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                            <template v-slot:item.actions="{ item }" v-if="popUpBreakPoint">
                                <template>
                                    <v-btn @click="details(item)" width="130px" color="light-blue" dark>Detail</v-btn>
                                </template>
                            </template>
                            </v-data-table>
                        </div>
                        <div v-else>
                            <v-data-table
                                :headers="suratJalanHeaders"
                                :items="suratJalans"
                                :search="searchSuratJalan"
                                :hide-default-footer="true"
                                @click:row="details"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                            </v-data-table>
                        </div>
                        <!-- *************************************************************************************************************** -->
                        <!-- Add Surat Jalan -->
                        <!-- *************************************************************************************************************** -->
                        <v-btn fab dark large color="primary" fixed right bottom @click="popUpNewSuratJalan = !popUpNewSuratJalan">
                            <v-icon dark>mdi-plus</v-icon>
                        </v-btn>
                        <v-container class="my-n3">
                            <v-dialog v-model="popUpNewSuratJalan" persistent fullscreen hide-overlay transition="dialog-bottom-transition">
                                <v-card>
                                    <v-toolbar dense flat>
                                        <span class="title font-weight-light">Tambah Surat Jalan</span>
                                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                    </v-toolbar>
                                    <v-form ref="form" class="px-2">
                                        <v-card-text>
                                            <v-row>
                                                <v-col cols="12" class="my-n8">
                                                    <v-row justify="end">
                                                        <v-col cols="3">
                                                            <v-text-field v-model="surat.tanggal" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                        </v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col cols="6" class="my-n5">
                                                    <v-text-field v-model="surat.nomor" dense color="accent" outlined label="Nomor Surat Jalan"></v-text-field>
                                                </v-col>
                                                <v-col cols="6" class="my-n5">
                                                    <v-text-field v-model="surat.nama" dense color="accent" outlined label="Nama Surat Jalan"></v-text-field>
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-row justify="center" class="headline">
                                                        Daftar Barang
                                                    </v-row>
                                                </v-col>
                                                <v-col cols="12" class="my-n4">
                                                    <v-data-table
                                                        :headers="suratJalanNewHeaders"
                                                        :items="suratJalanNewItems"
                                                        :hide-default-footer="true"
                                                        :disable-filtering="true"
                                                        :disable-pagination="true"
                                                        :disable-sort="true"
                                                        no-data-text=" "
                                                    ></v-data-table>
                                                    <v-container fluid class="my-n4 px-n4">
                                                        <v-row justify="center">
                                                            <v-col cols="3">
                                                                <v-text-field id="focusGain" v-on:keyup.enter="addSuratJalanNewItem" outlined v-model="suratJalanNewItem.id" color="accent" dense label="ID Barang"/>
                                                            </v-col>
                                                            <v-col cols="6">
                                                                <v-text-field v-on:keyup.enter="addSuratJalanNewItem" outlined v-model="suratJalanNewItem.nama" color="accent" dense label="Nama Barang"/>
                                                            </v-col>
                                                            <v-col cols="2">
                                                                <v-text-field v-on:keyup.enter="addSuratJalanNewItem" outlined v-model="suratJalanNewItem.jumlah" color="accent" dense label="Jumlah"/>
                                                            </v-col>
                                                            <v-col cols="1">
                                                                <v-btn color="green" dark @click="addSuratJalanNewItem"><v-icon>mdi-plus</v-icon></v-btn>
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
                        <!-- Details Surat Jalan -->
                        <!-- *************************************************************************************************************** -->
                        <v-dialog v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                            <v-card>
                                <v-toolbar dense flat>
                                    <span class="title font-weight-light">Surat Jalan</span>
                                    <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                <v-container>
                                    <v-card outlined>
                                        <v-container>
                                            <v-row justify="center">
                                                <v-card-title text-center class="headline">
                                                    <b>BUANA PAKSA INDONESIA</b>
                                                </v-card-title>
                                            </v-row>
                                            <v-row justify="center" class="mt-n5 mb-n2">
                                                <v-card-subtitle class="text-center">
                                                    Jl. Sriwidodo Utara VII No. 476 Kel. Purwoyoso Kec. Ngaliyan Belakang<br>
                                                    Kawasan Industri Candi Krapyak - Semarang Jawa Tengah<br>
                                                    Telp (024) 7626249 / Fax (024) 7610394 / Website: www.buanapaksa.com / Email: info@buanapaksa.com 
                                                </v-card-subtitle>
                                            </v-row>
                                            <!-- Proses Button -->
                                            <v-row justify="end" v-if="!this.popUpBreakPoint">
                                                <v-col cols="5" lg="2">
                                                    <v-btn block v-on="on" color="light-green" class="white--text" @click="prosesBarangDialog">
                                                        <v-icon>mdi-refresh</v-icon>Proses
                                                    </v-btn>
                                                </v-col>
                                            </v-row>
                                            <v-row justify="center" v-else>
                                                <v-col cols="5" lg="2">
                                                    <v-btn block v-on="on" color="light-green" class="white--text" @click="prosesBarangDialog">
                                                        <v-icon>mdi-refresh</v-icon>Proses
                                                    </v-btn>
                                                </v-col>
                                            </v-row>
                                            <v-divider></v-divider>
                                            <v-row justify="center">
                                                <v-col cols="6">
                                                    <table>
                                                        <tr>
                                                            <td><b>Kepada</b></td>
                                                            <td>:</td>
                                                            <td>ROIS</td>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Alamat</b></td>
                                                            <td>:</td>
                                                            <td>Jogja</td>
                                                        </tr>
                                                    </table>
                                                </v-col>
                                                <v-col cols="6">
                                                    <table class="float-right">
                                                        <tr>
                                                            <td style="text-align: left"><b>Tgl. Inv</b></td>
                                                            <td>:</td>
                                                            <td>29/01/2020</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left"><b>No. HP</b></td>
                                                            <td>:</td>
                                                            <td>0813-6038-0877</td>
                                                        </tr>
                                                    </table>
                                                </v-col>
                                            </v-row>
                                            <v-row justify="center">
                                                <v-col cols="12">
                                                    <v-data-table
                                                    :headers="suratJalanDetailHeaders"
                                                    :items="suratJalanDetail"
                                                    :disable-filtering="true"
                                                    :disable-sort="true"
                                                    :hide-default-footer="true"
                                                    no-data-text="Tidak ada Barang yang Terdaftar"
                                                    class="font-regular font-weight-light"
                                                >
                                                </v-data-table>
                                                </v-col>
                                            </v-row>
                                        </v-container>
                                    </v-card>
                                </v-container>
                            </v-card>
                        </v-dialog>
                        <!-- *************************************************************************************************************** -->
                        <!-- *************************************************************************************************************** -->

                        <!-- *************************************************************************************************************** -->
                        <!-- Proses Dialog -->
                        <!-- *************************************************************************************************************** -->
                        <v-dialog v-model="popUpProses" fullscreen hide-overlay transition="dialog-bottom-transition">
                            <v-card>
                                <v-toolbar dense flat>
                                    <span class="title font-weight-light">Proses Surat Jalan</span>
                                    <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                <v-card-text>
                                    <v-data-table
                                        :headers="barangProsesHeaders"
                                        :items="suratJalanDetail"
                                        v-model="barangsSelected"
                                        :show-select="true"
                                        :disable-sort="true"
                                        :disable-filtering="true"
                                        :mobile-breakpoint="1"
                                        :hide-default-footer="true"
                                        :items-per-page=9999
                                    >
                                    </v-data-table>
                                </v-card-text>
                                <v-card-actions>
                                    <v-container>
                                        <v-row justify="center">
                                            <v-btn color="red darken-1" text @click="close">Close</v-btn>
                                            <v-btn color="blue darken-1" text @click="close">Save</v-btn>
                                        </v-row>
                                    </v-container>
                                </v-card-actions>
                            </v-card>
                        </v-dialog>
                        <!-- *************************************************************************************************************** -->
                        <!-- *************************************************************************************************************** -->


                    </v-tab-item>
                    <!-- *************************************************************************************************************** -->
                    <!-- *************************************************************************************************************** -->

                    <!-- *************************************************************************************************************** -->
                    <!-- Delivery Order -->
                    <!-- *************************************************************************************************************** -->
                    <v-tab-item value="DO" class="mx-4 my-4 mx-md-10">

                    </v-tab-item>
                </v-tabs-items>
            </v-card>
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'SuratJalan',
    data() {
        return {
            suratJalanDetailHeaders: [
                {text:'Nama Barang', value:'namaBarang'},
                {text:'Qty', value:'quantity'},
                {text:'Satuan', value:'satuan'},
                {text:'Keterangan', value:'keterangan'}
            ],
            suratJalans: [
                {nomor:'XxxxX',tanggal:'20 Januari 2020',status:'Pengiriman'}
            ],
            suratJalanNewHeaders: [
                {text:'ID barang', value:'id'},
                {text:'Nama Barang', value:'nama'},
                {text:'Jumlah', value:'jumlah'},
                {text:'', value:'actions'}
            ],
            suratJalanNewItems: [],
            suratJalanNewItem: {
                id:'',
                nama:'',
                jumlah:''
            },
            suratJalanNewItemDefault: {
                id:'',
                nama:'',
                jumlah:''
            },
            deliveryOrders: [
                {nomor:'XxxxX',tanggal:'20 Januari 2020',status:'Selesai'}
            ],
            barangsSelected: [],
            surat: {
                nomor:'',
                nama:'',
                tanggal:'',
                barang:'',
                status:'',
                keterangan:''
            },
            suratDefault: {
                nomor:'',
                nama:'',
                tanggal:'',
                barang:'',
                status:'',
                keterangan:''
            },
            deskripsi: '',
            tab:'',
            searchSuratJalan:'',
            searchDeliveryOrder:'',
            popUpNewSuratJalan: false,
            popupDetails: false,
            popUpProses: false,
            selectedIndex: null
        }
    },

    methods: {
        details(item) {
            if(this.tab == 'suratJalans') {
                this.selectedIndex = this.suratJalans.indexOf(item)
            } else {
                this.selectedIndex = this.deliveryOrders.indexOf(item)
            }
            this.surat = Object.assign({},item)
            this.popupDetails = true
        },
        close() {
            if(this.popupDetails) {
                this.selectedIndex = null
                this.surat = Object.assign({},this.suratDefault)
                this.popupDetails = false
            } else {
                if(this.popUpProses) {
                    this.selectedIndex = null
                    this.surat = Object.assign({},this.suratDefault)
                    this.popUpProses = false
                } else {
                    if(this.popUpNewSuratJalan) {
                        this.popUpNewSuratJalan = false
                        this.surat = Object.assign({},this.suratDefault)
                    }
                }
            }
        },
        prosesBarangDialog() {
            this.popupDetails = false
            this.popUpProses = true
        },
        addSuratJalanNewItem() {
            this.suratJalanNewItems.push(this.suratJalanNewItem)
            this.suratJalanNewItem = Object.assign({},this.suratJalanNewItemDefault)
            document.getElementById('focusGain').focus()
        }
    },

    computed: {
        barangProsesHeaders() {
            return [
                {text:'ID', value:'id'},
                {text:'Nama Barang', value:'namaBarang'},
                {text:'Jumlah', value:'jumlah'}
            ]
        },
        suratJalanHeaders() {
            return [
                {text:'Surat Jalan', value:'nomor'},
                {text:'Tanggal', value:'tanggal',filter: () => true},
                {text:'Keterangan', value:'keterangan',filter: () => true},
                {text:'Status', value:'status',filter: () => true},
                {text:'', value:'actions',width:'10%',filter: () => true}
            ]
        },
        deliveryOrderHeaders() {
            return [
                {text:'Delivery Order', value:'nomor'},
                {text:'Tanggal', value:'tanggal',filter: () => true},
                {text:'Keterangan', value:'keterangan',filter: () => true},
                {text:'Status', value:'status',filter: () => true},
                {text:'', value:'actions',width:'10%',filter: () => true}
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