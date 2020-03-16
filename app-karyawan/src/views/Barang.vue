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
                <!-- PC / Laptop -->
                <v-expand-transition v-if="!popUpBreakPoint">
                    <v-col cols="12" v-if="showAdvanceSearchOption">
                        <v-row no-gutters>
                            <v-col cols="9">
                                <v-autocomplete
                                    v-model="advanceSearch.category"
                                    :items="categories"
                                    label="Kategori"
                                    solo
                                    dense
                                    :clearable="true"
                                    color="accent"
                                    :search-input.sync="categorySearchInput"
                                    @change="categorySearchInput=''"
                                    item-text="name"
                                    item-value="id"
                                    :persistent-hint="true"
                                    hint="Kategori"
                                    :readonly="advanceSearch.category != null"
                                />
                            </v-col>
                            <v-col cols="3">
                                <v-text-field
                                    label="Min Stock"
                                    solo
                                    :persistent-hint="true"
                                    hint="Stock Min"
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_down"
                                    class="ml-3"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="9">
                                <v-autocomplete
                                    v-model="advanceSearch.tags"
                                    class="mb-n4"
                                    :items="tags"
                                    label="Tag"
                                    solo
                                    :persistent-hint="true"
                                    hint="Tag"
                                    dense
                                    :clearable="true"
                                    color="accent"
                                    :search-input.sync="tagSearchInputFilter"
                                    @change="tagSearchInputFilter=''"
                                    item-text="tagName"
                                    item-value="id"
                                    :readonly="advanceSearch.tags != null"
                                />
                            </v-col>
                            <v-col cols="3">
                                <v-text-field
                                    label="Max Stock"
                                    solo
                                    :persistent-hint="true"
                                    hint="Max Stock"
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_up"
                                    class="ml-3"
                                    color="accent"
                                />
                            </v-col>
                        </v-row>
                    </v-col>
                </v-expand-transition>
                <!-- Mobile Phone -->
                <v-expand-transition v-else>
                    <v-col cols="12" v-if="showAdvanceSearchOption">
                        <v-row no-gutters>
                            <v-col cols="12">
                                <v-autocomplete
                                    v-model="advanceSearch.category"
                                    :items="categories"
                                    label="Kategori"
                                    solo
                                    :persistent-hint="true"
                                    hint="Kategori"
                                    dense
                                    :clearable="true"
                                    color="accent"
                                    :search-input.sync="categorySearchInput"
                                    @change="categorySearchInput=''"
                                    item-text="name"
                                    item-value="id"
                                    :readonly="advanceSearch.category != null"
                                />
                            </v-col>
                             <v-col cols="12">
                                <v-autocomplete
                                    v-model="advanceSearch.tags"
                                    :persistent-hint="true"
                                    hint="Tag"
                                    :items="tags"
                                    label="Tag"
                                    solo
                                    dense
                                    :clearable="true"
                                    color="accent"
                                    :search-input.sync="tagSearchInputFilter"
                                    @change="tagSearchInputFilter=''"
                                    item-text="tagName"
                                    item-value="id"
                                    :readonly="advanceSearch.tags != null"
                                />
                            </v-col>
                            <v-col cols="6">
                                <v-text-field
                                    label="Min Stock"
                                    solo
                                    :persistent-hint="true"
                                    hint="Min Stock"
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_down"
                                    class="mr-3"
                                    color="accent"
                                />
                            </v-col>
                            <v-col cols="6">
                                <v-text-field
                                    label="Max Stock"
                                    solo
                                    :persistent-hint="true"
                                    hint="Max Stock"
                                    dense
                                    :clearable="true"
                                    v-model="advanceSearch.stock_up"
                                    color="accent"
                                />
                            </v-col>
                        </v-row>
                    </v-col>
                </v-expand-transition>
                <v-col>
                    <v-btn class="body-2" text dense color="blue white--text"  @click="showAdvanceSearch"><span class="mr-1"><v-icon v-if="!showAdvanceSearchOption">mdi-filter-menu-outline</v-icon><v-icon v-else>mdi-filter-minus-outline</v-icon></span>Filter</v-btn>
                    <v-btn text :disabled="advanceSearch.name == '' && advanceSearch.tags == null && (advanceSearch.stock_down == '' || advanceSearch.stock_down == null) && (advanceSearch.stock_up == '' || advanceSearch.stock_up == null) && advanceSearch.category == null" v-if="showAdvanceSearchOption" dense @click="clearAllAdvanceSearch" class="caption showAdvanceSearchOptionText"><v-icon>mdi-filter-variant-remove</v-icon> Clear Filter</v-btn>
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
                                        <v-file-input v-model="product.images" color="accent" prepend-icon="mdi-camera" chips multiple accept="image/*" label="Upload Gambar Produk"></v-file-input>
                                    </v-col>
                                    <!--  -->
                                    <v-col cols="12" class="my-n4">
                                        <div class="title">Informasi Produk</div>
                                    </v-col>
                                    <v-col cols="6" v-if="!popUpBreakPoint">
                                        <v-text-field label="Nama" color="accent" v-model="product.name" :rules="rules.productName"/>
                                    </v-col>
                                    <v-col cols="12" v-else class="mt-n4">
                                        <v-text-field label="Nama" color="accent" v-model="product.name" :rules="rules.productName"/>
                                    </v-col>
                                    <v-col cols="6" v-if="!popUpBreakPoint">
                                        <v-text-field label="Spesifikasi" color="accent" v-model="product.specification" :rules="rules.productSpecification"/>
                                    </v-col>
                                    <v-col cols="12" v-else class="mt-n4">
                                        <v-text-field label="Spesifikasi" color="accent" v-model="product.specification" :rules="rules.productSpecification"/>
                                    </v-col>
                                    <v-col cols="6" v-if="!popUpBreakPoint" class="mt-n6">
                                        <v-text-field label="Kode Produk" color="accent" v-model="product.productCode" :rules="rules.productCode"/>
                                    </v-col>
                                    <v-col cols="12" v-else class="mt-n4">
                                        <v-text-field label="Kode Produk" color="accent" v-model="product.productCode" :rules="rules.productCode"/>
                                    </v-col>
                                     <v-col cols="6" v-if="!popUpBreakPoint" class="mt-n6">
                                        <v-text-field label="Retail ID" color="accent" v-model="product.retailId" :rules="rules.productRetailId"/>
                                    </v-col>
                                    <v-col cols="12" v-else class="mt-n4">
                                        <v-text-field label="Retail ID" color="accent" v-model="product.retailId" :rules="rules.productRetailId"/>
                                    </v-col>
                                    <!-- PC / LAPTOP -->
                                    <v-col cols="6" class="mt-n6" v-if="!popUpBreakPoint">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-autocomplete
                                                    class="mb-n4"
                                                    v-model="product.categoryId"
                                                    :items="categories"
                                                    label="Kategori"
                                                    chips
                                                    dense
                                                    :clearable="true"
                                                    :auto-select-first="true"
                                                    color="accent"
                                                    item-color="blue"
                                                    :search-input.sync="categorySearchInput"
                                                    @change="categorySearchInput=''"
                                                    item-text="name"
                                                    item-value="id"
                                                    :readonly="product.categoryId!=null"
                                                >
                                                    <template v-slot:selection="data">
                                                        <v-chip color="white" class="pa-0">
                                                            {{data.item.name}}
                                                        </v-chip>
                                                    </template>
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
                                                <v-autocomplete
                                                    v-model="product.categoryId"
                                                    :items="categories"
                                                    label="Kategori"
                                                    chips
                                                    dense
                                                    :clearable="true"
                                                    :auto-select-first="true"
                                                    color="accent"
                                                    item-color="blue"
                                                    :search-input.sync="categorySearchInput"
                                                    @change="categorySearchInput=''"
                                                    item-text="name"
                                                    item-value="id"
                                                    :readonly="product.categoryId!=null"
                                                >
                                                    <template v-slot:selection="data">
                                                        <v-chip color="white" class="pa-0">
                                                            {{data.item.name}}
                                                        </v-chip>
                                                    </template>
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
                                                    <v-text-field :rules="rules.newCategory" color="accent" outlined v-model="formNewCategoryModel" label="Nama Kategori"/>
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
                                    <v-col cols="6" class="mt-n6" v-if="!popUpBreakPoint">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-autocomplete
                                                    class="mb-n4"
                                                    v-model="product.unitId"
                                                    :items="units"
                                                    label="Satuan"
                                                    chips
                                                    dense
                                                    :clearable="true"
                                                    :auto-select-first="true"
                                                    color="accent"
                                                    item-color="blue"
                                                    :search-input.sync="unitSearchInput"
                                                    @change="unitSearchInput=''"
                                                    item-text="name"
                                                    item-value="id"
                                                    :readonly="product.unitId!=null"
                                                >
                                                    <template v-slot:selection="data">
                                                        <v-chip color="white" class="pa-0">
                                                            {{data.item.name}}
                                                        </v-chip>
                                                    </template>
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
                                                <v-autocomplete
                                                    v-model="product.unitId"
                                                    :items="units"
                                                    label="Satuan"
                                                    chips
                                                    dense
                                                    :clearable="true"
                                                    :auto-select-first="true"
                                                    color="accent"
                                                    item-color="blue"
                                                    :search-input.sync="unitSearchInput"
                                                    @change="unitSearchInput=''"
                                                    item-text="name"
                                                    item-value="id"
                                                    :readonly="product.unitId!=null"
                                                >
                                                    <template v-slot:selection="data">
                                                        <v-chip color="white" class="pa-0">
                                                            {{data.item.name}}
                                                        </v-chip>
                                                    </template>
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
                                                    <v-text-field :rules="rules.newUnit" color="accent" v-model="formNewUnitModel.name" label="Nama Unit"/>
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
                                        <v-text-field label="Open Price" color="accent" v-model="product.openPrice" :rules="rules.productOpenPrice"/>
                                    </v-col>
                                    <v-col cols="4" v-else>
                                        <v-text-field label="Open Price" color="accent" v-model="product.openPrice" :rules="rules.productOpenPrice"/>
                                    </v-col>
                                    <v-col cols="6" v-if="popUpBreakPoint" class="my-n4">
                                        <v-text-field label="Bottom Price" color="accent" v-model="product.bottomPrice" :rules="rules.productBottomPrice"/>
                                    </v-col>
                                    <v-col cols="4" v-else>
                                        <v-text-field label="Bottom Price" color="accent" v-model="product.bottomPrice" :rules="rules.productBottomPrice"/>
                                    </v-col>
                                    <v-col cols="12" v-if="popUpBreakPoint" class="my-n4">
                                        <v-text-field label="Stock" color="accent" v-model="product.stock" :rules="rules.productStock"/>
                                    </v-col>
                                    <v-col cols="4" v-else>
                                        <v-text-field label="Stock" color="accent" v-model="product.stock" :rules="rules.productStock"/>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-textarea label="Deskripsi (Opsional)" v-model="product.description" outlined/>
                                    </v-col>
                                    <v-col cols="12" class="mt-n7">
                                        <v-row no-gutters class="align-center">
                                            <v-col cols="11">
                                                <v-autocomplete
                                                    v-model="product.tags"
                                                    :items="tags"
                                                    label="Tag"
                                                    multiple
                                                    chips
                                                    dense
                                                    :deletable-chips= "true"
                                                    hint="Bisa memilih lebih dari 1 Tag"
                                                    persistent-hint
                                                    color="accent"
                                                    item-color="accent"
                                                    :search-input.sync="tagSearchInput"
                                                    @change="tagSearchInput=''"
                                                    item-text="tagName"
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
                                                            <v-text-field :rules="rules.newTag" color="accent" v-model="formNewTagModel" label="Nama Tag"/>
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
            <v-row justify="space-between" align="center" class="ma-0">
                <div>
                    <v-switch v-if="!popUpBreakPoint" value v-model="editToggle" class="pa-0 mb-0 mt-5" label="Edit Harga"></v-switch>
                </div>
                <div v-if="totalStocklowerThanMinStock>0">
                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }">
                            <v-btn @click="findStocklowerThanMinStock" text color="red" v-on="on">{{totalStocklowerThanMinStock}}<span class="ml-1">produk krisis stock</span><v-icon class="ml-2">mdi-alert-rhombus</v-icon></v-btn>
                        </template>
                        <span>Tampilkan</span>
                    </v-tooltip>
                </div>
            </v-row>
            <v-dialog v-model="findStocklowerThanMinStockDialog">
                <v-card min-height="700px">
                    <v-data-table
                        :headers="productsUnderHeaders"
                        :items="productsUnder"
                        :mobile-breakpoint="1"
                        :disable-sort="true"
                        :search="productsUnderSearch"
                    >
                        <template v-slot:top>
                            <v-col cols="12">
                                <v-text-field
                                    placeholder="Cari Barang"
                                    :solo='true'
                                    :clearable='true'
                                    append-icon="mdi-magnify"
                                    class="font-regular font-weight-light mb-n4"
                                    v-model="productsUnderSearch"
                                />
                            </v-col>
                        </template>
                        <template v-slot:item.name="{item}">
                            ({{item.id}}) - {{item.name}}
                        </template>
                    </v-data-table>
                </v-card>
            </v-dialog>
            <v-dialog v-model="popUpQuickEdit" persistent max-width='350px'>
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light"> Edit Harga</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-title>{{productQuickEdit.name}}</v-card-title>
                    <v-form ref="form">
                            <v-card-text><v-text-field color="blue" outlined v-model="productQuickEdit.openPrice" placeholder="Harga Barang" :rules="rules.productOpenPriceQuickEdit"></v-text-field></v-card-text>
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
            <!-- PC / Laptop -->
            <div v-if="!popUpBreakPoint">
                <v-data-table
                    :headers="productHeaders"
                    :items="products"
                    @click:row="details"
                    :footer-props="{
                        'items-per-page-options': [10, 50, 100, -1]
                    }"
                    item-key="nama"
                    no-data-text="Data Barang Kosong"
                    no-results-text="Data Barang Tidak Ditemukan"
                    class="font-regular font-weight-light mb-12 pb-4"
                    style="cursor:pointer;"
                    
                >
                    <template v-slot:item.actions="{ item }">
                        <v-icon class="mr-2" @click.stop="editProduct(item)">mdi-pencil</v-icon>
                        <v-icon @click.stop="deleteProduct(item)">mdi-delete</v-icon>
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
            </div>
            <!-- Mobile Phone -->
            <div v-else>
                <v-data-table
                    :headers="productHeaders"
                    :items="products"
                    @click:row="details"
                    :footer-props="{
                        'items-per-page-options': [10, 50, 100, -1]
                    }"
                    item-key="nama"
                    no-data-text="Data Barang Kosong"
                    no-results-text="Data Barang Tidak Ditemukan"
                    class="font-regular font-weight-light mt-n4 mb-12 pb-4"
                    style="cursor:pointer; background-color: #F5F5F5"
                >
                    <template v-slot:item="{ item }">
                        <v-card @click.stop="details(item)" class="mt-1 mb-3 mx-2 pa-2" color="white" outlined>
                            <div class="d-flex flex-no-wrap justify-space-between align-center">
                                <div>
                                    <v-card-title class="body-2 mt-n2">{{ item.name }}</v-card-title>
                                </div>
                                <div class="mt-n2 mr-n2">
                                    <v-menu
                                        :close-on-click="true"
                                        :close-on-content-click="true"
                                        :offset-y="true"
                                    >
                                        <template v-slot:activator="{ on }">
                                            <v-card-actions><v-icon v-on="on">mdi-dots-vertical</v-icon></v-card-actions>
                                        </template>
                                        <v-list>
                                            <v-list-item @click.stop="quickEdit(item)">
                                                <v-list-item-title>Edit Harga</v-list-item-title>
                                            </v-list-item>
                                            <v-list-item @click.stop="editProduct(item)">
                                                <v-list-item-title>Edit Produk</v-list-item-title>
                                            </v-list-item>
                                            <v-list-item @click.stop="deleteProduct(item)">
                                                <v-list-item-title>Hapus Produk</v-list-item-title>
                                            </v-list-item>
                                        </v-list>
                                    </v-menu>
                                </div>
                            </div>
                            <div class="d-flex flex-no-wrap justify-space-between align-center">
                                <div>
                                    <v-card-subtitle>{{item.stock}}</v-card-subtitle>
                                </div>
                                <div>
                                    <v-card-subtitle>Rp{{item.openPrice}}</v-card-subtitle>
                                </div>
                            </div>
                        </v-card>
                    </template>
                </v-data-table>
            </div>
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
                                <v-img :src="productImageSelected" v-if="productImageSelected != ''"></v-img>
                            </v-card>
                        </v-col>
                        <v-row>
                            <v-col cols="3" v-for="(img,index) in product.images" :key="index">
                                <v-card width="100%" @click="changePic(img)" v-if="product.images.length != 0">
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
                                v-for="(tag,idx) in product.tags" :key="idx"
                                small
                            >
                                {{revealTagName(tag)}}
                            </v-chip>
                        </v-col>
                        <v-col cols="12">
                            <table class="descTable">
                                <tr>
                                    <td>ID Barang</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.productCode}}</td>
                                </tr>
                                <tr>
                                    <td>Retail ID</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.retailId}}</td>
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
                                    <td>{{product.openPrice}}</td>
                                </tr>
                                <tr>
                                    <td>Bottom Price</td>
                                    <td width="25%" align="end">:</td>
                                    <td>{{product.bottomPrice}}</td>
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
                                    <v-col cols="3" v-for="(img,index) in product.images" :key="index">
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
                                            v-for="(tag,idx) in product.tags" :key="idx"
                                            small
                                        >
                                            {{revealTagName(tag)}}
                                        </v-chip>
                                    </v-col>
                                    <v-col cols="12">
                                        <table class="descTable">
                                            <tr>
                                                <td>ID Barang</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.productCode}}</td>
                                            </tr>
                                            <tr>
                                                <td>Retail ID</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.retailId}}</td>
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
                                                <td>{{product.openPrice}}</td>
                                            </tr>
                                            <tr>
                                                <td>Bottom Price</td>
                                                <td width="25%" align="end">:</td>
                                                <td>{{product.bottomPrice}}</td>
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
                                    <v-file-input v-model="product.images" color="accent" prepend-icon="mdi-camera" chips multiple accept="image/*" label="Upload Gambar Produk"></v-file-input>
                                </v-col>
                                <!--  -->
                                <v-col cols="12" class="my-n4">
                                    <div class="title">Informasi Produk</div>
                                </v-col>
                                <v-col cols="6" v-if="!popUpBreakPoint">
                                    <v-text-field label="Nama" color="accent" v-model="product.name" :rules="rules.productName"/>
                                </v-col>
                                <v-col cols="12" v-else class="mt-n4">
                                    <v-text-field label="Nama" color="accent" v-model="product.name" :rules="rules.productName"/>
                                </v-col>
                                <v-col cols="6" v-if="!popUpBreakPoint">
                                    <v-text-field label="Spesifikasi" color="accent" v-model="product.specification" :rules="rules.productSpecification"/>
                                </v-col>
                                <v-col cols="12" v-else class="mt-n4">
                                    <v-text-field label="Spesifikasi" color="accent" v-model="product.specification" :rules="rules.productSpecification"/>
                                </v-col>
                                <v-col cols="6" v-if="!popUpBreakPoint" class="mt-n6">
                                    <v-text-field label="Kode Produk" color="accent" v-model="product.productCode" :rules="rules.productCode"/>
                                </v-col>
                                <v-col cols="12" v-else class="mt-n4">
                                    <v-text-field label="Kode Produk" color="accent" v-model="product.productCode" :rules="rules.productCode"/>
                                </v-col>
                                    <v-col cols="6" v-if="!popUpBreakPoint" class="mt-n6">
                                    <v-text-field label="Retail ID" color="accent" v-model="product.retailId" :rules="rules.productRetailId"/>
                                </v-col>
                                <v-col cols="12" v-else class="mt-n4">
                                    <v-text-field label="Retail ID" color="accent" v-model="product.retailId" :rules="rules.productRetailId"/>
                                </v-col>
                                <v-col cols="6" class="mt-n6" v-if="!popUpBreakPoint">
                                    <v-row no-gutters class="align-center">
                                        <v-col cols="11">
                                            <v-autocomplete
                                                class="mb-n4"
                                                v-model="product.categoryId"
                                                :items="categories"
                                                label="Kategori"
                                                chips
                                                dense
                                                :clearable="true"
                                                :auto-select-first="true"
                                                color="accent"
                                                item-color="blue"
                                                :search-input.sync="categorySearchInput"
                                                @change="categorySearchInput=''"
                                                item-text="name"
                                                item-value="id"
                                                :readonly="product.categoryId!=null"
                                            >
                                                <template v-slot:selection="data">
                                                    <v-chip color="white" class="pa-0">
                                                        {{data.item.name}}
                                                    </v-chip>
                                                </template>
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
                                            <v-autocomplete
                                                v-model="product.categoryId"
                                                :items="categories"
                                                label="Kategori"
                                                chips
                                                dense
                                                :clearable="true"
                                                :auto-select-first="true"
                                                color="accent"
                                                item-color="blue"
                                                :search-input.sync="categorySearchInput"
                                                @change="categorySearchInput=''"
                                                item-text="name"
                                                item-value="id"
                                                :readonly="product.categoryId!=null"
                                            >
                                                <template v-slot:selection="data">
                                                    <v-chip color="white" class="pa-0">
                                                        {{data.item.name}}
                                                    </v-chip>
                                                </template>
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
                                                <v-text-field :rules="rules.newCategory" color="accent" outlined v-model="formNewCategoryModel" label="Nama Kategori"/>
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
                                <v-col cols="6" class="mt-n6" v-if="!popUpBreakPoint">
                                    <v-row no-gutters class="align-center">
                                        <v-col cols="11">
                                            <v-autocomplete
                                                class="mb-n4"
                                                v-model="product.unitId"
                                                :items="units"
                                                label="Satuan"
                                                chips
                                                dense
                                                :clearable="true"
                                                :auto-select-first="true"
                                                color="accent"
                                                item-color="blue"
                                                :search-input.sync="unitSearchInput"
                                                @change="unitSearchInput=''"
                                                item-text="name"
                                                item-value="id"
                                                :readonly="product.unitId!=null"
                                            >
                                                <template v-slot:selection="data">
                                                    <v-chip color="white" class="pa-0">
                                                        {{data.item.name}}
                                                    </v-chip>
                                                </template>
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
                                            <v-autocomplete
                                                v-model="product.unitId"
                                                :items="units"
                                                label="Satuan"
                                                chips
                                                dense
                                                :clearable="true"
                                                :auto-select-first="true"
                                                color="accent"
                                                item-color="blue"
                                                :search-input.sync="unitSearchInput"
                                                @change="unitSearchInput=''"
                                                item-text="name"
                                                item-value="id"
                                                :readonly="product.unitId!=null"
                                            >
                                                <template v-slot:selection="data">
                                                    <v-chip color="white" class="pa-0">
                                                        {{data.item.name}}
                                                    </v-chip>
                                                </template>
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
                                                <v-text-field :rules="rules.newUnit" color="accent" v-model="formNewUnitModel.name" label="Nama Unit"/>
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
                                    <v-text-field label="Open Price" color="accent" v-model="product.openPrice" :rules="rules.productOpenPrice"/>
                                </v-col>
                                <v-col cols="4" v-else>
                                    <v-text-field label="Open Price" color="accent" v-model="product.openPrice" :rules="rules.productOpenPrice"/>
                                </v-col>
                                <v-col cols="6" v-if="popUpBreakPoint" class="my-n4">
                                    <v-text-field label="Bottom Price" color="accent" v-model="product.bottomPrice" :rules="rules.productBottomPrice"/>
                                </v-col>
                                <v-col cols="4" v-else>
                                    <v-text-field label="Bottom Price" color="accent" v-model="product.bottomPrice" :rules="rules.productBottomPrice"/>
                                </v-col>
                                <v-col cols="12" v-if="popUpBreakPoint" class="my-n4">
                                    <v-text-field label="Stock" color="accent" v-model="product.stock" :rules="rules.productStock"/>
                                </v-col>
                                <v-col cols="4" v-else>
                                    <v-text-field label="Stock" color="accent" v-model="product.stock" :rules="rules.productStock"/>
                                </v-col>
                                <v-col cols="12">
                                    <v-textarea label="Deskripsi (Opsional)" v-model="product.description" outlined/>
                                </v-col>
                                <v-col cols="12" class="mt-n7">
                                    <v-row no-gutters class="align-center">
                                        <v-col cols="11">
                                            <v-autocomplete
                                                v-model="product.tags"
                                                :items="tags"
                                                label="Tag"
                                                multiple
                                                chips
                                                dense
                                                :deletable-chips= "true"
                                                hint="Bisa memilih lebih dari 1 Tag"
                                                persistent-hint
                                                color="accent"
                                                item-color="accent"
                                                :search-input.sync="tagSearchInput"
                                                @change="tagSearchInput=''"
                                                item-text="tagName"
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
                                                        <v-text-field :rules="rules.newTag" color="accent" v-model="formNewTagModel" label="Nama Tag"/>
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
            <!-- *************************************************************************************************************** -->
            <!-- Confirm on Edit -->
            <!-- *************************************************************************************************************** -->
            <v-dialog persistent v-model="popUpConfirmDelete" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin Menghapus barang <b>{{product.name}}</b></v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="confirmDeleteProduct">Ya</v-btn>
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
            productsUnderSearch: '',
            advanceSearch: {
                name:'',
                stock_down:null,
                stock_up:null,
                category:null,
                tags:null
            },
            products: [],
            productsUnder: [],
            product: {
                id:null,
                name:'',
                openPrice:null,
                bottomPrice:null,
                specification:'',
                stock:null,
                categoryId:null,
                unitId:null,
                tags:[],
                images:[],
                productCode:'',
                retailId:''
            },
            categoryName:'',
            unitName:'',
            productDefault: {
                id:null,
                name:'',
                openPrice:null,
                bottomPrice:null,
                specification:'',
                stock:null,
                categoryId:null,
                unitId:null,
                tags:[],
                images:[],
                productCode:'',
                retailId:''
            },
            productQuickEdit: {
                id:null,
                name:'',
                openPrice:null,
                bottomPrice:null
            },
            productQuickEditDefault: {
                id:null,
                name:'',
                openPrice:null,
                bottomPrice:null
            },
            categories: [],
            units: [],
            tags: [],
            formNewCategoryModel:'',
            formNewUnitModel: {
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
            categorySearchInput:'',
            unitSearchInput:'',
            tagSearchInput:'',
            tagSearchInputFilter:'',
            formNewTagModel: '',
            editToggle:false,
            popUpQuickEdit: false,
            popUpNew: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSaveQuickEdit: false,
            popUpConfirmSaveEdit: false,
            popUpConfirmDelete: false,
            popUpNewCategory: false,
            popUpNewUnit: false,
            popUpNewTag: false,
            showAdvanceSearchOption: false,
            findStocklowerThanMinStockDialog: false,
            selectedIndex: -1,
            totalStocklowerThanMinStock: 0,
            rules: {
                productName: [
                    v => !!v || 'Nama Produk Harus Diisi'
                ],
                productSpecification: [
                    v => !!v || 'Spesifikasi Harus Diisi'
                ],
                productCode: [
                    v => !!v || 'Kode Produk Harus Diisi'
                ],
                productRetailId: [
                    v => !!v || 'Retail ID Harus Diisi'
                ],
                productBottomPrice: [
                    v => !!v || 'Harga Harus Diisi',
                    v => v <= +this.product.bottomPrice || 'Harga Bottom Price Harus Lebih Rendah dari Harga Bottom Price',
                    v => v >= 0 || 'Harga tidak valid'
                ],
                productOpenPrice: [
                    v => !!v || 'Harga Harus Diisi',
                    v => v >= +this.product.bottomPrice || 'Harga Open Price Harus Lebih Tinggi dari Harga Bottom Price',
                    v => v >= 0 || 'Harga tidak valid'
                ],
                productStock: [
                    v => !!v || 'Stock Harus Diisi',
                    v => v >= 0 || 'Stock tidak valid'
                ],
                newCategory: [
                    v => !!v || 'Nama Kategori Tidak Valid'
                ],
                newUnit: [
                    v => !!v || 'Unit Tidak Valid'
                ],
                newTag: [
                    v => !!v || 'Tag Tidak Valid'
                ],
                productOpenPriceQuickEdit: [
                    v => !!v || 'Harga Harus Diisi',
                    v => v >= +this.productQuickEdit.bottomPrice || 'Harga Open Price Harus Lebih Tinggi dari Harga Bottom Price',
                    v => v >= 0 || 'Harga tidak valid'
                ]
            }
        }
    },

    methods: {
        get() {
            api.getAllProducts()
                .then(products => {
                    this.products = products
                    products.forEach(product => {
                        if(+product.minStock > +product.stock) {
                            this.totalStocklowerThanMinStock++
                            this.productsUnder.push(product)
                        }
                    })
                })
            api.getAllCategory()
                .then(categories => {
                    this.categories = categories
                })
            api.getAllUnit()
                .then(units => {
                    this.units = units
                })
            api.getAllTag()
                .then(tags => {
                    this.tags = tags
                })
        },
        findStocklowerThanMinStock() { 
            this.findStocklowerThanMinStockDialog = true
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
            this.advanceSearch.category = null
            this.advanceSearch.tags = null

        },
        advanceSearchName(val) {
            if(!this.advanceSearch.name) {
                return true
            }
            return val.toLowerCase().includes(this.advanceSearch.name.toLowerCase())
        },
        advanceSearchTags(val) {
            if(!this.advanceSearch.tags) {
                return true
            }
            return val.includes(this.advanceSearch.tags)
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
            this.categoryName = _.find(this.categories,['id', this.product.categoryId]).name
            this.unitName = _.find(this.units,['id', this.product.unitId]).abbreviation
            this.popupDetails = true
            this.productImageSelected = this.product.images[0]
        },
        revealTagName(tag) {
            return _.find(this.tags,['id', tag]).tagName
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
            this.productQuickEdit.bottomPrice = item.bottomPrice
            this.productQuickEdit.openPrice = item.openPrice
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
        saveEditedPrice() {
            api.updateProductOpenPrice(this.productQuickEdit)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllProducts()
                        .then((products) => {
                            this.productQuickEdit = Object.assign({},this.productQuickEditDefault)
                            this.products = products
                            this.popUpConfirmSaveQuickEdit = false
                        })
                })
        },
        editProduct(item) {
            this.selectedIndex = this.products.indexOf(item)
            this.product = Object.assign({},item)
            this.popUpEdit = true
        },
        deleteProduct(item) {
            this.selectedIndex = this.products.indexOf(item)
            this.product = Object.assign({},item)
            this.popUpConfirmDelete = true
        },
        confirmDeleteProduct() {
            api.deleteProduct(this.product)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllProducts()
                        .then((products) => {
                            this.product = Object.assign({},this.productDefault)
                            this.products = products
                            this.popUpConfirmDelete = false
                        })
                })
        },
        save() {
            api.updateProduct(this.product)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    api.getAllProducts()
                        .then((products) => {
                            this.product = Object.assign({},this.productDefault)
                            this.products = products
                            this.popUpConfirmSaveEdit = false
                        })
                })
        },
        saveNewCategory() {
            if(this.$refs.form.validate()) {
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
                                this.product.categoryId = _.find(this.categories,['name', this.formNewCategoryModel]).id
                                this.close()
                            })
                    })
            }
        },
        saveNewUnit() {
            if(this.$refs.form.validate()) {
                api.addUnit(this.formNewUnitModel)
                    .then((response) => {
                        this.snackbarColor = 'success'
                        this.snackbarMessage = response
                    }) .catch(error => {
                        this.snackbarColor = 'error'
                        this.snackbarMessage = error
                    }) .finally(() => {
                        this.snackbar = true
                        api.getAllUnit()
                            .then((units) => {
                                this.units = units
                                this.product.unitId = _.find(this.units,['name', this.formNewUnitModel.name]).id
                                this.close()
                            })
                    })
            }
        },
        saveNewTag() {
            if(this.$refs.form.validate()) {
                api.addTag(this.formNewTagModel)
                    .then((response) => {
                        this.snackbarColor = 'success'
                        this.snackbarMessage = response
                    }) .catch(error => {
                        this.snackbarColor = 'error'
                        this.snackbarMessage = error
                    }) .finally(() => {
                        this.snackbar = true
                        api.getAllTag()
                            .then((tags) => {
                                this.tags = tags
                                this.product.tags.push(_.find(this.tags,['tagName', this.formNewTagModel]).id)
                                this.close()
                            })
                    })
            }
        },
        saveNewProduct() {
            if(this.$refs.form.validate()) {
                api.addProduct(this.product)
                    .then((response) => {
                        this.snackbarColor = 'success'
                        this.snackbarMessage = response
                    }) .catch(error => {
                        this.snackbarColor = 'error'
                        this.snackbarMessage = error
                    }) .finally(() => {
                        this.snackbar = true
                        api.getAllProducts()
                            .then((products) => {
                                this.products = products
                                this.product = Object.assign({},this.productDefault)
                                this.close()
                            })
                    })
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
                {text:'Harga', value:'openPrice', align:'center'},
                {text:'Stock', value:'stock', filter:this.advanceSearchStock},
                {value:'actions',width:'10%'},
                {value:'categoryId', align: ' d-none', filter:this.advanceSearchCategory},
                {value:'tags', align: ' d-none', filter:this.advanceSearchTags},
            ]
        },
        productsUnderHeaders() {
            return [
                {text:'(ID Product) Nama', value:'name', width:'90%'},
                {text:'Stock', value:'stock'},
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
        },
        close() {
            this.$refs.form.resetValidation()
        },
        popUpNew() {
            this.$refs.form.resetValidation()
        },
        popUpEdit() {
            this.$refs.form.resetValidation()
        },
        popUpNewCategory() {
            this.$refs.form.resetValidation()
        },
        popUpNewUnit() {
            this.$refs.form.resetValidation()
        },
        popUpNewTag() {
            this.$refs.form.resetValidation()
        },
        popUpQuickEdit() {
            this.$refs.form.resetValidation()
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