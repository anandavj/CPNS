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
                        <!-- Search Surat Jalan -->
                        <v-text-field
                            placeholder="Cari Nomor Surat Jalan"
                            :solo="true"
                            :clearable="true"
                            append-icon="mdi-magnify"
                            v-model="searchSuratJalan"
                        />
                        <!-- List Surat Jalan -->
                            <!-- mobile phone -->
                        <div v-if="popUpBreakPoint">

                        </div>
                            <!--  -->
                            <!-- PC / laptop -->
                        <div v-else>
                            <v-data-table
                                :headers="listSuratJalanHeader"
                                :items="listSuratJalans"
                                :search="searchSuratJalan"
                                :hide-default-footer="true"
                                @click:row="detailSuratJalan"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                            </v-data-table>
                        </div>
                        <!--  -->
                        <!-- Pop Up Detail Surat -->
                            <!-- mobile phone -->
                            <!--  -->
                            <!-- PC / Laptop -->
                        <v-dialog v-model="popUpDetailSuratJalan" fullscreen hide-overlay transition="dialog-bottom-transition">
                            <v-card>
                                <v-toolbar dense flat>
                                    <span class="title font-weight-light">Detail Surat Jalan</span>
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
                                                <v-text-field v-model="surat.namaPenerima" dense color="accent" outlined filled disabled label="Nama Penerima"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5">
                                                <v-text-field v-model="surat.nomor" dense color="accent" outlined filled disabled label="Nomor Surat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5">
                                                <v-text-field v-model="surat.alamat" dense color="accent" outlined filled disabled label="Alamat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5">
                                                <v-text-field v-model="surat.nama" dense color="accent" outlined filled disabled label="Nama Surat"/>
                                            </v-col>
                                            <v-col cols="12" class="my-n5">
                                                <v-textarea v-model="surat.keterangan" outlined filled disabled auto-grow="true" no-resize="true" label="Keterangan"/>
                                            </v-col>
                                            <v-col cols="12" class="mb-n5 mt-n3">
                                                <v-divider></v-divider>
                                            </v-col>
                                            <v-col cols="12">
                                                <v-row justify="center" class="headline">
                                                    Daftar Barang
                                                </v-row>
                                            </v-col>
                                            <v-col cols="12" class="my-n4">
                                                <v-data-table
                                                    :headers="suratJalanNewHeader"
                                                    :items="surat.barangs"
                                                    :hide-default-footer="true"
                                                    :disable-filtering="true"
                                                    :disable-pagination="true"
                                                    :disable-sort="true"
                                                    no-data-text=" "
                                                />
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-form>
                            </v-card>
                        </v-dialog>
                        <!--  -->
                        <!-- Add Surat Jalan -->
                        <v-btn fab dark large color="primary" fixed right bottom @click="popUpNewSuratJalan = !popUpNewSuratJalan">
                            <v-icon>mdi-plus</v-icon>
                        </v-btn>
                        <v-container class="my-n3">
                            <v-dialog v-model="popUpNewSuratJalan" persistent fullscreen hide-overlay transition="dialog-bottom-transition">
                                <v-card>
                                    <v-toolbar dense flat>
                                        <span class="title font-weight-light">Tambah Surah Jalan</span>
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
                                                    <v-text-field v-model="surat.namaPenerima" dense color="accent" outlined label="Nama Penerima"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5">
                                                    <v-text-field v-model="surat.nomor" dense color="accent" outlined label="Nomor Surat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5">
                                                    <v-text-field v-model="surat.alamat" dense color="accent" outlined label="Alamat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5">
                                                    <v-text-field v-model="surat.nama" dense color="accent" outlined label="Nama Surat"/>
                                                </v-col>
                                                <v-col cols="12" class="my-n5">
                                                    <v-textarea v-model="surat.keterangan" auto-grow="true" outlined label="Keterangan"/>
                                                </v-col>
                                                <v-col cols="12" class="mb-n5 mt-n3">
                                                    <v-divider></v-divider>
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-row justify="center" class="headline">
                                                        Daftar Barang
                                                    </v-row>
                                                </v-col>
                                                <v-col cols="12" class="my-n4">
                                                    <v-data-table
                                                        :headers="suratJalanNewHeader"
                                                        :items="surat.barangs"
                                                        :hide-default-footer="true"
                                                        :disable-filtering="true"
                                                        :disable-pagination="true"
                                                        :disable-sort="true"
                                                        no-data-text=" "
                                                    >
                                                        <template v-slot:item.actions="{ item }">
                                                            <v-icon class="mr-2" @click.stop="editSuratJalanNew(item)">mdi-pencil</v-icon>
                                                            <v-icon @click.stop="deleteSuratJalanNew(item)">mdi-delete</v-icon>
                                                        </template>
                                                    </v-data-table>
                                                    <v-container fluid class="my-n4 px-n4">
                                                        <v-row justify="center">
                                                            <v-col cols="3">
                                                                <v-text-field color="accent" id="focusGained" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.id" label="ID Barang"/>
                                                            </v-col>
                                                            <v-col cols="6">
                                                                <v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.nama" label="Nama Barang"/>
                                                            </v-col>
                                                            <v-col cols="2">
                                                                <v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.jumlah" label="Jumlah"/>
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
                    </v-tab-item>
                    <!-- *************************************************************************************************************** -->
                    <!-- *************************************************************************************************************** -->
                    
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
            tab:'',
            /* -------------------- SURAT JALAN -------------------- */
            // List & Details
            // listSuratJalanHeader on computed
            searchSuratJalan:'',
            listSuratJalans:[
                {
                    id:1,
                    nomor:'xxx',
                    nama:'Pemesanana dari x untuk y',
                    tanggal:'20 Januari 2020',
                    namaPenerima:'Yoga',
                    alamat:'Yogya',
                    barangs:[],
                    status:'Dikirim',
                    keterangan:''
                }
            ],
            surat: {
                id:null,
                nomor:'',
                nama:'',
                tanggal:'',
                namaPenerima:'',
                alamat:'',
                barangs:[],
                status:'',
                keterangan:''
            },
            suratDefault: {
                id:null,
                nomor:'',
                nama:'',
                tanggal:'',
                namaPenerima:'',
                alamat:'',
                barangs:[],
                status:'',
                keterangan:''
            },
            suratJalanNewHeader: [
                {text:'ID Barang', value:'id'},
                {text:'Nama Barang', value:'namaBarang'},
                {text:'Jumlah', value:'jumlah'},
                {value:'actions'}
            ],
            // object of Item in surat jalan before pushing it into surat.barangs
            suratJalanNewItem: {
                id:'',
                nama:'',
                jumlah:null
            },
            suratJalanNewItemDefault: {
                id:'',
                nama:'',
                jumlah:null
            },
            selectedItemsForSuratJalan:'',
            selectedIndexSuratJalan:-1,
            // PopUp Var
            popUpNewSuratJalan: false,
            popUpDetailSuratJalan: false,
            /* --------------------             -------------------- */
            /* -------------------- DO -------------------- */
            /* --------------------    -------------------- */
        }
    },
    methods: {
        /* -------------------- SURAT JALAN -------------------- */
        detailSuratJalan(item) {
            this.selectedIndexSuratJalan = this.listSuratJalans.indexOf(item)
            this.surat = Object.assign({},item)
            this.popUpDetailSuratJalan = true
        },
        close() {
            // Surat Jalan
            if(this.popUpNewSuratJalan) {
                this.popUpNewSuratJalan = false
                this.suratJalanNewItem = Object.assign({},this.suratJalanNewItemDefault)
                this.surat = Object.assign({},this.suratDefault)
            } else {
                if(this.popUpDetailSuratJalan) {
                    this.popUpDetailSuratJalan = false
                    this.surat = Object.assign({},this.suratDefault)
                }
            }
        },
        addSuratJalanNewItem() {
            this.surat.barangs.push(this.suratJalanNewItem)
            this.suratJalanNewItem = Object.assign({},this.suratJalanNewItemDefault)
            document.getElementById("focusGained").focus()
        },
        // Detail Surat Jalan
        /* --------------------             -------------------- */
        /* -------------------- DO -------------------- */
        /* --------------------    -------------------- */
    },

    computed: {
        listSuratJalanHeader() {
            return [
                {text:'Delivery Order', value:'nomor'},
                {text:'Tanggal', value:'tanggal',filter: () => true},
                {text:'Nama', value:'nama'},
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