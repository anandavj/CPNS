<template>
    <v-app>
        <div>
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
            <v-btn fab dark large color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n7">
                <v-dialog v-model="popUpNew" persistent max-width='1000px'>
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Divisi</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12">
                                        <v-text-field color="accent" label="Nama Divisi" v-model="divisi.name"/>
                                    </v-col>
                                    <v-col cols="12">
                                        <div class="title mt-n3">Permission</div>
                                        <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                            <v-expansion-panel v-for="(permission,index) in task" :key="index">
                                                <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                                <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                    <v-checkbox
                                                        v-model="divisi.taskId"
                                                        :label="permissionList.label"
                                                        :value="permissionList.id"
                                                        class="font-weight-light my-n3"
                                                        color="accent"
                                                    />
                                                </v-expansion-panel-content>
                                            </v-expansion-panel>
                                        </v-expansion-panels>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="my-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="my-n5" color="blue darken-1" text @click="saveNewDivisi">Ya</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                        <div v-if="loadingAddNewDivisi">
                            <v-progress-linear
                                indeterminate
                                height="8"
                                color="yellow darken-2"
                                >
                            </v-progress-linear>
                        </div>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        
            <!-- *************************************************************************************************************** -->
            <!-- List Divisi -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="divisiHeaders"
                :items="divisis"
                :search="searchDivisi"
                @click:row="details"
                :mobile-breakpoint="1"
                :disable-sort="true"
                :footer-props="{
                    'items-per-page-options': [10, 50, 100, -1]
                }"
                :loading="loadingListDivisi"
                no-data-text="Belum ada Divisi yang terdaftar"
                no-results-text="Divisi tidak ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{ item }">
                    <v-icon class="mr-2" @click.stop="editDivisi(item)">mdi-pencil</v-icon>
                    <v-icon class="mr-2" @click.stop="confirmDeleteDivisi(item)">mdi-delete</v-icon>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Details Divisi -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
            <v-dialog v-if="popUpBreakPoint" v-model="popUpDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Divisi</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{divisi}}
                </v-card>
            </v-dialog>
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else v-model="popUpDetails" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Divisi</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{divisi}}
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Edit Divisi -->
            <!-- *************************************************************************************************************** -->
            <v-dialog v-if="popUpBreakPoint" v-model="popUpEdit" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Edit Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field label="Nama Divisi" v-model="divisi.name"/>
                                </v-col>
                                <v-col cols="12">
                                    <div class="title mt-n3">Permission</div>
                                    <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                        <v-expansion-panel v-for="(permission,index) in task" :key="index">
                                            <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                            <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                <v-checkbox
                                                    v-model="divisi.taskId"
                                                    :label="permissionList.label"
                                                    :value="permissionList.id"
                                                    class="font-weight-light my-n3"
                                                    color="accent"
                                                />
                                            </v-expansion-panel-content>
                                        </v-expansion-panel>
                                    </v-expansion-panels>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                <v-btn class="mt-n12" color="blue darken-1" text @click="confirmSave">Save</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else persistent v-model="popUpEdit" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Edit Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field label="Nama Divisi" v-model="divisi.name"/>
                                </v-col>
                                <v-col cols="12">
                                    <div class="title mt-n3">Permission</div>
                                    <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                        <v-expansion-panel v-for="(permission,index) in task" :key="index">
                                            <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                            <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                <v-checkbox
                                                    v-model="divisi.taskId"
                                                    :label="permissionList.label"
                                                    :value="permissionList.id"
                                                    class="font-weight-light my-n3"
                                                    color="accent"
                                                />
                                            </v-expansion-panel-content>
                                        </v-expansion-panel>
                                    </v-expansion-panels>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                <v-btn class="mt-n12" color="blue darken-1" text @click="confirmSave">Save</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Confirm on Edit -->
            <!-- *************************************************************************************************************** -->
            <v-dialog persistent v-model="popUpConfirmSave" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin mengubah divisi <b>{{divisi.name}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="updateDivisi">Ya</v-btn>
                            </v-row>
                            <div v-if="loadingUpdateDivisi">
                                <v-progress-linear
                                    indeterminate
                                    height="8"
                                    color="yellow darken-2"
                                >
                                </v-progress-linear>
                            </div>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
            
            <!-- *************************************************************************************************************** -->
            <!-- Confirm on Delete -->
            <!-- *************************************************************************************************************** -->
            <v-dialog persistent v-model="popUpConfirmDelete" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin menghapus divisi <b>{{divisi.name}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="deleteDivisi">Ya</v-btn>
                            </v-row>
                            <div v-if="loadingDeleteDivisi">
                                <v-progress-linear
                                    indeterminate
                                    height="8"
                                    color="yellow darken-2"
                                >
                                </v-progress-linear>
                            </div>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
            <v-snackbar
                v-model="snackbar"
                multi-line
                v-bind:color="snackbarColor"
            >
                {{ snackbarMessage }}
                <v-btn
                    text
                    @click="snackbar = false"
                >
                    <v-icon>
                        mdi-close
                    </v-icon>
                </v-btn>
            </v-snackbar>
        </div>
    </v-app>
</template>

<script>
import api from "@/api.js"

export default {
    name: 'Divisi',
    mounted() {
        this.get()
    },
    data() {
        return {
            snackbar: false,
            snackbarColor: null,
            snackbarMessage: null,
            divisiHeaders: [
                {text:'Nama Divisi', value:'name'},
                {text:'', value:'actions'}
            ],
            divisis: [],
            task: [
                // {
                //     modul:'Barang', 
                //     action: [
                //         {id:2,label:'Add Barang'},
                //         {id:3,label:'Read Barang'}
                //     ]
                // },
                // {
                //     modul:'Karyawan', 
                //     action: [
                //         {id:2,label:'Add Karyawan'},
                //         {id:3,label:'Read Karyawan'}
                //     ]
                // }
            ],
            divisi: {
                id:null,
                name:null,
                taskId: []
            },
            divisiDefault: {
                id:null,
                name:null,
                taskId: []
            },
            panel: [],
            searchDivisi:'',
            loadingAddNewDivisi:false,
            loadingUpdateDivisi:false,
            loadingDeleteDivisi:false,
            loadingListDivisi:true,
            popUpDetails: false,
            popUpNew: false,
            popUpEdit: false,
            popUpConfirmSave: false,
            popUpConfirmDelete: false,
            selectedIndex: -1
        }
    },

    methods: {
        get(){
            api.getAllUserTaskGroup().then(userTaskGroup => {
                userTaskGroup.forEach(userTaskGroupElement => {
                    userTaskGroupElement.taskId = []
                    api.getGroupTaskByUserTaskGroupId(userTaskGroupElement.id).then(groupTask => {
                        groupTask.task.forEach(taskElement => {
                            userTaskGroupElement.taskId.push(taskElement.taskId)
                        });
                    })
                })
                this.divisis = userTaskGroup
                this.loadingListDivisi = false
            })
            api.getAllTask().then(task => {
                this.task = task
            })
        },
        details(item) {
            this.selectedIndex = this.divisis.indexOf(item)
            this.divisi = Object.assign({},item)
            this.popUpDetails = true
        },
        saveNewDivisi() {
            this.loadingAddNewDivisi = true
            api.insertUserTaskGroup(this.divisi).then(() => {
                api.insertGroupTask(this.divisi).then(response => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }).catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }).finally(() => {
                    this.loadingAddNewDivisi = false
                    this.divisi = this.divisiDefault
                    this.snackbar = true
                    this.get()
                    this.close()
                })
            }).catch(error => {
                this.snackbarColor = 'error'
                this.snackbarMessage = error
                this.loadingAddNewDivisi = false
                this.divisi = this.divisiDefault
                this.snackbar = true
                this.get()
                this.close()
            })
        },
        editDivisi(item) {
            this.divisi = Object.assign({}, item)
            this.popUpEdit = true
        },
        confirmDeleteDivisi(item){
            this.divisi = item
            this.popUpConfirmDelete = true
        },
        confirmSave() {
            if(this.$refs.form.validate()) {
                this.popUpEdit = false
                this.popUpConfirmSave = true
            }
        },
        //this need promise to ensure that the data in the db and vue in synced !!! IMPORTANT !!!
        updateDivisi() {
            this.loadingUpdateDivisi = true
            api.updateUserTaskGroup(this.divisi).then(() => {
                api.updateGroupTask(this.divisi).then(response => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }).catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }).finally(() => {
                    this.loadingUpdateDivisi = false
                    this.divisi = this.divisiDefault
                    this.snackbar = true
                    this.get()
                    this.close()
                })
            }).catch(error => {
                this.loadingUpdateDivisi = false
                this.snackbarColor = 'error'
                this.snackbarMessage = error
                this.divisi = this.divisiDefault
                this.snackbar = true
                this.get()
                this.close()
            })
        },
        deleteDivisi() {
            this.loadingDeleteDivisi = true
            api.deleteUserTaskGroup(this.divisi).then(response => {
                this.snackbarColor = 'success'
                this.snackbarMessage = response
            }).catch(error => {
                this.snackbarColor = 'error'
                this.snackbarMessage = error
            }).finally(() => {
                this.loadingDeleteDivisi = false
                this.snackbar = true
                this.get()
                this.close()
            });
        },
        close() {
            this.divisi = this.divisiDefault
            this.selectedIndex = -1
            this.popUpDetails = false
            this.popUpNew = false
            this.popUpEdit = false
            this.popUpConfirmSave = false
            this.popUpConfirmDelete = false
            this.panel = []
        }
    },

    computed: {
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