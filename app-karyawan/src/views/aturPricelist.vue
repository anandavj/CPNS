<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Barang"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                v-model="searchPricelistBarang"
            />
            <v-data-table
                :headers="headers"
                :items="barangs"
                :search="searchPricelistBarang"
                :disable-sort="true"
                :hide-default-footer="true"
            >
                <template v-slot:item.actions="{ item }">
                    <v-dialog fullscreen v-model="pricelistDialog" scrollable>
                        <template v-slot:activator="{on}">
                            <v-btn @click="details(item)" v-on="on" width="80px" color="light-blue" dark class="caption">Details</v-btn>
                        </template>
                        <v-card>
                            <div>
                                <v-toolbar dense flat>
                                    <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                <v-card-text>
                                    <v-data-table
                                        :headers="karyawansHeader"
                                        :items="karyawan"
                                        :disable-sort="true"
                                        :disable-filtering="true"
                                        mobile-breakpoint="1"
                                        hide-default-footer="true"
                                    >
                                    </v-data-table>
                                </v-card-text>
                            </div>
                        </v-card>
                    </v-dialog>
                </template>
            </v-data-table>
        </div>
    </v-app>
</template>

<script>
export default {
    name:'aturPricelist',
    data() {
        return {
            karyawansHeader: [
                {text:'No', value:'no', width:'5%'},
                {text:'Nama', value:'nama', width:'90%'},
                {text:'Margin(%)', value:'margin'}
            ],
            barangs: [
                {
                    namaBarang:'Atap', 
                    stock:'100', 
                    rataRataBawah:100000, 
                    hargaAtas:140000,
                    karyawans: [
                        {no:1, nama:'Ananda Vijaya', margin:'5'}
                    ]
                },
                {
                    namaBarang:'Bata', 
                    stock:'1200', 
                    rataRataBawah:1000, 
                    hargaAtas:14000,
                    karyawans: [
                        {no:1, nama:'Mahendra Fajar', margin:'5'},
                        {no:2, nama:'Satria Kemal', margin:'10'}
                    ]
                },
                {namaBarang:'Paku', stock:'10', rataRataBawah:500, hargaAtas:1000}
            ],
            karyawan: [],
            searchPricelistBarang:'',
            pricelistDialog: false,
            selectedIndex: -1
        }
    },
    methods: {
        close() {
            this.selectedIndex = -1
            this.pricelistDialog = false
        },
        details(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.karyawan = Object.assign({},item.karyawans)
            this.pricelistDialog = true
        }
    },
    computed: {
        headers() {
            return [
                {text:'Nama Barang', value:'namaBarang'},
                {text:'stock', value:'stock', filter: () => true},
                {text:'Rata Rata Harga Bawah', value:'rataRataBawah', filter: () => true},
                {text:'Harga Atas', value:'hargaAtas', filter: () => true},
                {text:'', value:'actions', filter: () => true}                
            ]
        }
    }
}
</script>