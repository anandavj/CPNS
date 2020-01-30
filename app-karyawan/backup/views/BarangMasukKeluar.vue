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
                    <v-tab href="#DOMasuk">
                        <span class="caption">Delivery Order Masuk</span>
                        <v-icon>mdi-arrow-down-bold</v-icon>
                    </v-tab>
                    <v-tab href="#DOKeluar">
                        <span class="caption">Delivery Order Keluar</span>
                        <v-icon>mdi-arrow-up-bold</v-icon>
                    </v-tab>
                </v-tabs>
                <v-tabs-items v-model="tab">
                    <!-- *************************************************************************************************************** -->
                    <!-- Barang Masuk -->
                    <!-- *************************************************************************************************************** -->
                    <v-tab-item value="DOMasuk">
                        <!-- Add Button -->
                        <v-container>
                            <v-dialog v-model="popUpNewIn" persistent max-width='600px'>
                                <template v-slot:activator="{ on }">
                                    <!-- Add Button Ketika Belom ada list -->
                                    <v-row justify="center" v-if="barangs.length == 0">
                                        <v-col lg="11">
                                            <v-card outlined v-on="on" color="light-green" class="text-center">
                                                <v-card-text class="white--text"><v-icon class="white--text">mdi-plus</v-icon>Tambah</v-card-text>
                                            </v-card>
                                        </v-col>
                                    </v-row>
                                    <!-- Add Button Ketika Sudah ada list -->
                                    <v-row justify="end" v-else>
                                        <v-col cols="5" lg="2">
                                            <v-btn block v-on="on" color="light-blue" class="white--text">
                                                <v-icon>mdi-plus</v-icon>Tambah
                                            </v-btn>
                                        </v-col>
                                    </v-row>
                                </template>
                                <!-- Dialog Screen -->
                                <v-card>
                                    <v-toolbar dense flat>
                                        <span class="title font-weight-light">Tambah Barang</span>
                                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                    </v-toolbar>
                                    <v-form ref="form">
                                        <v-card-text>
                                            <v-form ref="form">
                                                <v-row>
                                                    <v-col cols="12">
                                                        <v-text-field v-model="barang.nama" label="Nama Barang"/>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-text-field v-if="barang.status" v-model="barang.status" label="Status" disabled/>
                                                        <v-text-field v-else label="Status" disabled value="Masuk" outlined></v-text-field>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-text-field v-model="barang.jumlah" label="Jumlah"/>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-textarea v-model="barang.keterangan" outlined label="Keterangan"/>
                                                    </v-col>
                                                </v-row>
                                            </v-form>
                                        </v-card-text>
                                    </v-form>
                                    <v-card-actions>
                                        <v-container>
                                            <v-row justify="center">
                                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                                <v-btn class="mt-n12" color="blue darken-1" text @click="saveNewBarang">Save</v-btn>
                                            </v-row>
                                        </v-container>
                                    </v-card-actions>
                                </v-card>
                            </v-dialog>
                            <v-data-table v-if="barangs.length > 0"
                                :headers="headers"
                                :items="barangs"
                                :disable-sort="true"
                                :hide-default-footer="true"
                                :disable-filtering="true"
                            >
                            </v-data-table>
                        </v-container>
                    </v-tab-item>
                    <!-- *************************************************************************************************************** -->
                    <!-- *************************************************************************************************************** -->

                    <!-- *************************************************************************************************************** -->
                    <!-- Barang Keluar -->
                    <!-- *************************************************************************************************************** -->
                    <v-tab-item value="DOKeluar">
                        <v-container>
                            <v-dialog v-model="popUpNewOut" persistent max-width='600px'>
                                <template v-slot:activator="{ on }">
                                    <!-- Add Button Ketika Belom ada list -->
                                    <v-row justify="center" v-if="barangs.length == 0">
                                        <v-col lg="11">
                                            <v-card outlined v-on="on" color="light-green" class="text-center">
                                                <v-card-text class="white--text"><v-icon class="white--text">mdi-plus</v-icon>Tambah</v-card-text>
                                            </v-card>
                                        </v-col>
                                    </v-row>
                                    <!-- Add Button Ketika Sudah ada list -->
                                    <v-row justify="end" v-else>
                                        <v-col cols="5" lg="2">
                                            <v-btn block v-on="on" color="light-blue" class="white--text">
                                                <v-icon>mdi-plus</v-icon>Tambah
                                            </v-btn>
                                        </v-col>
                                    </v-row>
                                </template>
                                <!-- Dialog Screen -->
                                <v-card>
                                    <v-card-title>Tambah List</v-card-title>
                                    <v-card-text>
                                        <v-row>
                                            <v-col cols="12">
                                                <v-text-field v-model="barang.nama" label="Nama Barang"/>
                                            </v-col>
                                            <v-col cols="12">
                                                <v-text-field v-model="barang.status" label="Status" disabled>Masuk</v-text-field>
                                            </v-col>
                                            <v-col cols="12">
                                                <v-text-field v-model="barang.jumlah" label="Jumlah"/>
                                            </v-col>
                                            <v-col cols="12">
                                                <v-textarea v-model="barang.keterangan" outlined label="Keterangan"/>
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                    <v-card-actions>
                                        <v-row justify="center">
                                            <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                            <v-btn class="mt-n12" color="blue darken-1" text @click="save">Save</v-btn>
                                        </v-row>
                                    </v-card-actions>
                                </v-card>
                            </v-dialog>
                        </v-container>
                    </v-tab-item>
                    <!-- *************************************************************************************************************** -->
                    <!-- *************************************************************************************************************** -->

                    <v-container v-if="barangs.length > 0">
                        <v-row justify="end">
                            <v-col md="4" lg="2">
                                <v-btn block outlined color="red">Cancel</v-btn>
                            </v-col>
                            <v-col md="4" lg="2">
                                <v-btn block color="light-green" dark>Save</v-btn>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-tabs-items>
            </v-card>
        </div>
        
        <v-dialog v-model="popUpConfirmSave" persistent max-width='350px'>
            <v-card>
                <v-card-title>Confirmation</v-card-title>
                <v-card-text>Apakah Anda Yakin Ingin Menghapus List Ini?</v-card-text>
                <v-card-actions>
                    <v-container>
                        <v-row justify="center">
                            <v-btn class="mt-n5" color="red darken-1" text @click="cancel">Tidak</v-btn>
                            <v-btn class="mt-n5" color="blue darken-1" text @click="deleteItem">Ya</v-btn>
                        </v-row>
                    </v-container>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-app>
</template>

<script>
export default {
    name:'BarangMasukKeluar',
    data() {
        return {
            headers: [
                {text:'Nama',   value:'nama', width: '60%'},
                {text:'Status', value:'status'},
                {text:'Jumlah', value:'jumlah'},
                {text:'',       value:'actions', width: '10%'}
            ],
            barangs: [],
            barang: {
                nama:'',
                status:'',
                jumlah:'',
                keterangan:''
            },
            barangDefault: {
                nama:'',
                status:'',
                jumlah:'',
                keterangan:''
            },
            tab: null,
            popUpNewIn: false,
            popUpNewOut: false,
            popUpConfirmSave: false,
            selectedIndex: -1
        }
    },
    methods: {
        saveNewBarang() {
            if(this.$refs.form.validate()) {
                this.barangs.push(this.barang)
                this.barang = Object.assign({},this.barangDefault)
                this.close()
            }
        },
        close() {
            if(this.popUpNewIn) {
                this.popUpNewIn = false
                this.barang = Object.assign({},this.barangDefault)
            }
        },
        cancel() {
            
        },
        editItem(/*item*/) {
            
        },
        confirmDelete(/*item*/) {
            
        },
        deleteItem() {
            
        }
    }
}
</script>

<style>
    .v-slide-group__prev {
        display: none !important;
    }
</style>>
