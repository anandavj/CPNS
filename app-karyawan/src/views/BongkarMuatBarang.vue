<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Nomor"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                @click:append="doNothing"
                v-model="searchNomor"
            />
            <v-data-table
                :headers="headers"
                :items="items"
                :search="searchNomor"
                :disable-sort='true'
                :hide-default-footer="true"
            >
            <template v-slot:item.actions="{ item }">
                <v-dialog fullscreen v-model="dialog" scrollable>
                    <template v-slot:activator="{on}">
                        <v-btn @click="open(item)" v-on="on" width="130px" color="light-blue" dark>Detail</v-btn>
                    </template>
                    <v-card>
                        <v-card-text>
                            <v-data-table
                                :headers="barangsHeader"
                                :items="barangs"
                                v-model="barangsSelected"
                                :show-select="true"
                                :disable-sort="true"
                                :disable-filtering="true"
                                :mobile-breakpoint="1"
                                :hide-default-footer="true"
                            >
                            </v-data-table>
                        </v-card-text>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn color="red darken-1" text @click="close">Close</v-btn>
                                    <v-btn color="blue darken-1" text @click="save">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </template>
            </v-data-table>
        </div>
    </v-app>
</template>
<script>
export default {
    name:'BongkarMuatBarang',
    data() {
        return {
            items: [
                {nomor:'INV/XXX/XX',status:'Bongkar',tanggal:'10 Januari 2020',keterangan:'Ini hanya test'}
            ],
            barangsHeader: [
                {text:'ID', value:'id'},
                {text:'Nama Barang', value:'name'},
                {text:'Jumlah', value:'jumlah'}
            ],
            barangs: [
                {id:1, name: 'barang 1', jumlah: 21},
                {id:2, name: 'barang 1', jumlah: 213},
                {id:3, name: 'barang 1', jumlah: 12},
                {id:4, name: 'barang 1', jumlah: 1},
                {id:5, name: 'barang 1', jumlah: 2},
                {id:6, name: 'barang 1', jumlah: 4},
                {id:7, name: 'barang 1', jumlah: 22},
                {id:8, name: 'barang 1', jumlah: 55},
                {id:9, name: 'barang 1', jumlah: 212},
                {id:10, name: 'barang 1', jumlah: 22},
            ],
            barangsSelected: [],
            searchNomor:'',
            dialog: false
        }
    },
    methods: {
        doNothing() {

        },
        close() {
            this.barangsSelected = []
            this.dialog = false
        }
    },
    computed: {
        headers() {
            return [
                {text:'Nomor', value:'nomor'},
                {text:'Status', value:'status',filter: () => true},
                {text:'Tanggal', value:'tanggal',filter: () => true},
                {text:'Keterangan', value:'keterangan',filter: () => true},
                {text:'', value:'actions',width:'10%',filter: () => true}
            ]
        }
    }
}
</script>