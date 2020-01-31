<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Karyawan in karyawans Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Karyawan"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchKaryawan"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Karyawan -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark large color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n7">
                <v-dialog v-model="popUpNew" persistent max-width='1000px'>
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Karyawan</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12">
                                        <v-text-field label="ID" v-model="karyawan.id"/>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-text-field label="Nama" v-model="karyawan.nama" :rules="nameRules"/>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="mt-n5" color="blue darken-1" text @click="saveNewKaryawan">Ya</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- List Data Karyawan -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="karyawanHeaders"
                :items="karyawans"
                :search="searchKaryawan"
                @click:row="details"
                :disable-sort="true"
                :hide-default-footer="true"
                :mobile-breakpoint="1"
                item-key="nama"
                no-data-text="Data Karyawan Kosong"
                no-results-text="Data Karyawan Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{ item }">
                    <v-icon class="mr-2" @click.stop="editKaryawan(item)">mdi-pencil</v-icon>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Details Karyawan -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
            <v-dialog v-if="popUpBreakPoint" v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{karyawan}}
                </v-card>
            </v-dialog >
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else v-model="popupDetails" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{karyawan}}
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Edit Karyawan -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
            <v-dialog v-if="popUpBreakPoint" v-model="popUpEdit" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Edit Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field v-model="karyawan.nama" label="Nama" :rules="nameRules"/>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                <v-btn class="mt-n12" color="blue darken-1" text @click="confirmSave">Save</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else persistent v-model="popUpEdit" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Edit Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field v-model="karyawan.nama" label="Nama" :rules="nameRules"/>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                <v-btn class="mt-n12" color="blue darken-1" text @click="confirmSave">Save</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Confirm on Edit -->
            <!-- *************************************************************************************************************** -->
            <v-dialog persistent v-model="popUpConfirmSave" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin mengubah profil <b>{{tempNamaKaryawan}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="save">Ya</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Karyawan',

    data() {
        return {
            karyawans: [
                {id:1, nama:'Mahendra Fajar'},
                {id:2, nama:'Ananda Vijaya'},
                {id:3, nama:'Satria Kemal'},
            ],
            karyawan: {
                id:null,
                nama:''
            },
            karyawanDefault: {
                id:null,
                nama:''
            },
            tempNamaKaryawan:'',
            searchKaryawan:'',
            popUpNew: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSave: false,
            selectedIndex: -1,
            // -----
            // Rules
            // -----
            nameRules: [
                v => !!v || 'Name Is Required'
            ]
            // -----
            ,editedIndex: null       
        }
    },
    
    methods: {
        details(item) {
            this.selectedIndex = this.karyawans.indexOf(item)
            this.karyawan = Object.assign({},item)
            this.popupDetails = true
        },
        close() {
            if(this.popupDetails) {
                this.popupDetails = false
                this.karyawan = Object.assign({},this.karyawanDefault)
                this.selectedIndex = -1
            } else {
                if(this.popUpEdit) {
                    this.popUpEdit = false
                    this.karyawan = Object.assign({},this.karyawanDefault)
                    this.selectedIndex = -1
                } else {
                    if(this.popUpConfirmSave) {
                        this.popUpConfirmSave = false
                        this.popUpEdit = true
                    } else {
                        if(this.popUpNew) {
                            this.popUpNew = false
                            this.karyawan = Object.assign({},this.karyawanDefault)
                        }
                    }
                }
            }
        },
        saveNewKaryawan() {
            if(this.$refs.form.validate()) {
                this.karyawans.push(this.karyawan)
                this.karyawan = Object.assign({},this.karyawanDefault)
                this.close()
            }
        },
        editKaryawan(item) {
            this.selectedIndex = this.karyawans.indexOf(item)
            this.tempNamaKaryawan = item.nama
            this.karyawan = Object.assign({},item)
            this.popUpEdit = true
        },
        // Save Karyawan
        confirmSave() {
            if(this.$refs.form.validate()) {
                this.popUpEdit = false
                this.popUpConfirmSave = true
            }
        },

        //this need promise to ensure that the data in the db and vue in synced !!! IMPORTANT !!!
        save() {
            //to find the object inside karyawans
            let obj = this.karyawans.find( ({id}) => id === this.karyawan.id )
            //get all of the property name of karyawans
            var loop = Object.getOwnPropertyNames(this.karyawans[this.karyawans.indexOf(obj)])
            //get rid of the __ob__ property to ensure that the looping is safe and secure
            loop.splice(loop.indexOf('__ob__'),1)
            //assign all the value of the property of obj2 in karyawans with karyawan
            for(let i=0; i<loop.length; i++) {
                this.karyawans[this.karyawans.indexOf(obj)][loop[i]] = this.karyawan[loop[i]]
            }
            this.popUpConfirmSave = false
            this.karyawan = Object.assign({},this.karyawanDefault)
        }
    },

    computed: {
        karyawanHeaders() {
            return [
                {text:'Nama',value:'nama'},
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