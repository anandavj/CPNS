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

        </div>
    </v-app>
</template>

<script>
export default {
    name:'Satuan',

    data() {
        return {
            popUpNew: false
        }
    }
}
</script>