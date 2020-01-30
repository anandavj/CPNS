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
            <v-btn fab dark large color="primary" fixed right bottom>
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
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
            <!-- Edit Barang -->
            <!-- *************************************************************************************************************** -->

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
                {id:1, nama:'Paku', openPrice:5000, stock:100},
                {id:2, nama:'Kayu', openPrice:12000, stock:400},
                {id:3, nama:'Atap', openPrice:100000, stock:1100}
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
            searchBarang:'',
            popUpNew: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSave: false,
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
    },
    
    computed: {
        barangHeaders() {
            return [
                {text:'Nama', value:'nama'},
                {text:'Open Price', value:'openPrice'},
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