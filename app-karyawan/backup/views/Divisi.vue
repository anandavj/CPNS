<template>
    <v-apps>
        <!-- *************************************************************************************************************** -->
        <!-- Search Divisi in Divisis Array -->
        <!-- *************************************************************************************************************** -->
        <v-text-field
            placeholder="Cari Divisi"
            :solo="true"
            :clearable="true"
            append-icon="mdi-magnify"
            class="font-regular font-weight-light"
            v-model="searchDivisi"
        />        
        <!-- *************************************************************************************************************** -->
        <!-- *************************************************************************************************************** -->
    
        <!-- *************************************************************************************************************** -->
        <!-- Add Divisi -->
        <!-- *************************************************************************************************************** -->
        <v-container class="my-n7">
            <v-dialog v-model="popUpNew" persistent max-width='1000px'>
                <template v-slot:activator="{ on }">
                    <v-row justify="end">
                        <v-col cols="5" lg="2">
                            <v-btn block v-on="on" color="light-blue" class="white--text">
                                <v-icon>mdi-plus</v-icon>Tambah
                            </v-btn>
                        </v-col>
                    </v-row>
                </template>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Tambah Divisi</span>
                        <v-btn absolute right icon @click="popUpNew = !popUpNew"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field label="Nama Divisi" v-model="divisi.nama"/>
                                </v-col>
                                <v-col cols="12">
                                    <div class="title mt-n3">Permission</div>
                                    <div v-for="(permission,index) in permissions" :key="index">
                                        <v-checkbox
                                            v-model="divisi.permissions"
                                            :label="permission"
                                            :value="permission"
                                            class="font-weight-light mb-n2"
                                        />
                                    </div>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="saveNewDivisi">Ya</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-container>
        <!-- *************************************************************************************************************** -->
        <!-- *************************************************************************************************************** -->

        <!-- *************************************************************************************************************** -->
        <!-- List Divisi -->
        <!-- *************************************************************************************************************** -->
    </v-apps>
</template>

<script>
export default {
    name:'Divisi',
    data() {
        return {
            permissions: [
                'Add Barang',
                'View Barang',
                'Update Barang'
            ],
            divisi: {
                nama:'',
                permissions:[]
            },
            searchDivisi:'',
            popUpNew:''
        }
    }
}
</script>