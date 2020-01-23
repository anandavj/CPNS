<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Karyawan"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
            />
            <v-data-table
                :headers="karyawanHeaders"
                :items="karyawans"
                :disable-sort="true"
                :disable-filtering="true"
                :mobile-breakpoint="1"
                :hide-default-footer="true"
                class="font-regular font-weight-light"
            >
                <template v-slot:item.actions="{ item }">
                    <template>
                        <v-btn @click="details(item)" color="light-blue" dark class="overline">Details</v-btn>
                    </template>
                </template>
            </v-data-table>
        <v-dialog v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
            <v-card>
                <v-toolbar dense flat>
                    <span class="title font-weight-light">Profil</span>
                    <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                </v-toolbar>
                {{karyawan}}
            </v-card>
        </v-dialog>
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Karyawan',

    data() {
        return {
            karyawans: [
                {no:1, nama:'Mahendra Fajar'},
                {no:2, nama:'Ananda Vijaya'},
                {no:3, nama:'Satria Kemal'},
            ],
            popupDetails: false,
            karyawan: {
                no:null,
                nama:''
            },
            karyawanDefault: {
                no:null,
                nama:''
            },
            selectedIndex: -1
        }
    },
    
    methods: {
        details(item) {
            this.selectedIndex = this.karyawans.indexOf(item)
            this.karyawan = Object.assign({},item)
            this.popupDetails = true
        },
        close() {
            this.karyawan = Object.assign({},this.karyawanDefault)
            this.selectedIndex = -1
            this.popupDetails = false
        }
    },

    computed: {
        karyawanHeaders() {
            return [
                {text:'No',value:'no',width:'20%',filter: () => true},
                {text:'Nama',value:'nama'},
                {text:'',value:'actions'}
            ]
        }
    }
    
}
</script>