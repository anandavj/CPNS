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
                                :disable-sort='true'
                                :hide-default-footer="true"
                                @click:row="details"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                            </v-data-table>
                        </div>
                        <!-- *************************************************************************************************************** -->
                        <!-- Add Barang -->
                        <!-- *************************************************************************************************************** -->
                        <v-btn fab dark large color="primary" fixed right bottom>
                            <v-icon dark>mdi-plus</v-icon>
                        </v-btn>
                        <!-- *************************************************************************************************************** -->
                        <!-- *************************************************************************************************************** -->
                    
                        <!-- *************************************************************************************************************** -->
                        <!-- Details Karyawan -->
                        <!-- *************************************************************************************************************** -->
                        <!-- Phone / other xs sm device will display fullscreen dialog -->
                        <v-dialog v-if="popUpBreakPoint" v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                            <v-card>
                                <v-toolbar dense flat>
                                    <span class="title font-weight-light">Surat Jalan</span>
                                    <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                {{surat}}
                            </v-card>
                        </v-dialog >
                        <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
                        <v-dialog v-else v-model="popupDetails" width="1000px">
                            <v-card>
                                <v-toolbar dense flat>
                                    <span class="title font-weight-light">Surat Jalan</span>
                                    <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                {{surat}}
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
            suratJalans: [
                {nomor:'XxxxX',tanggal:'20 Januari 2020',status:'Pengiriman'}
            ],
            deliveryOrders: [
                {nomor:'XxxxX',tanggal:'20 Januari 2020',status:'Selesai'}
            ],
            surat: {
                nomor:'',
                tanggal:'',
                status:''
            },
            tab:'',
            searchSuratJalan:'',
            searchDeliveryOrder:'',
            popUpNew: false,
            popupDetails: false,
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
        }
    },

    computed: {
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