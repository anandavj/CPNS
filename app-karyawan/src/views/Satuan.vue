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
                                <v-text-field color="accent" v-model="satuan.name" label="Nama Unit"/>
                                <v-text-field color="accent" v-model="satuan.singkatan" label="Singkatan"/>
                                <v-text-field color="accent" v-model="satuan.jenis" label="Jenis Satuan"/>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                    <v-btn class="my-n9" color="blue darken-1" text @click="saveNewSatuan">Save</v-btn>
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
                :items="satuans"
                :search="searchSatuan"
                :disable-sort="true"
                :hide-default-footer="true"
                :mobile-breakpoint="1"
                no-data-text="Belum ada Satuan yang Terdaftar"
                no-results-text="Satuan Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{item}">
                    <v-icon class="mr-2" @click.stop="editSatuan(item)">mdi-pencil</v-icon>
                    <v-icon @click.stop="deleteSatuan(item)">mdi-delete</v-icon>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        </div>
    </v-app>
</template>

<script>
export default {
    name:'Satuan',

    data() {
        return {
            satuan: {
                name:'',
                singkatan:'',
                jenis:''  
            },
            satuanDefault: {
                name:'',
                singkatan:'',
                jenis:''
            },
            searchSatuan: '',
            popUpNew: false
        }
    },
    methods: {
        close() {
            if(this.popUpNew) {
                this.popUpNew = false
                this.satuan = Object.assign({},this.satuanDefault)
            } 
        }
    },

    computed: {
        satuansHeader() {
            return [
                {text:'Nama', value:'name'},
                {text:'Singkatan', value:'singkatan'},
                {text:'Jenis', value:'jenis'}
            ]
        }
    }
}
</script>