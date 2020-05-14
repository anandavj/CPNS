<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Barang in products Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Barang"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light mb-n4"
                v-model="search"
            />
            <div v-if="!popUpBreakPoint">
                <v-data-table
                    :headers="productsHeader"
                    :items="products"
                    :footer-props="{
                        'items-per-page-options': [10, 50, 100, -1]
                    }"
                    no-data-text="Data Barang Kosong"
                    :search="search"
                    no-results-text="Data Barang Tidak Ditemukan"
                    class="font-regular font-weight-light mb-12 pb-4"
                    style="cursor:pointer;"
                    @click:row="details"
                ></v-data-table>
            </div>
            <div v-else>    
                <v-data-table
                    :headers="productsHeader"
                    :items="products"
                    :footer-props="{
                        'items-per-page-options': [10, 50, 100, -1]
                    }"
                    no-data-text="Data Barang Kosong"
                    :search="search"
                    no-results-text="Data Barang Tidak Ditemukan"
                    class="font-regular font-weight-light mt-n4 mb-12 pb-4"
                    style="cursor:pointer; background-color: #F5F5F5"
                    @click:row="details"
                >
                    <template v-slot:item="{item}">
                        <v-card @click.stop="details(item)" class="mt-1 mb-3 mx-2 pa-2" color="white" outlined>
                            <v-card-title class="body-2 mt-n2">{{ item.name }}</v-card-title>
                        </v-card>
                    </template>
                </v-data-table>
            </div>
            <v-dialog v-model="popUpStockRecord" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Kartu Stock</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-text v-if="!popUpBreakPoint">
                        <v-data-table
                            :headers="kartuStockHeader"
                            :items="stockRecord"
                            :footer-props="{
                                'items-per-page-options': [10, 50, 100, -1]
                            }"
                            no-data-text="Data Barang Kosong"
                            class="font-regular font-weight-light mb-12 pb-4"
                            style="cursor:pointer;"
                        >
                            <template v-slot:item.order_date="{ item }">
                                <span>{{formatDateList(item.order_date)}}</span>
                            </template>
                            <template v-slot:item.order_status="{ item }">
                                <span v-if="item.order_status == 'Keluar'" class="red--text">Keluar</span>
                                <span v-if="item.order_status == 'Masuk'" class="green--text">Masuk</span>
                            </template>
                            <template v-slot:item.quantity="{ item }">
                                <span v-if="item.order_status == 'Keluar'">{{item.quantity_out}}</span>
                                <span v-if="item.order_status == 'Masuk'">{{item.quantity_in}}</span>
                            </template>
                        </v-data-table>
                    </v-card-text>
                    <v-card-text v-else>
                        <v-data-table
                            :headers="kartuStockHeader"
                            :items="stockRecord"
                            :footer-props="{
                                'items-per-page-options': [10, 50, 100, -1]
                            }"
                            no-data-text="Data Barang Kosong"
                            class="font-regular font-weight-light mb-12 pb-4"
                            style="cursor:pointer;"
                            :disable-sort="true"
                        >
                            <template v-slot:item="{ item }">
                                <v-card class="mt-1 mb-3 mx-2 pa-2" color="grey lighten-2" outlined>
                                    <div class="d-flex flex-no-wrap justify-space-between">
                                        <div>
                                            <v-card-title class="body-2">{{ item.order_number }}</v-card-title>
                                            <v-card-subtitle>{{ formatDateList(item.order_date) }}</v-card-subtitle>
                                        </div>
                                        <div>
                                            <v-card-title class="body-2">
                                                <span v-if="item.order_status == 'Keluar'" class="red--text">Keluar</span>
                                                <span v-if="item.order_status == 'Masuk'" class="green--text">Masuk</span>
                                            </v-card-title>
                                            <v-card-subtitle>
                                                <span v-if="item.order_status == 'Keluar'">{{item.quantity_out}}</span>
                                                <span v-if="item.order_status == 'Masuk'">{{item.quantity_in}}</span>
                                            </v-card-subtitle>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-no-wrap justify-space-between mt-n4">
                                        <v-card-subtitle>{{ item.status }}</v-card-subtitle>
                                        <v-card-subtitle>{{ formatDateList(item.date) }}</v-card-subtitle>
                                    </div>
                                </v-card>
                            </template>
                        </v-data-table>
                    </v-card-text>
                </v-card>
            </v-dialog>
        </div>
    </v-app>
</template>

<script>
import api from "@/api.js"
import moment from 'moment/src/moment'
// import _ from "lodash"
export default {
    name: 'KartuStock',
    mounted() {
        this.get()
    },
    data() {
        return {
            search:'',
            stockRecords:[],
            products:[],
            selectedIndex:-1,
            stockRecord:[],
            product:{},
            popUpStockRecord: false
        }
    },
    methods: {
        get() {
            api.getAllStockRecord()
                .then(stockRecords => {
                    this.stockRecords = stockRecords
                })
            api.getAllProducts()
                .then(products => {
                    this.products = products
                })
        },
        formatDateList(val) {
            return val ? moment(val).format('DD/MM/YYYY') : ''
        },
        details(item) {
            this.selectedIndex = this.products.indexOf(item)
            this.product = Object.assign({},item)
            this.stockRecords.forEach(el => {
                if(this.product.id == el.order_item) {
                    this.stockRecord.push(el)
                }
            });
            this.popUpStockRecord = true
        },
        close() {
            this.product = {}
            this.stockRecord = []
            this.popUpStockRecord = false
        }
    },
    computed: {
        productsHeader() {
            return [
                {text:'Nama', value:'name'}
            ]
        },
        kartuStockHeader() {
            return [
                {text:'Tanggal', value:'order_date'},
                {text:'Nomor Surat', value:'order_number'},
                {text:'Status', value:'order_status'},
                {text:'Jumlah', value:'quantity'}
            ]
        },
        popUpBreakPoint() {
            if (this.$vuetify.breakpoint.name == 'xs') {
                return true
            } else {
                return false
            }
        },
    }
}
</script>

<style>

</style>