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
                                <v-text-field color="accent" v-model="category" label="Nama Kategori"></v-text-field>
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
        </div>
    </v-app>
</template>

<script>
export default {
    name:'Kategori',

    data() {
        return {
            categories:[],
            category:'',
            searchCategory:'',
            popUpNew: false,
            popUpEdit: false,
            popUpConfirmSave: false,
            popUpDelete: false,
            selectedIndex: -1
        }
    },

    methods: {
        close() {
            if(this.popUpNew) {
                this.popUpNew = false
                this.category= ''
            } else {
                if(this.popUpEdit || this.popUpDelete) {
                    this.popUpEdit = false
                    this.category = ''
                    this.selectedIndex = -1
                }
            }
        },
        editCategory(item) {
            this.selectedIndex = this.categories.indexOf(item)
            this.category = Object.assign({},item)
            this.popUpEdit = true
        },
        confirmSave() {
            if(this.$refs.form.validate()) {
                this.popUpEdit = false
                this.popUpConfirmSave = true
            }
        },
        saveEditedCategory() {

        },
        saveNewCategory() {

        },
        deleteCategory() {
            
        }
    },

    computed: {
        categoriesHeader() {
            return [
                {text:'Nama', value:'nama'},
                {text:'', value:'actions'}
            ]
        }
    }
}
</script>