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
            <v-btn fab dark large color="primary" fixed right bottom>
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
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
                        <span class="title font-weight-light">Details</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-container class="mt-n6">
                        <v-row justify="center">
                            <v-card-title text-center class="headline">
                                LAPORAN STOCK OPNAME
                            </v-card-title>
                        </v-row>
                        <v-row justify="center" class="mt-n4">
                            <v-card-subtitle>No: 12345xe11</v-card-subtitle>
                        </v-row>
                        <v-row class="mt-n2" justify="center">
                            <v-col cols="5">
                                <table>
                                    <tr>
                                        <td><b>Jumlah Barang</b></td>
                                        <td>:</td>
                                        <td class="float-right">120</td>
                                        <td>Barang</td>
                                    </tr>
                                    <tr>
                                        <td><b>Barang Selisih</b></td>
                                        <td>:</td>
                                        <td class="float-right">0</td>
                                        <td>Barang</td>
                                    </tr>
                                </table>
                            </v-col>
                            <v-col cols="5">
                                <table class="float-right">
                                    <tr>
                                        <td><b>Tanggal Periksa</b></td>
                                        <td>:</td>
                                        <td>20-01-2020 s/d 23-01-2020</td>
                                    </tr>
                                </table>
                            </v-col>
                        </v-row>
                        <v-row justify="center">
                            <v-col cols="10">
                                <v-data-table
                                    :headers="stockOpnameHeaders"
                                    :items="stockOpnames"
                                    :disable-sort="true"
                                    :hide-default-footer="true"
                                    class="font-regular font-weight-light"
                                    style="cursor:pointer"
                                >
                                </v-data-table>
                            </v-col>
                        </v-row>
                    </v-container>
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
            nomorStockOpnames: [
                {nomor:'12345xe11',hasilPeriksa:'Proses'},
                {nomor:'12345xe11',hasilPeriksa:'Belum Diperiksa'},
                {nomor:'12345xe11',hasilPeriksa:'Selesai'}
            ],
            stockOpnames: [],
            searchNomorStockOpname:'',
            popUpDetails:false
        }
    },

    methods: {
        details() {
            this.popUpDetails = !this.popUpDetails
        },

        close() {
            this.details()
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