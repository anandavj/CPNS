<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Nomor"
                solo
                clearable
                append-icon="mdi-magnify"
                @click:append="doNothing"
                v-model="searchNomor"
            />
            <v-data-table
                :headers="headers"
                :items="items"
                :search="searchNomor"
                hide-default-footer="true"
            >
            <template v-slot:item.actions="{ item }">
                <v-dialog fullscreen v-model="dialog" scrollable max-width="300px">
                    <template v-slot:activator="{on}">
                        <v-btn @click="open(item)" v-on="on" width="130px" color="light-blue" dark>Detail</v-btn>
                    </template>
                    <v-card>
                        <div>
                            <v-card-title>List Barang</v-card-title>
                            <v-divider></v-divider>
                            <v-list>
                                <v-list-item v-for="barang in barangs" :key="barang.id" >
                                    <v-row align="center">
                                        <v-checkbox v-model="selectCheckBox" hide-details hint="test" :value="barang.id" class="shrink mt-n1"></v-checkbox>
                                        <v-list-item-content>{{barang.name}}</v-list-item-content>
                                        <v-list-item-action>
                                                <v-list-item class="subtitle" disabled>{{barang.jumlah}}</v-list-item>
                                        </v-list-item-action>
                                    </v-row>
                                </v-list-item>
                                <v-card-actions>
                                    <v-container>
                                        <v-row justify="center">
                                            <v-btn class="mt-n5" color="red darken-1" text @click="cancel">Tidak</v-btn>
                                            <v-btn class="mt-n5" color="blue darken-1" text @click="deleteItem">Ya</v-btn>
                                        </v-row>
                                    </v-container>
                                </v-card-actions>
                            </v-list>
                            
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
    name:'BongkarMuatBarang',
    data() {
        return {
            items: [
                {nomor:'INV/XXX/XX',status:'Bongkar',tanggal:'10 Januari 2020',keterangan:'Ini hanya test'}
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
            selectCheckBox: [],
            searchNomor:'',
            dialog: false
        }
    },
    methods: {
        doNothing() {

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