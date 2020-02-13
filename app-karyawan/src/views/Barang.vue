<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Barang in Barangs Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Barang"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchBarang"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Barang -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark large color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n3">
                <v-dialog v-model="popUpNew" persistent max-width='1000px'>
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Produk</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form" class="px-2">
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12" class="my-n4">
                                        <div class="title">Gambar Produk</div>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-file-input v-model="barang.gambar" color="accent" prepend-icon="mdi-camera" chips multiple accept="image/*" label="Upload Produk"></v-file-input>
                                    </v-col>
                                    <!--  -->
                                    <v-col cols="12" class="my-n4">
                                        <div class="title">Informasi Produk</div>
                                    </v-col>
                                    <v-col cols="3">
                                        <v-text-field label="ID" v-model="barang.id"/>
                                    </v-col>
                                    <v-col cols="9">
                                        <v-text-field label="Nama" v-model="barang.nama"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-select
                                                    v-model="barang.kategori"
                                                    :items="categories"
                                                    label="Kategori"
                                                />
                                            </v-col>
                                            <v-col cols="1">
                                                <v-tooltip bottom color="accent">
                                                    <template v-slot:activator="{ on }">
                                                        <v-btn
                                                            text
                                                            icon
                                                            color="accent"
                                                            v-on="on"
                                                            @click="popUpNewCategory = !popUpNewCategory"
                                                        >
                                                            <v-icon>mdi-plus</v-icon>
                                                        </v-btn>
                                                    </template>
                                                    <span>Tambah Kategori Baru</span>
                                                </v-tooltip>
                                            </v-col>
                                            <!-- Dialog New Kategori -->
                                            <v-dialog v-model="popUpNewCategory" persistent max-width="350px" style="z-index:10">
                                                <v-card>
                                                    <v-form ref="form">
                                                        <v-card-text>
                                                            <v-text-field color="accent" outlined v-model="formNewKategoriModel" label="Nama Kategori"/>
                                                        </v-card-text>
                                                    </v-form>
                                                    <v-card-actions>
                                                        <v-container>
                                                            <v-row justify="center">
                                                                <v-btn class="my-n11" color="red darken-1" text @click="close">Batal</v-btn>
                                                                <v-btn class="my-n11" color="blue darken-1" text @click="saveNewKategori">Save</v-btn>
                                                            </v-row>
                                                        </v-container>
                                                    </v-card-actions>
                                                </v-card>
                                            </v-dialog>
                                            <!--  -->
                                        </v-row>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-select
                                                    v-model="barang.satuan"
                                                    :items="satuans"
                                                    label="Satuan"
                                                />
                                            </v-col>
                                            <v-col cols="1">
                                                <v-tooltip bottom color="accent">
                                                    <template v-slot:activator="{ on }">
                                                        <v-btn
                                                            text
                                                            icon
                                                            color="accent"
                                                            v-on="on"
                                                            @click="popUpNewSatuan = !popUpNewSatuan"
                                                        >
                                                            <v-icon>mdi-plus</v-icon>
                                                        </v-btn>
                                                    </template>
                                                    <span>Tambah Satuan Baru</span>
                                                </v-tooltip>
                                            </v-col>
                                            <!-- Dialog New Kategori -->
                                            <v-dialog v-model="popUpNewSatuan" persistent max-width="350px" style="z-index:10">
                                                <v-card>
                                                    <v-form ref="form">
                                                        <v-card-text>
                                                            <v-text-field color="accent" v-model="formNewSatuanModel.name" label="Nama Unit"/>
                                                            <v-text-field color="accent" v-model="formNewSatuanModel.singkatan" label="Singkatan"/>
                                                            <v-text-field color="accent" v-model="formNewSatuanModel.jenis" label="Jenis Satuan"/>
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
                                            <!--  -->
                                        </v-row>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-text-field label="Open Price" v-model="barang.openPrice"/>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-text-field label="Bottom Price" v-model="barang.bottomPrice"/>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-text-field label="Stock" v-model="barang.stock"/>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-textarea label="Deskripsi" v-model="barang.deskripsi" outlined/>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-combobox
                                            v-model="barang.tag"
                                            :filter="filter"
                                            :hide-no-data="!search"
                                            :items="tagList"
                                            :search-input.sync="search"
                                            hide-selected
                                            label="Tag"
                                            multiple
                                            small-chips
                                            solo
                                        >
                                            <template v-slot:no-data>
                                            <v-list-item>
                                                <span class="subheading">Create</span>
                                                <v-chip
                                                :color=colors
                                                label
                                                small
                                                >
                                                {{ search }}
                                                </v-chip>
                                            </v-list-item>
                                            </template>
                                            <template v-slot:selection="{ attrs, item, parent, selected }">
                                            <v-chip
                                                v-if="item === Object(item)"
                                                v-bind="attrs"
                                                :color="`${item.color} lighten-3`"
                                                :input-value="selected"
                                                label
                                                small
                                            >
                                                <span class="pr-2">
                                                {{ item.text }}
                                                </span>
                                                <v-icon
                                                small
                                                @click="parent.selectItem(item)"
                                                >mdi-close</v-icon>
                                            </v-chip>
                                            </template>
                                            <template v-slot:item="{ index, item }">
                                            <v-text-field
                                                v-if="editing === item"
                                                v-model="editing.text"
                                                autofocus
                                                flat
                                                background-color="transparent"
                                                hide-details
                                                solo
                                                @keyup.enter="edit(index, item)"
                                            ></v-text-field>
                                            <v-chip
                                                v-else
                                                :color="`${item.color} lighten-3`"
                                                dark
                                                label
                                                small
                                            >
                                                {{ item.text }}
                                            </v-chip>
                                            </template>
                                        </v-combobox>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n12" color="red darken-1" text @click="close">Cancel</v-btn>
                                    <v-btn class="mt-n12" color="blue darken-1" text @click="saveNewBarang">Save</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Quick Edit Open Price -->
            <!-- *************************************************************************************************************** -->
            <v-switch value v-model="editToggle" class="pa-0 ma-0" label="Edit Price"></v-switch>
            <v-dialog v-model="popUpQuickEdit" persistent max-width='350px'>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light"> Edit Open Price</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-title>{{barangQuickEdit.nama}}</v-card-title>
                    <v-form ref="form">
                            <v-card-text><v-text-field color="blue" outlined v-model="barangQuickEdit.openPrice" placeholder="Harga Barang"></v-text-field></v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n12" color="blue darken-1" text @click="confirmSave">Ya</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <v-dialog persistent v-model="popUpConfirmSaveQuickEdit" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin mengubah Harga Barang <b>{{barangQuickEdit.nama}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="saveEditedPrice">Ya</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- List Barang -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="barangHeaders"
                :items="barangs"
                :search="searchBarang"
                @click:row="details"
                :disable-sort="true"
                :hide-default-footer="true"
                :mobile-breakpoint="1"
                item-key="nama"
                no-data-text="Data Barang Kosong"
                no-results-text="Data Barang Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{ item }">
                    <v-icon class="mr-2" @click.stop="editBarang(item)">mdi-pencil</v-icon>
                    <v-icon @click.stop="deleteBarang(item)">mdi-delete</v-icon>
                </template>
                <template v-slot:item.openPrice="{ item }">
                    <template v-if="editToggle">
                        <v-btn
                        text 
                        @click.stop="quickEdit(item)" 
                        class="blue--text pa-0 font-weight-light"
                        >
                            {{ item.openPrice }}
                        </v-btn>
                    </template>
                    <template v-else>
                        <v-layout justify-center >{{item.openPrice}}</v-layout>
                    </template>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Details Barang -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
            <v-dialog v-if="popUpBreakPoint" v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{barang}}
                </v-card>
            </v-dialog >
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else v-model="popupDetails" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{barang}}
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Edit Barang -->
            <!-- *************************************************************************************************************** -->
            <v-dialog v-model="popUpEdit" persistent max-width='1000px'>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Edit Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field label="ID" v-model="barang.id"/>
                                </v-col>
                                <v-col cols="12">
                                    <v-text-field label="Nama" v-model="barang.nama"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-text-field label="Open Price" v-model="barang.openPrice"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-text-field label="Bottom Price" v-model="barang.bottomPrice"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-text-field label="Stock" v-model="barang.stock"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-text-field label="Satuan" v-model="barang.satuan"/>
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
            <v-dialog persistent v-model="popUpConfirmSaveEdit" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin mengubah barang <b>{{barang.nama}}</b></v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="save">Ya</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Barang',
    data() {
        return {
            barangs: [
                {id:1, nama:'Paku', openPrice:5000, bottomPrice:3000, stock:100, satuan:'biji'},
                {id:2, nama:'Kayu', openPrice:12000, bottomPrice:3000, stock:400, satuan:'biji'},
                {id:3, nama:'Atap', openPrice:100000, bottomPrice:3000, stock:1100, satuan:'biji'}
            ],
            barang: {
                id:null,
                nama:'',
                openPrice:null,
                stock:null,
                kategori:'',
                satuan:{},
                tag:[],
                gambar:[]
            },
            barangDefault: {
                id:null,
                nama:'',
                openPrice:null,
                stock:null,
                kategori:'',
                satuan:{},
                tag:[],
                gambar:[]
            },
            barangQuickEdit: {
                id:null,
                nama:'',
                openPrice:null
            },
            barangQuickEditDefault: {
                id:null,
                nama:'',
                openPrice:null
            },
            categories: [],
            satuans: [],
            formNewKategoriModel:'',
            formNewSatuanModel: {
                name:'',
                singkatan:'',
                jenis:''
            },
            formNewSatuanModelDefault: {
                name:'',
                singkatan:'',
                jenis:''
            },
            searchBarang:'',
            editToggle:false,
            popUpQuickEdit: false,
            popUpNew: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSaveQuickEdit: false,
            popUpConfirmSaveEdit: false,
            popUpNewCategory: false,
            popUpNewSatuan: false,
            selectedIndex: -1,
            // Combobox
            activator: null,
            attach: null,
            colors: 'blue lighten-3',
            editing: null,
            index: -1,
            tagList: [
                { header: 'Select an option or create one' },
                {
                    text: 'Foo',
                    color: 'blue',
                }
            ],
            nonce: 1,
            menu: false,
            search: null,
        }
    },

    methods: {
        details(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barang = Object.assign({},item)
            this.popupDetails = true
        },
        close() {
            if(this.popupDetails) {
                this.popupDetails = false
                this.barang = Object.assign({},this.barangDefault)
                this.selectedIndex = -1
            } else {
                if(this.popUpNew) {
                    if(this.popUpNewCategory) {
                        this.popUpNewCategory = false
                        this.formNewKategoriModel = ''
                    } else {
                        if(this.popUpNewSatuan) {
                            this.popUpNewSatuan = false
                            this.formNewSatuanModel = Object.assign({},this.formNewSatuanModelDefault)
                        } else {
                            this.popUpNew = false
                            this.barang = Object.assign({},this.barangDefault)
                        }
                    }
                } else {
                    if(this.popUpQuickEdit) {
                        this.popUpQuickEdit = false
                        this.barangQuickEdit = Object.assign({},this.barangQuickEditDefault)
                    } else {
                        if(this.popUpEdit) {
                            this.popUpEdit = false
                            this.barang = Object.assign({},this.barangDefault)
                            this.selectedIndex = -1
                        } else {
                            if(this.popUpConfirmSaveEdit) {
                                this.popUpConfirmSaveEdit = false
                                this.popUpEdit = true
                            } else {
                                if(this.popUpConfirmSaveQuickEdit) {
                                    this.popUpConfirmSaveQuickEdit = false
                                    this.popUpQuickEdit = true
                                }
                            }
                        }
                    }
                }
            }
        },
        quickEdit(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barangQuickEdit.openPrice = item.openPrice
            this.barangQuickEdit.nama = item.nama
            this.barangQuickEdit.id = item.id
            this.popUpQuickEdit = true
        },
        confirmSave() {
            if(this.$refs.form.validate()) {
                if(this.popUpQuickEdit) {
                    this.popUpQuickEdit = false
                    this.popUpConfirmSaveQuickEdit = true
                } else {
                    if(this.popUpEdit) {
                        this.popUpEdit = false
                        this.popUpConfirmSaveEdit = true
                    }
                }
            }
        },
        //this need promise to ensure that the data in the db and vue in synced !!! IMPORTANT !!!
        saveEditedPrice() {
            let obj = this.barangs.find( ({id}) => id === this.barangQuickEdit.id )
            this.barangs[this.barangs.indexOf(obj)].openPrice = this.barangQuickEdit.openPrice
            this.popUpConfirmSaveQuickEdit = false
            this.barangQuickEdit = Object.assign({},this.barangQuickEditDefault)
        },
        editBarang(item) {
            this.selectedIndex = this.barangs.indexOf(item)
            this.barang = Object.assign({},item)
            this.popUpEdit = true
        },
        save() {
            let obj = this.barangs.find( ({id}) => id === this.barang.id )
            var loop = Object.getOwnPropertyNames(this.barangDefault)
            for(let i=0; i<loop.length; i++) {
                this.barangs[this.barangs.indexOf(obj)][loop[i]] = this.barang[loop[i]]
            }
            this.popUpConfirmSaveEdit = false
            this.barang = Object.assign({},this.barangDefault)
        },
        saveNewBarang() {
            if(this.$refs.form.validate()) {
                this.barangs.push(this.barang)
                this.barang = Object.assign({},this.barangDefault)
                this.close()
            }
        },
        filter (item, queryText, itemText) {
            if (item.header) return false
            const hasValue = val => val != null ? val : ''
            const text = hasValue(itemText)
            const query = hasValue(queryText)
            return text.toString()
                .toLowerCase()
                .indexOf(query.toString().toLowerCase()) > -1
        },
    },
    
    computed: {
        barangHeaders() {
            return [
                {text:'Nama', value:'nama', width:'70%'},
                {text:'Open Price', value:'openPrice', align:'center'},
                {text:'Stock', value:'stock'},
                {text:'',value:'actions',width:'7%'}
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
    },

    watch: {
        "barang.tag" (val, prev) {
        if (val.length === prev.length) return
        this.barang.tag = val.map(v => {
            if (typeof v === 'string') {
            v = {
                text: v,
                color: 'blue'
            }
            this.tagList.push(v)
            this.nonce++
            }
            return v
        })
        },
    },
    
}
</script>