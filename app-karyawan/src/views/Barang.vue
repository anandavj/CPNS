<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Barang in products Array -->
            <!-- *************************************************************************************************************** -->
            <v-row justify="end" no-gutters>
                <v-col cols="12">
                    <v-text-field
                        placeholder="Cari Barang"
                        :solo='true'
                        :clearable='true'
                        append-icon="mdi-magnify"
                        class="font-regular font-weight-light mb-n4"
                        v-model="advanceSearch.name"
                    />
                </v-col>
                <v-expand-transition v-if="!popUpBreakPoint">
                    <v-col cols="12" v-if="showAdvanceSearchOption">
                        <v-row no-gutters>
                            <v-col cols="12">
                                <v-select
                                    :items="categories"
                                    outlined
                                    dense
                                    label="Kategori"
                                    v-model="advanceSearch.category"
                                    class="mb-n4"
                                    color="accent"
                                    item-text="name"
                                    item-value="id"
                                />   
                            </v-col>
                            <v-col cols="3">
                                <v-text-field
                                    label="Min Stock"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_down"
                                    class="mb-n4 mr-3"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="3">
                                <v-text-field
                                    label="Max Stock"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_up"
                                    class="mb-n4 mr-3"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="3">
                                <v-text-field
                                    label="Min Open Price"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.open_price_down"
                                    @click:clear="advanceSearch.open_price_down = null"
                                    class="mb-n4 mr-3"
                                    type="number"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="3">
                                <v-text-field
                                    label="Max Open Price"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.open_price_up"
                                    @click:clear="advanceSearch.open_price_up = null"
                                    class="mb-n4"
                                    type="number"
                                    color="accent"
                                />
                            </v-col>
                        </v-row>
                    </v-col>
                </v-expand-transition>
                <v-expand-transition v-else>
                    <v-col cols="12" v-if="showAdvanceSearchOption">
                        <v-row no-gutters>
                            <v-col cols="12">
                                <v-select
                                    :items="categories"
                                    outlined
                                    dense
                                    label="Kategori"
                                    v-model="advanceSearch.category"
                                    class="mb-n4"
                                    color="accent"
                                    item-text="name"
                                    item-value="id"
                                />  
                            </v-col>
                            <v-col cols="6">
                                <v-text-field
                                    label="Min Stock"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_down"
                                    class="mb-n4 mr-3"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="6">
                                <v-text-field
                                    label="Max Stock"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_up"
                                    class="mb-n4"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="6">
                                <v-text-field
                                    label="Min Open Price"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.open_price_down"
                                    @click:clear="advanceSearch.open_price_down = null"
                                    class="mb-n4 mr-3"
                                    type="number"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="6">
                                <v-text-field
                                    label="Max Open Price"
                                    outlined
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.open_price_up"
                                    @click:clear="advanceSearch.open_price_up = null"
                                    class="mb-n4"
                                    type="number"
                                    color="accent"
                                />
                            </v-col>
                        </v-row>
                    </v-col>
                </v-expand-transition>
                <v-col>
                    <v-btn class="body-2" text dense color="blue white--text"  @click="showAdvanceSearch"><span class="mr-1"><v-icon v-if="!showAdvanceSearchOption">mdi-filter-menu-outline</v-icon><v-icon v-else>mdi-filter-minus-outline</v-icon></span>Filter</v-btn>
                    <v-btn text :disabled="advanceSearch.name == '' && (advanceSearch.open_price_down == '' || advanceSearch.open_price_down == null) && (advanceSearch.open_price_up == '' || advanceSearch.open_price_up == null) && (advanceSearch.stock_down == '' || advanceSearch.stock_down == null) && (advanceSearch.stock_up == '' || advanceSearch.stock_up == null) && advanceSearch.category == ''" v-if="showAdvanceSearchOption" dense @click="clearAllAdvanceSearch" class="caption showAdvanceSearchOptionText"><v-icon>mdi-filter-variant-remove</v-icon> Clear Filter</v-btn>
                </v-col>
            </v-row>
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
                                        <v-file-input v-model="product.image" color="accent" prepend-icon="mdi-camera" chips multiple accept="image/*" label="Upload Produk"></v-file-input>
                                    </v-col>
                                    <!--  -->
                                    <v-col cols="12" class="my-n4">
                                        <div class="title">Informasi Produk</div>
                                    </v-col>
                                    <v-col cols="6" v-if="!popUpBreakPoint">
                                        <v-text-field label="Nama" v-model="product.name"/>
                                    </v-col>
                                    <v-col cols="12" v-else class="mt-n4">
                                        <v-text-field label="Nama" v-model="product.name"/>
                                    </v-col>
                                    <v-col cols="6" v-if="!popUpBreakPoint">
                                        <v-text-field label="Spesifikasi" v-model="product.specification"/>
                                    </v-col>
                                    <v-col cols="12" v-else class="mt-n4">
                                        <v-text-field label="Spesifikasi" v-model="product.specification"/>
                                    </v-col>
                                    <!-- PC / LAPTOP -->
                                    <v-col cols="6" class="mt-n4" v-if="!popUpBreakPoint">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-select
                                                    v-model="product.category_id"
                                                    :items="categories"
                                                    label="Kategori"
                                                    item-text="name"
                                                    item-value="id"
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
                                        </v-row>
                                    </v-col>
                                    <!-- Mobile Phone -->
                                    <v-col cols="12" class="mt-n4" v-else>
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-select
                                                    v-model="product.category_id"
                                                    :items="categories"
                                                    label="Kategori"
                                                    item-text="name"
                                                    item-value="id"
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
                                        </v-row>
                                    </v-col>
                                    <!-- Dialog New Kategori -->
                                    <v-dialog v-model="popUpNewCategory" persistent max-width="350px" style="z-index:10">
                                        <v-card>
                                            <v-form ref="form">
                                                <v-card-text>
                                                    <v-text-field color="accent" outlined v-model="formNewCategoryModel" label="Nama Kategori"/>
                                                </v-card-text>
                                            </v-form>
                                            <v-card-actions>
                                                <v-container>
                                                    <v-row justify="center">
                                                        <v-btn class="my-n11" color="red darken-1" text @click="close">Batal</v-btn>
                                                        <v-btn class="my-n11" color="blue darken-1" text @click="saveNewCategory">Save</v-btn>
                                                    </v-row>
                                                </v-container>
                                            </v-card-actions>
                                        </v-card>
                                    </v-dialog>
                                    <!--  -->
                                    <!-- PC / Laptop -->
                                    <v-col cols="6" class="mt-n4" v-if="!popUpBreakPoint">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-select
                                                    v-model="product.unit_id"
                                                    :items="units"
                                                    label="Satuan"
                                                    item-text="name"
                                                    item-value="id"
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
                                                            @click="popUpNewUnit = !popUpNewUnit"
                                                        >
                                                            <v-icon>mdi-plus</v-icon>
                                                        </v-btn>
                                                    </template>
                                                    <span>Tambah Satuan Baru</span>
                                                </v-tooltip>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <!-- Mobile Phone -->
                                    <v-col cols="12" class="mt-n4" v-else>
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-select
                                                    v-model="product.unit_id"
                                                    :items="units"
                                                    label="Satuan"
                                                    item-text="name"
                                                    item-value="id"
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
                                                            @click="popUpNewUnit = !popUpNewUnit"
                                                        >
                                                            <v-icon>mdi-plus</v-icon>
                                                        </v-btn>
                                                    </template>
                                                    <span>Tambah Satuan Baru</span>
                                                </v-tooltip>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <!-- Dialog New Unit -->
                                    <v-dialog v-model="popUpNewUnit" persistent max-width="350px" style="z-index:10">
                                        <v-card>
                                            <v-form ref="form">
                                                <v-card-text>
                                                    <v-text-field color="accent" v-model="formNewUnitModel.name" label="Nama Unit"/>
                                                    <v-text-field color="accent" v-model="formNewUnitModel.abbreviation" label="Singkatan"/>
                                                    <v-text-field color="accent" v-model="formNewUnitModel.description" label="Jenis Satuan"/>
                                                </v-card-text>
                                            </v-form>
                                            <v-card-actions>
                                                <v-container>
                                                    <v-row justify="center">
                                                        <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                                        <v-btn class="my-n9" color="blue darken-1" text @click="saveNewUnit">Save</v-btn>
                                                    </v-row>
                                                </v-container>
                                            </v-card-actions>
                                        </v-card>
                                    </v-dialog>
                                    <!--  -->
                                    <v-col cols="6" v-if="popUpBreakPoint" class="my-n4">
                                        <v-text-field label="Open Price" v-model="product.open_price"/>
                                    </v-col>
                                    <v-col cols="4" v-else>
                                        <v-text-field label="Open Price" v-model="product.open_price"/>
                                    </v-col>
                                    <v-col cols="6" v-if="popUpBreakPoint" class="my-n4">
                                        <v-text-field label="Bottom Price" v-model="product.bottom_price"/>
                                    </v-col>
                                    <v-col cols="4" v-else>
                                        <v-text-field label="Bottom Price" v-model="product.bottom_price"/>
                                    </v-col>
                                    <v-col cols="12" v-if="popUpBreakPoint" class="my-n4">
                                        <v-text-field label="Stock" v-model="product.stock"/>
                                    </v-col>
                                    <v-col cols="4" v-else>
                                        <v-text-field label="Stock" v-model="product.stock"/>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-textarea label="Deskripsi" v-model="product.description" outlined/>
                                    </v-col>
                                    <v-col cols="12" class="mt-n7">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-autocomplete
                                                    v-model="product.tag"
                                                    :items="tags"
                                                    label="Tag"
                                                    multiple
                                                    chips
                                                    deletable-chips= "true"
                                                    hint="Bisa memilih lebih dari 1 Tag"
                                                    persistent-hint
                                                    color="accent"
                                                    item-color="accent"
                                                    :search-input.sync="searchInput"
                                                    @change="searchInput=''"
                                                    item-text="name"
                                                    item-value="id"
                                                >
                                                </v-autocomplete>
                                            </v-col>
                                            <v-col cols="1">
                                                <v-tooltip bottom color="accent">
                                                    <template v-slot:activator="{ on }">
                                                        <v-btn
                                                            text
                                                            icon
                                                            color="accent"
                                                            v-on="on"
                                                            @click="popUpNewTag = !popUpNewTag"
                                                        >
                                                            <v-icon>mdi-plus</v-icon>
                                                        </v-btn>
                                                    </template>
                                                    <span>Tambah Tag Baru</span>
                                                </v-tooltip>
                                            </v-col>
                                            <!-- Dialog New Tag -->
                                            <v-dialog v-model="popUpNewTag" persistent max-width="350px" style="z-index:10">
                                                <v-card>
                                                    <v-form ref="form">
                                                        <v-card-text>
                                                            <v-text-field color="accent" v-model="formNewTagModel" label="Nama Tag"/>
                                                        </v-card-text>
                                                    </v-form>
                                                    <v-card-actions>
                                                        <v-container>
                                                            <v-row justify="center">
                                                                <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                                                <v-btn class="my-n9" color="blue darken-1" text @click="saveNewTag">Save</v-btn>
                                                            </v-row>
                                                        </v-container>
                                                    </v-card-actions>
                                                </v-card>
                                            </v-dialog>
                                            <!--  -->
                                        </v-row>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn class="mt-n12" color="red darken-1" text @click="close">Cancel</v-btn>
                                    <v-btn class="mt-n12" color="blue darken-1" text @click="saveNewProduct">Save</v-btn>
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
            <v-switch value v-model="editToggle" class="pa-0 mb-0 mt-5" label="Edit Price"></v-switch>
            <v-dialog v-model="popUpQuickEdit" persistent max-width='350px'>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light"> Edit Open Price</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-title>{{productQuickEdit.name}}</v-card-title>
                    <v-form ref="form">
                            <v-card-text><v-text-field color="blue" outlined v-model="productQuickEdit.open_price" placeholder="Harga Barang"></v-text-field></v-card-text>
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
                    <v-card-text>Apakah Anda Yakin ingin mengubah Harga Barang <b>{{productQuickEdit.name}}</b>?</v-card-text>
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
                :headers="productHeaders"
                :items="products"
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
                    <v-icon class="mr-2" @click.stop="editProduct(item)">mdi-pencil</v-icon>
                    <v-icon @click.stop="deleteProduct(item)">mdi-delete</v-icon>
                </template>
                <template v-slot:item.open_price="{ item }">
                    <template v-if="editToggle">
                        <v-btn
                        text 
                        @click.stop="quickEdit(item)" 
                        class="blue--text pa-0 font-weight-light"
                        >
                            {{ item.open_price }}
                        </v-btn>
                    </template>
                    <template v-else>
                        <v-layout justify-center >{{item.open_price}}</v-layout>
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
                    <v-container>
                        <v-col cols="12">
                            <v-card max-width="100%" color="grey">
                                <v-img :src="productImageSelected"></v-img>
                            </v-card>
                        </v-col>
                        <v-row>
                            <v-col cols="3" v-for="(img,index) in product.image" :key="index">
                                <v-card width="100%" @click="changePic(img)">
                                    <v-img :src="img" v-if="productImageSelected == img" gradient="to top right, rgba(0,0,0,.73), rgba(0,0,0,.73)"></v-img>
                                    <v-img :src="img" v-else></v-img>
                                </v-card>
                            </v-col>
                        </v-row>
                        <v-col cols="12">
                            <span class="display-1">{{product.name}}</span>
                        </v-col>
                        <v-col class="my-n4" cols="12">
                            <v-chip
                                color="accent"
                                class="mr-1"
                                label
                                text-color="white"
                                v-for="(tag,idx) in product.tag" :key="idx"
                                small
                            >
                                {{tag}}
                            </v-chip>
                        </v-col>
                        <v-col cols="12">
                            <table class="descTable">
                                <tr>
                                    <td>ID Barang</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.id}}</td>
                                </tr>
                                <tr>
                                    <td>Kategori</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{categoryName}}</td>
                                </tr>
                                <tr>
                                    <td>Satuan</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{unitName}}</td>
                                </tr>
                                <tr>
                                    <td>Open Price</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.open_price}}</td>
                                </tr>
                                <tr>
                                    <td>Bottom Price</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.bottom_price}}</td>
                                </tr>
                                <tr>
                                    <td>Stock</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.stock}}</td>
                                </tr>
                                <tr>
                                    <td>Deskripsi</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.description}}</td>
                                </tr>

                            </table>
                        </v-col>
                    </v-container>
                </v-card>
            </v-dialog >
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else v-model="popupDetails" width="1000px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Barang</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-container>
                        <v-row no-gutters>
                            <v-col cols="5">
                                <v-row>
                                    <v-col cols="12">
                                        <v-card max-width="400px" color="grey">
                                            <v-img :src="productImageSelected"></v-img>
                                        </v-card>
                                    </v-col>
                                </v-row>
                                <v-row>
                                    <v-col cols="3" v-for="(img,index) in product.image" :key="index">
                                        <v-card width="300px" @click="changePic(img)">
                                            <v-img :src="img" v-if="productImageSelected == img" gradient="to top right, rgba(0,0,0,.73), rgba(0,0,0,.73)"></v-img>
                                            <v-img :src="img" v-else></v-img>
                                        </v-card>
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col cols="7" class="px-6">
                                <v-row>
                                    <v-col cols="12">
                                        <span class="display-1">{{product.name}}</span>
                                    </v-col>
                                    <v-col class="my-n4" cols="12">
                                        <v-chip
                                            color="accent"
                                            class="mr-1"
                                            label
                                            text-color="white"
                                            v-for="(tag,idx) in product.tag" :key="idx"
                                            small
                                        >
                                            {{tag}}
                                        </v-chip>
                                    </v-col>
                                    <v-col cols="12">
                                        <table class="descTable">
                                            <tr>
                                                <td>ID Barang</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.id}}</td>
                                            </tr>
                                            <tr>
                                                <td>Kategori</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{categoryName}}</td>
                                            </tr>
                                            <tr>
                                                <td>Satuan</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{unitName}}</td>
                                            </tr>
                                            <tr>
                                                <td>Open Price</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.open_price}}</td>
                                            </tr>
                                            <tr>
                                                <td>Bottom Price</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.bottom_price}}</td>
                                            </tr>
                                            <tr>
                                                <td>Stock</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.stock}}</td>
                                            </tr>
                                            <tr>
                                                <td>Deskripsi</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.description}}</td>
                                            </tr>

                                        </table>
                                    </v-col>
                                </v-row>
                            </v-col>
                        </v-row>
                    </v-container>
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
                                <v-col cols="12" class="my-n4">
                                    <div class="title">Gambar Produk</div>
                                </v-col>
                                <v-col cols="12">
                                    <v-file-input v-model="product.image" color="accent" prepend-icon="mdi-camera" chips multiple accept="image/*" label="Upload Produk"></v-file-input>
                                </v-col>
                                <!--  -->
                                <v-col cols="12" class="my-n4">
                                    <div class="title">Informasi Produk</div>
                                </v-col>
                                <v-col cols="3">
                                    <v-text-field label="ID" v-model="product.id"/>
                                </v-col>
                                <v-col cols="9">
                                    <v-text-field label="Nama" v-model="product.name"/>
                                </v-col>
                                <v-col cols="6" class="mt-n4">
                                    <v-row no-gutters class="align-center">
                                        <v-col cols="11">
                                            <v-select
                                                v-model="product.category_id"
                                                :items="categories"
                                                label="Kategori"
                                                item-text="name"
                                                item-value="id"
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
                                                        <v-text-field color="accent" outlined v-model="formNewCategoryModel" label="Nama Kategori"/>
                                                    </v-card-text>
                                                </v-form>
                                                <v-card-actions>
                                                    <v-container>
                                                        <v-row justify="center">
                                                            <v-btn class="my-n11" color="red darken-1" text @click="close">Batal</v-btn>
                                                            <v-btn class="my-n11" color="blue darken-1" text @click="saveNewCategory">Save</v-btn>
                                                        </v-row>
                                                    </v-container>
                                                </v-card-actions>
                                            </v-card>
                                        </v-dialog>
                                        <!--  -->
                                    </v-row>
                                </v-col>
                                <v-col cols="6" class="mt-n4">
                                    <v-row no-gutters class="align-center">
                                        <v-col cols="11">
                                            <v-select
                                                v-model="product.unit_id"
                                                :items="units"
                                                label="Satuan"
                                                item-text="name"
                                                item-value="id"
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
                                                        @click="popUpNewUnit = !popUpNewUnit"
                                                    >
                                                        <v-icon>mdi-plus</v-icon>
                                                    </v-btn>
                                                </template>
                                                <span>Tambah Satuan Baru</span>
                                            </v-tooltip>
                                        </v-col>
                                        <!-- Dialog New Kategori -->
                                        <v-dialog v-model="popUpNewUnit" persistent max-width="350px" style="z-index:10">
                                            <v-card>
                                                <v-form ref="form">
                                                    <v-card-text>
                                                        <v-text-field color="accent" v-model="formNewUnitModel.name" label="Nama Unit"/>
                                                        <v-text-field color="accent" v-model="formNewUnitModel.abbreviation" label="Singkatan"/>
                                                        <v-text-field color="accent" v-model="formNewUnitModel.description" label="Jenis Satuan"/>
                                                    </v-card-text>
                                                </v-form>
                                                <v-card-actions>
                                                    <v-container>
                                                        <v-row justify="center">
                                                            <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                                            <v-btn class="my-n9" color="blue darken-1" text @click="saveNewUnit">Save</v-btn>
                                                        </v-row>
                                                    </v-container>
                                                </v-card-actions>
                                            </v-card>
                                        </v-dialog>
                                        <!--  -->
                                    </v-row>
                                </v-col>
                                <v-col cols="4">
                                    <v-text-field label="Open Price" v-model="product.open_price"/>
                                </v-col>
                                <v-col cols="4">
                                    <v-text-field label="Bottom Price" v-model="product.bottom_price"/>
                                </v-col>
                                <v-col cols="4">
                                    <v-text-field label="Stock" v-model="product.stock"/>
                                </v-col>
                                <v-col cols="12">
                                    <v-textarea label="Deskripsi" v-model="product.description" outlined/>
                                </v-col>
                                <v-col cols="12" class="mt-n7">
                                    <v-row no-gutters class="align-center">
                                        <v-col cols="11">
                                            <v-autocomplete
                                                v-model="product.tag"
                                                :items="tags"
                                                label="Tag"
                                                multiple
                                                chips
                                                deletable-chips= "true"
                                                hint="Bisa memilih lebih dari 1 Tag"
                                                persistent-hint
                                                color="accent"
                                                item-color="accent"
                                                :search-input.sync="searchInput"
                                                @change="searchInput=''"
                                                item-text="name"
                                                item-value="id"
                                            >
                                            </v-autocomplete>
                                        </v-col>
                                        <v-col cols="1">
                                            <v-tooltip bottom color="accent">
                                                <template v-slot:activator="{ on }">
                                                    <v-btn
                                                        text
                                                        icon
                                                        color="accent"
                                                        v-on="on"
                                                        @click="popUpNewTag = !popUpNewTag"
                                                    >
                                                        <v-icon>mdi-plus</v-icon>
                                                    </v-btn>
                                                </template>
                                                <span>Tambah Tag Baru</span>
                                            </v-tooltip>
                                        </v-col>
                                        <!-- Dialog New Kategori -->
                                        <v-dialog v-model="popUpNewTag" persistent max-width="350px" style="z-index:10">
                                            <v-card>
                                                <v-form ref="form">
                                                    <v-card-text>
                                                        <v-text-field color="accent" v-model="formNewTagModel" label="Nama Tag"/>
                                                    </v-card-text>
                                                </v-form>
                                                <v-card-actions>
                                                    <v-container>
                                                        <v-row justify="center">
                                                            <v-btn class="my-n9" color="red darken-1" text @click="close">Batal</v-btn>
                                                            <v-btn class="my-n9" color="blue darken-1" text @click="saveNewTag">Save</v-btn>
                                                        </v-row>
                                                    </v-container>
                                                </v-card-actions>
                                            </v-card>
                                        </v-dialog>
                                        <!--  -->
                                    </v-row>
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
                    <v-card-text>Apakah Anda Yakin ingin mengubah barang <b>{{product.name}}</b></v-card-text>
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
import _ from "lodash"

export default {
    name: 'Barang',
    mounted() {
        this.get()
    },
    data() {
        return {
            snackbar: false,
            snackbarMessage: '',
            snackbarColor: '',
            advanceSearch: {
                name:'',
                stock_down:null,
                stock_up:null,
                open_price_down:null,
                open_price_up:null,
                category:''
            },
            products: [],
            product: {
                id:null,
                name:'',
                open_price:null,
                bottom_price:null,
                specification:'',
                stock:null,
                category_id:null,
                unit_id:null,
                tag:[],
                image:[]
            },
            categoryName:'',
            unitName:'',
            productDefault: {
                id:null,
                name:'',
                open_price:null,
                bottom_price:null,
                specification:'',
                stock:null,
                category_id:null,
                unit_id:null,
                tag:[],
                image:[]
            },
            productQuickEdit: {
                id:null,
                name:'',
                open_price:null
            },
            productQuickEditDefault: {
                id:null,
                name:'',
                open_price:null
            },
            categories: [],
            units: [],
            tags: [],
            formNewCategoryModel:'',
            formNewUnitModel: {
                id:null,
                name:'',
                abbreviation:'',
                description:''
            },
            formNewUnitModelDefault: {
                id:null,
                name:'',
                abbreviation:'',
                description:''
            },
            productImageSelected:'',
            searchInput:'',
            formNewTagModel: '',
            editToggle:false,
            popUpQuickEdit: false,
            popUpNew: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSaveQuickEdit: false,
            popUpConfirmSaveEdit: false,
            popUpNewCategory: false,
            popUpNewUnit: false,
            popUpNewTag: false,
            showAdvanceSearchOption: false,
            selectedIndex: -1,
        }
    },

    methods: {
        get() {
            api.getAllProducts()
                .then(products => {
                    this.products = products
                })
            api.getAllCategory()
                .then(categories => {
                    this.categories = categories
                })
            api.getAllUnit()
                .then(units => {
                    this.units = units
                })
        },
        // Advance Search
        showAdvanceSearch() {
            if(!this.showAdvanceSearchOption) {
                this.showAdvanceSearchOption = true
            } else {
                if(this.showAdvanceSearchOption) {
                    this.showAdvanceSearchOption = false
                }
            }
        },
        clearAllAdvanceSearch() {
            this.advanceSearch.name = ''
            this.advanceSearch.stock_down = null
            this.advanceSearch.stock_up = null
            this.advanceSearch.category = ''
            this.advanceSearch.open_price_down = null
            this.advanceSearch.open_price_up = null

        },
        advanceSearchName(val) {
            if(!this.advanceSearch.name) {
                return true
            }
            return val.toLowerCase().includes(this.advanceSearch.name.toLowerCase())
        },
        advanceSearchOpenPrice(val) {
            if(!this.advanceSearch.open_price_down && !this.advanceSearch.open_price_up) {
                return true
            }
            if(this.advanceSearch.open_price_down && !this.advanceSearch.open_price_up) {
                return val >= +this.advanceSearch.open_price_down
            } else {
                if(!this.advanceSearch.open_price_down && this.advanceSearch.open_price_up) {
                    return val <= +this.advanceSearch.open_price_up
                } else {
                    if(this.advanceSearch.open_price_down && this.advanceSearch.open_price_up) {
                        return (val >= +this.advanceSearch.open_price_down && val <= +this.advanceSearch.open_price_up)
                    }
                }
            }
        },
        advanceSearchStock(val) {
            if(!this.advanceSearch.stock_down && !this.advanceSearch.stock_up) {
                return true
            }
            if(this.advanceSearch.stock_down && !this.advanceSearch.stock_up) {
                return val >= +this.advanceSearch.stock_down
            } else {
                if(!this.advanceSearch.stock_down && this.advanceSearch.stock_up) {
                    return val <= +this.advanceSearch.stock_up
                } else {
                    if(this.advanceSearch.stock_down && this.advanceSearch.stock_up) {
                        return (val >= +this.advanceSearch.stock_down && val <= +this.advanceSearch.stock_up)
                    }
                }
            }
        },
        advanceSearchCategory(val) {
            if(!this.advanceSearch.category) {
                return true
            }
            return val === this.advanceSearch.category
        },
        details(item) {
            this.selectedIndex = this.products.indexOf(item)
            this.product = Object.assign({},item)
            this.categoryName = _.find(this.categories,['id', this.product.category_id]).name
            this.unitName = _.find(this.units,['id', this.product.unit_id]).name
            this.popupDetails = true
            this.productImageSelected = this.product.image[0]
        },
        close() {
            if(this.popupDetails) {
                this.popupDetails = false
                this.product = Object.assign({},this.productDefault)
                this.selectedIndex = -1
                this.productImageSelected = ''
                this.categoryName = ''
            } else {
                if(this.popUpNew) {
                    if(this.popUpNewCategory) {
                        this.popUpNewCategory = false
                        this.formNewCategoryModel = ''
                    } else {
                        if(this.popUpNewUnit) {
                            this.popUpNewUnit = false
                            this.formNewUnitModel = Object.assign({},this.formNewUnitModelDefault)
                        } else {
                            if(this.popUpNewTag) {
                                this.popUpNewTag = false
                                this.formNewTagModel = ''
                            } else {
                                this.popUpNew = false
                                this.product = Object.assign({},this.productDefault)
                            }
                        }
                    }
                } else {
                    if(this.popUpQuickEdit) {
                        this.popUpQuickEdit = false
                        this.productQuickEdit = Object.assign({},this.productQuickEditDefault)
                    } else {
                        if(this.popUpEdit) {
                            if(this.popUpNewCategory) {
                                this.popUpNewCategory = false
                                this.formNewCategoryModel = ''
                            } else {
                                if(this.popUpNewUnit) {
                                    this.popUpNewUnit = false
                                    this.formNewUnitModel = Object.assign({},this.formNewUnitModelDefault)
                                } else {
                                    if(this.popUpNewTag) {
                                        this.popUpNewTag = false
                                        this.formNewTagModel = ''
                                    } else {
                                        this.popUpEdit = false
                                        this.product = Object.assign({},this.productDefault)
                                        this.selectedIndex = -1
                                    }
                                }
                            }
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
            this.selectedIndex = this.products.indexOf(item)
            this.productQuickEdit.open_price = item.open_price
            this.productQuickEdit.name = item.name
            this.productQuickEdit.id = item.id
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
            let obj = this.products.find( ({id}) => id === this.productQuickEdit.id )
            this.products[this.products.indexOf(obj)].open_price = this.productQuickEdit.open_price
            this.popUpConfirmSaveQuickEdit = false
            this.productQuickEdit = Object.assign({},this.productQuickEditDefault)
        },
        editProduct(item) {
            this.selectedIndex = this.products.indexOf(item)
            this.product = Object.assign({},item)
            this.popUpEdit = true
        },
        save() {
            let obj = this.products.find( ({id}) => id === this.product.id )
            var loop = Object.getOwnPropertyNames(this.productDefault)
            for(let i=0; i<loop.length; i++) {
                this.products[this.products.indexOf(obj)][loop[i]] = this.product[loop[i]]
            }
            this.popUpConfirmSaveEdit = false
            this.product = Object.assign({},this.productDefault)
        },
        saveNewCategory() {
            api.addCategory(this.formNewCategoryModel)
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
        },
        saveNewProduct() {
            if(this.$refs.form.validate()) {
                this.products.push(this.product)
                this.product = Object.assign({},this.productDefault)
                this.close()
            }
        },
        changePic(val) {
            this.productImageSelected = val
        }
    },
    
    computed: {
        productHeaders() {
            return [
                {text:'Nama', value:'name', width:'70%', filter:this.advanceSearchName},
                {text:'Open Price', value:'open_price', align:'center', filter:this.advanceSearchOpenPrice},
                {text:'Stock', value:'stock', filter:this.advanceSearchStock},
                {value:'actions',width:'7%'},
                {value:'category_id', align: ' d-none', filter:this.advanceSearchCategory},
                {value:'bottom_price', align: ' d-none', filter:this.advanceSearchbottomPrice},

            ]
        },
        //view Breakpoint
        popUpBreakPoint() {
            if (this.$vuetify.breakpoint.name == 'xs') {
                return true
            } else {
                return false
            }
        }
    },

    watch: {
        popupDetails() {
            if(this.popupDetails == false) {
                this.productImageSelected = ''
                this.product = Object.assign({},this.productDefault)
            }
        }
    },
    
}
</script>

<style scoped>

    .descTable tr td {
        height: 35px
    }

    .showAdvanceSearchOptionText {
        color: red;
    -webkit-touch-callout: none; /* iOS Safari */
        -webkit-user-select: none; /* Safari */
        -khtml-user-select: none; /* Konqueror HTML */
        -moz-user-select: none; /* Firefox */
            -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                    supported by Chrome and Opera */
    }

</style>