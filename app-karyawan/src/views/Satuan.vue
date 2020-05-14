<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Satuan in Satuans Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Satuan"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchSatuan"
                
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Satuan -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark lare color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n7">
                <v-dialog v-model="popUpNew" persistent max-width="500px">
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Satuan</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-text-field color="accent" :rules="rules.newUnit" v-model="satuan.name" label="Nama Unit"/>
                                <v-text-field color="accent" v-model="satuan.abbreviation" label="Singkatan"/>
                                <v-text-field color="accent" v-model="satuan.description" label="Jenis Satuan"/>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                    <v-btn class="my-n9" color="blue darken-1" text @click="saveNewUnit">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
                <v-dialog v-model="popUpEdit" persistent max-width="500px">
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Edit Satuan</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-text-field color="accent" :rules="rules.newUnit" v-model="satuan.name" label="Nama Unit"/>
                                <v-text-field color="accent" v-model="satuan.abbreviation" label="Singkatan"/>
                                <v-text-field color="accent" v-model="satuan.description" label="Jenis Satuan"/>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                    <v-btn class="my-n9" color="blue darken-1" text @click="editUnit">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
                <v-dialog v-model="popUpDelete" max-width="600">
                    <v-card>
                    <v-card-title>Confirmation</v-card-title>
                        <v-card-text>Apakah Anda Yakin Ingin Menghapus {{satuan.name}}?</v-card-text>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="mt-n5" color="blue darken-1" text @click="confirmDelete">Ya</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- List Satuan -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="satuansHeader"
                :items="units"
                :search="searchSatuan"
                :disable-sort="true"
                :mobile-breakpoint="1"
                no-data-text="Belum ada Satuan yang Terdaftar"
                no-results-text="Satuan Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{item}">
                    <v-icon class="mr-2" @click.stop="edit(item)">mdi-pencil</v-icon>
                    <v-icon @click.stop="deleteSatuan(item)">mdi-delete</v-icon>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
            <v-snackbar
                v-model="snackbar"
                multi-line
                v-bind:color="snackbarColor"
            >
                {{ snackbarMessage }}
                <v-btn
                    text
                    @click="snackbar = false"
                >
                    <v-icon>
                        mdi-close
                    </v-icon>
                </v-btn>
            </v-snackbar>
        </div>
    </v-app>
</template>

<script>
import api from "@/api.js"
export default {
    name:'Satuan',
    mounted() {
        this.get()
    },
    data() {
        return {
            units: [],
            satuan: {
                id:null,
                name:'',
                abbreviation:'',
                description:''
            },
            satuanDefault: {
                id:null,
                name:'',
                abbreviation:'',
                description:''
            },
            selectedIndex: -1,
            searchSatuan: '',
            popUpNew: false,
            popUpEdit: false,
            popUpDelete: false,
            snackbar: false,
            snackbarMessage: '',
            snackbarColor: '',
            rules: {
                newUnit: [
                    v => !!v || 'Unit Tidak Valid'
                ],
            }
        }
    },
    methods: {
        close() {
            if(this.popUpNew) {
                this.popUpNew = false
                this.satuan = Object.assign({},this.satuanDefault)
            }  else {
                if(this.popUpEdit) {
                    this.popUpEdit = false
                    this.satuan = Object.assign({},this.satuanDefault)
                } else {
                    if(this.popUpDelete) {
                        this.popUpDelete = false
                        this.satuan = Object.assign({},this.satuanDefault)
                    }
                }
            }
        },
        edit(item) {
            this.selectedIndex = this.units.indexOf(item)
            this.satuan = Object.assign({},item)
            this.popUpEdit = true
        },
        deleteSatuan(item) {
            this.selectedIndex = this.units.indexOf(item)
            this.satuan = Object.assign({},item)
            this.popUpDelete = true
        },
        get() {
            api.getAllUnit()
                .then(units => {
                    this.units = units
                })
        },
        saveNewUnit() {
            if(this.$refs.form.validate()) {
                api.addUnit(this.satuan)
                    .then((response) => {
                        this.snackbarColor = 'success'
                        this.snackbarMessage = response
                    }) .catch(error => {
                        this.snackbarColor = 'error'
                        this.snackbarMessage = error
                    }) .finally(() => {
                        this.snackbar = true
                        api.getAllUnit()
                            .then((units) => {
                                this.units = units
                                this.close()
                            })
                    })
            }
        },
        editUnit() {
            if(this.$refs.form.validate()) {
                api.updateUnit(this.satuan)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllUnit()
                        .then((units) => {
                            this.units = units
                            this.close()
                        })
                })
            }
        },
        confirmDelete() {
            api.deleteUnit(this.satuan)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllUnit()
                        .then((units) => {
                            this.units = units
                            this.close()
                        })
                })
        }
    },

    computed: {
        satuansHeader() {
            return [
                {text:'Singkatan', value:'abbreviation'},
                {text:'', value:'actions'}
            ]
        }
    }
}
</script>