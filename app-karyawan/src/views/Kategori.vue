<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Kategori in Categories Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Kategori"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchCategory"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Kategori -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark large color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n7">
                <v-dialog v-model="popUpNew" persistent max-width="500px">
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Kategori</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-text-field color="accent" v-model="category.name" :rules="rules.newCategory" label="Nama Kategori"></v-text-field>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                    <v-btn class="my-n9" color="blue darken-1" text @click="saveNewCategory">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
                <v-dialog v-model="popUpEdit" persistent max-width="500px">
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Edit Kategori</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-text-field color="accent" v-model="category.name" :rules="rules.newCategory" label="Nama Kategori"></v-text-field>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                    <v-btn class="my-n9" color="blue darken-1" text @click="saveEditedCategory">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
                <v-dialog v-model="popUpDelete" max-width="600">
                    <v-card>
                    <v-card-title>Confirmation</v-card-title>
                        <v-card-text>Apakah Anda Yakin Ingin Menghapus {{category.name}}?</v-card-text>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="mt-n5" color="blue darken-1" text @click="confirmDelete">Ya</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- List Cateogry -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="categoriesHeader"
                :items="categories"
                :search="searchCategory"
                :disable-sort="true"
                hide-default-footer="true"
                :mobile-breakpoint="1"
                no-data-text="Belum ada Kategori yang Terdafar"
                no-results-text="Kategori Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{ item }">
                    <v-icon class="mr-2" @click.stop="editCategory(item)">mdi-pencil</v-icon>
                    <v-icon @click.stop="deleteCategory(item)">mdi-delete</v-icon>
                </template>
            </v-data-table>
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
    name:'Kategori',
    mounted() {
        this.get()
    },
    data() {
        return {
            categories:[],
            category:{
                id:null,
                name:''
            },
            categoryDefault:{
                id:null,
                name:''
            },
            searchCategory:'',
            popUpNew: false,
            popUpEdit: false,
            popUpConfirmSave: false,
            popUpDelete: false,
            selectedIndex: -1,
            snackbar: false,
            snackbarMessage: '',
            snackbarColor: '',
            productsUnderSearch: '',
            rules: {
                newCategory: [
                    v => !!v || 'Nama Kategori Tidak Valid'
                ],
            }
        }
    },

    methods: {
        get() {
            api.getAllCategory()
                .then(categories => {
                    this.categories = categories
                })
        },
        close() {
            if(this.popUpNew) {
                this.popUpNew = false
                this.category= Object.assign({},this.categoryDefault)
            } else {
                if(this.popUpEdit || this.popUpDelete) {
                    this.popUpEdit = false
                    this.popUpDelete = false
                    this.category= Object.assign({},this.categoryDefault)
                    this.selectedIndex = -1
                }
            }
        },
        editCategory(item) {
            this.selectedIndex = this.categories.indexOf(item)
            this.category = Object.assign({},item)
            this.popUpEdit = true
        },
        saveEditedCategory() {
            if(this.$refs.form.validate()) {
                api.updateCategory(this.category)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllCategory()
                        .then((categories) => {
                            this.categories = categories
                            this.close()
                        })
                })
            }
        },
        saveNewCategory() {
            if(this.$refs.form.validate()) {
                api.addCategory(this.category.name)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllCategory()
                        .then((categories) => {
                            this.categories = categories
                            this.close()
                        })
                })
            }
        },
        deleteCategory(item) {
            this.selectedIndex = this.categories.indexOf(item)
            this.category = Object.assign({},item)
            this.popUpDelete = true
        },
        confirmDelete() {
            api.deleteCategory(this.category)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllCategory()
                        .then((categories) => {
                            this.categories = categories
                            this.close()
                        })
                })
        }
    },

    computed: {
        categoriesHeader() {
            return [
                {text:'Nama', value:'name'},
                {text:'', value:'actions'}
            ]
        }
    }
}
</script>