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

                        </div>
                        <div v-else>
                            <v-data-table
                                :headers="listSuratJalanHeader"
                                :items="listSuratJalans"
                                :search="searchSuratJalan"
                                :hide-default-footer="true"
                                @click:row="detailSuratJalan"
                            ></v-data-table>
                        </div>
                    </v-tab-item>
                    <!-- *************************************************************************************************************** -->
                    <!-- *************************************************************************************************************** -->
                    
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
            tab:'',
            /* -------------------- SURAT JALAN -------------------- */
            // List
            // listSuratJalanHeader on computed
            listSuratJalans:'',
            searchSuratJalan:'',

            /* --------------------             -------------------- */
            /* -------------------- DO -------------------- */
            /* --------------------    -------------------- */
        }
    },
    methods: {
        /* -------------------- SURAT JALAN -------------------- */
        detailSuratJalan() {

        }
        /* --------------------             -------------------- */
        /* -------------------- DO -------------------- */
        /* --------------------    -------------------- */
    },

    computed: {
        listSuratJalanHeader() {
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