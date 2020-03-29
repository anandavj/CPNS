<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search StockOpname in StockOpnames Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Nomor Stock Opname"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchStockOpnameNumber"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Stock Opname -->
            <!-- *************************************************************************************************************** -->
            <v-btn fab dark large color="primary" fixed right bottom @click="newStockOpnameDialog = !newStockOpnameDialog"><v-icon dark>mdi-plus</v-icon></v-btn>
            <v-container class="my-n3">
                <v-dialog v-model="newStockOpnameDialog" fullscreen hide-overlay transition="dialog-bottom-transition">
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Stock Opname</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref='form' class='px-2'>
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12" class="mb-n8 mt-n4">
                                        <v-row justify="end">
                                            <v-col cols='2' v-if="!popUpBreakPoint">
                                                <v-menu
                                                    ref="showAdvancedatePickerDateStart"
                                                    v-model="showAdvancedatePickerDateStart"
                                                    :close-on-content-click="false"
                                                    transition="scale-transition"
                                                    offset-y
                                                    min-width="290px"
                                                >
                                                    <template v-slot:activator="{ on }">
                                                        <v-text-field
                                                        color="accent"
                                                        label="Tanggal Mulai"
                                                        append-icon="mdi-calendar"
                                                        :value="formatDate"
                                                        readonly
                                                        v-on="on"
                                                        :solo="true"
                                                        :clearable="true"
                                                        @click:clear="stockOpname.dateStart = null"
                                                        dense
                                                        class="mr-3"
                                                        ></v-text-field>
                                                    </template>
                                                    <v-date-picker v-model="stockOpname.dateStart" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateStart = false">
                                                    </v-date-picker>
                                                </v-menu>
                                            </v-col>
                                            <v-col cols='12' v-else>
                                                <v-menu
                                                    ref="showAdvancedatePickerDateStart"
                                                    v-model="showAdvancedatePickerDateStart"
                                                    :close-on-content-click="false"
                                                    transition="scale-transition"
                                                    offset-y
                                                    min-width="290px"
                                                >
                                                    <template v-slot:activator="{ on }">
                                                        <v-text-field
                                                        color="accent"
                                                        label="Tanggal Mulai"
                                                        append-icon="mdi-calendar"
                                                        :value="formatDate"
                                                        readonly
                                                        v-on="on"
                                                        :solo="true"
                                                        :clearable="true"
                                                        @click:clear="stockOpname.dateStart = null"
                                                        dense
                                                        class="mb-n5"
                                                        ></v-text-field>
                                                    </template>
                                                    <v-date-picker v-model="stockOpname.dateStart" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateStart = false">
                                                    </v-date-picker>
                                                </v-menu>
                                            </v-col>
                                            <v-col cols='2' v-if="!popUpBreakPoint">
                                                <v-menu
                                                    ref="showAdvancedatePickerDateFinish"
                                                    v-model="showAdvancedatePickerDateFinish"
                                                    :close-on-content-click="false"
                                                    transition="scale-transition"
                                                    offset-y
                                                    min-width="290px"
                                                >
                                                    <template v-slot:activator="{ on }">
                                                        <v-text-field
                                                        color="accent"
                                                        label="Tanggal Selesai"
                                                        append-icon="mdi-calendar"
                                                        :value="formatDateFinish"
                                                        readonly
                                                        v-on="on"
                                                        :solo="true"
                                                        :clearable="true"
                                                        @click:clear="stockOpname.dateFinish = null"
                                                        dense
                                                        class="mr-3"
                                                        ></v-text-field>
                                                    </template>
                                                    <v-date-picker v-model="stockOpname.dateFinish" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateFinish = false">
                                                    </v-date-picker>
                                                </v-menu>
                                            </v-col>
                                            <v-col cols='12' v-else>
                                                <v-menu
                                                    ref="showAdvancedatePickerDateFinish"
                                                    v-model="showAdvancedatePickerDateFinish"
                                                    :close-on-content-click="false"
                                                    transition="scale-transition"
                                                    offset-y
                                                    min-width="290px"
                                                >
                                                    <template v-slot:activator="{ on }">
                                                        <v-text-field
                                                        color="accent"
                                                        label="Tanggal Selesai"
                                                        append-icon="mdi-calendar"
                                                        :value="formatDateFinish"
                                                        readonly
                                                        v-on="on"
                                                        :solo="true"
                                                        :clearable="true"
                                                        @click:clear="stockOpname.dateFinish = null"
                                                        dense
                                                        class="mr-3"
                                                        ></v-text-field>
                                                    </template>
                                                    <v-date-picker v-model="stockOpname.dateFinish" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateFinish = false">
                                                    </v-date-picker>
                                                </v-menu>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <v-col cols='12' class='mt-n5'>
                                        <v-row justify="end">
                                            <v-col cols='4'>
                                                <v-divider></v-divider>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <v-col cols='8' class='my-n5' v-if="!popUpBreakPoint">
                                        <v-text-field v-model="stockOpname.opnameNumber" dense color='accent' outlined label="Nomor Stock Opname"/>
                                    </v-col>
                                    <v-col cols='12' class='my-n5' v-else>
                                        <v-text-field v-model="stockOpname.opnameNumber" dense color='accent' outlined label="Nomor Stock Opname"/>
                                    </v-col>
                                    <v-col cols='4' class='my-n5' v-if="!popUpBreakPoint">
                                        <v-select
                                            v-model="stockOpname.status"
                                            :items="opnameStatusSelection"
                                            label="Hasil Periksa"
                                            outlined
                                            dense
                                            color="accent"
                                        ></v-select>
                                    </v-col>
                                    <v-col cols='12' class='my-n5' v-else>
                                        <v-select
                                            v-model="stockOpname.status"
                                            :items="opnameStatusSelection"
                                            label="Hasil Periksa"
                                            outlined
                                            dense
                                            color="accent"
                                        ></v-select>
                                    </v-col>
                                    <v-col cols='12' class='my-n5'>
                                        <v-textarea v-model="stockOpname.description" dense color="accent" outlined :auto-grow="true" label="keterangan"></v-textarea>
                                    </v-col>
                                    <v-col cols='12' class='my-n4'>
                                        <v-data-table
                                            :headers="newProductStockOpnameHeader"
                                            :items="stockOpname.products"
                                            :disable-sort="true"
                                            :disable-filtering="true"
                                            :mobile-breakpoint="1"
                                        >
                                            <template v-slot:body.append>
                                                <tr>
                                                    <td>
                                                        <v-autocomplete
                                                            color="accent"
                                                            dense
                                                            v-model="newProduct.productId"
                                                            chips
                                                            :items="products"
                                                            :clearable="true"
                                                            :auto-select-first="true"
                                                            item-color="blue"
                                                            :search-input.sync="newProductSearchId"
                                                            @click:clear="clearNewProduct"
                                                            @change='onChangenewProductSearchId'
                                                            item-text="id"
                                                            item-value="id"
                                                            :readonly="newProduct.productId!=null"
                                                        >
                                                            <template v-slot:selection="data">
                                                                <v-chip color="transparent" class="pa-0">
                                                                    {{data.item.id}}
                                                                </v-chip>
                                                            </template>
                                                        </v-autocomplete>
                                                    </td>
                                                    <td>
                                                        <v-autocomplete
                                                            color="accent"
                                                            dense
                                                            v-model="newProduct.productName"
                                                            chips
                                                            :items="products"
                                                            :clearable="true"
                                                            :auto-select-first="true"
                                                            item-color="blue"
                                                            :search-input.sync="newProductSearchName"
                                                            @click:clear="clearNewProduct"
                                                            @change='onChangenewProductSearchProductName'
                                                            item-text="name"
                                                            item-value="name"
                                                            :readonly="newProduct.productName!=null"
                                                        >
                                                            <template v-slot:selection="data">
                                                                <v-chip color="transparent" class="pa-0">
                                                                    {{data.item.name}}
                                                                </v-chip>
                                                            </template>
                                                        </v-autocomplete>
                                                    </td>
                                                    <td>
                                                        <v-btn color="green" outlined @click="addNewProduct"><v-icon>mdi-plus</v-icon></v-btn>
                                                    </td>
                                                </tr>
                                            </template>
                                        </v-data-table>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-form>
                        <v-card-actions>
                            <v-container>
                                <v-row justify="center">
                                    <v-btn color="red darken-1" text @click="close">Batal</v-btn>
                                    <v-btn color="blue white--text" @click="insertStockOpname">Buat Stock Opname</v-btn>
                                </v-row>
                            </v-container>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </v-container>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!--  List Stock Opname-->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="stockOpnamesHeader"
                :items="stockOpnames"
                @click:row="details"
                :mobile-breakpoint="1"
                no-data-text="tidak ada Stock Opname Hari ini"
                no-results-text="Nomor Stock Opname tidak ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            ></v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->
            
            <!-- *************************************************************************************************************** -->
            <!-- Detail -->
            <!-- *************************************************************************************************************** -->
            <v-dialog v-model="detailsDialog" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat> 
                        <span class="title font-weight-light">LAPORAN STOCK OPNAME</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref='form' class='px-2'>
                        <v-card-text>
                            <v-row>
                                <v-col cols="12" class="mb-n8 mt-n4">
                                    <v-row justify="end">
                                        <v-col cols='2' v-if="!popUpBreakPoint">
                                            <v-menu
                                                ref="showAdvancedatePickerDateStart"
                                                v-model="showAdvancedatePickerDateStart"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-text-field
                                                    disabled
                                                    color="accent"
                                                    label="Tanggal Mulai"
                                                    append-icon="mdi-calendar"
                                                    :value="formatDate"
                                                    readonly
                                                    v-on="on"
                                                    :solo="true"
                                                    :clearable="true"
                                                    @click:clear="stockOpname.dateStart = null"
                                                    dense
                                                    class="mr-3"
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="stockOpname.dateStart" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateStart = false">
                                                </v-date-picker>
                                            </v-menu>
                                        </v-col>
                                        <v-col cols='12' v-else>
                                            <v-menu
                                                ref="showAdvancedatePickerDateStart"
                                                v-model="showAdvancedatePickerDateStart"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-text-field
                                                    disabled
                                                    color="accent"
                                                    label="Tanggal Mulai"
                                                    append-icon="mdi-calendar"
                                                    :value="formatDate"
                                                    readonly
                                                    v-on="on"
                                                    :solo="true"
                                                    :clearable="true"
                                                    @click:clear="stockOpname.dateStart = null"
                                                    dense
                                                    hint="Tanggal Mulai"
                                                    :persistent-hint="true"
                                                    class="mb-n5"
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="stockOpname.dateStart" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateStart = false">
                                                </v-date-picker>
                                            </v-menu>
                                        </v-col>
                                        <v-col cols='2' v-if="!popUpBreakPoint">
                                            <v-menu
                                                ref="showAdvancedatePickerDateFinish"
                                                v-model="showAdvancedatePickerDateFinish"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-text-field
                                                    disabled
                                                    color="accent"
                                                    label="Tanggal Selesai"
                                                    append-icon="mdi-calendar"
                                                    :value="formatDateFinish"
                                                    readonly
                                                    v-on="on"
                                                    :solo="true"
                                                    :clearable="true"
                                                    @click:clear="stockOpname.dateFinish = null"
                                                    dense
                                                    class="mr-3"
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="stockOpname.dateFinish" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateFinish = false">
                                                </v-date-picker>
                                            </v-menu>
                                        </v-col>
                                        <v-col cols='12' v-else>
                                            <v-menu
                                                ref="showAdvancedatePickerDateFinish"
                                                v-model="showAdvancedatePickerDateFinish"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-text-field
                                                    disabled
                                                    color="accent"
                                                    label="Tanggal Selesai"
                                                    append-icon="mdi-calendar"
                                                    :value="formatDateFinish"
                                                    readonly
                                                    v-on="on"
                                                    :solo="true"
                                                    :clearable="true"
                                                    @click:clear="stockOpname.dateFinish = null"
                                                    dense
                                                    hint="Tanggal Selesai"
                                                    :persistent-hint="true"
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="stockOpname.dateFinish" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerDateFinish = false">
                                                </v-date-picker>
                                            </v-menu>
                                        </v-col>
                                    </v-row>
                                </v-col>
                                <v-col cols='12' class='mt-n5'>
                                    <v-row justify="end">
                                        <v-col cols='4'>
                                            <v-divider></v-divider>
                                        </v-col>
                                    </v-row>
                                </v-col>
                                <v-col cols='8' class='my-n5' v-if="!popUpBreakPoint">
                                    <v-text-field disabled v-model="stockOpname.opnameNumber" dense color='accent' outlined label="Nomor Stock Opname"/>
                                </v-col>
                                <v-col cols='12' class='my-n5' v-else>
                                    <v-text-field disabled v-model="stockOpname.opnameNumber" dense color='accent' outlined label="Nomor Stock Opname"/>
                                </v-col>
                                <v-col cols='4' class='my-n5' v-if="!popUpBreakPoint">
                                    <v-select
                                        disabled
                                        v-model="stockOpname.status"
                                        :items="opnameStatusSelection"
                                        label="Hasil Periksa"
                                        outlined
                                        dense
                                        color="accent"
                                    ></v-select>
                                </v-col>
                                <v-col cols='12' class='my-n5' v-else>
                                    <v-select
                                        disabled
                                        v-model="stockOpname.status"
                                        :items="opnameStatusSelection"
                                        label="Hasil Periksa"
                                        outlined
                                        dense
                                        color="accent"
                                    ></v-select>
                                </v-col>
                                <v-col cols='12' class='my-n5'>
                                    <v-textarea disabled v-model="stockOpname.description" dense color="accent" outlined :auto-grow="true" label="keterangan"></v-textarea>
                                </v-col>
                                <v-col cols='12' class='my-n4'>
                                    <v-data-table
                                        :headers="productCheckStockOpnameHeader"
                                        :items="stockOpname.products"
                                        :disable-sort="true"
                                        :disable-filtering="true"
                                        v-if="!popUpBreakPoint"
                                    >
                                    </v-data-table>
                                    <v-data-table
                                        :headers="productCheckStockOpnameHeader"
                                        :items="stockOpname.products"
                                        :disable-sort="true"
                                        :disable-filtering="true"
                                        v-else
                                        class="mt-n8"
                                    >
                                        <template v-slot:body.prepend="{ headers }">
                                            <tr>
                                                <td :colspan="headers.length" class="text-center">
                                                    Daftar Barang ({{counter}} / {{stockOpname.products.length}})
                                                </td>
                                            </tr>
                                        </template>
                                        <template v-slot:item="{ item }">
                                            <v-card class="mt-1 mb-3 mx-2 pa-2" color="grey lighten-2" outlined v-if="item.opnameStock == null">
                                                <div>
                                                    <v-card-title class="body-2">{{item.productName}}</v-card-title>
                                                    <v-card-subtitle>{{item.productId}}</v-card-subtitle>
                                                </div>
                                                <div class="d-flex flex-no-wrap justify-space-between mt-n4">
                                                    <div>
                                                        <v-card-subtitle class="mt-n4">Stock Databse</v-card-subtitle>
                                                        <v-card-subtitle class="mt-n6">Stock Perhitungan</v-card-subtitle>
                                                    </div>
                                                    <div align="center">
                                                        <v-card-subtitle class="mt-n4">{{item.realStock}}</v-card-subtitle>
                                                        <v-card-subtitle class="mt-n6"><v-icon class="red--text">mdi-minus</v-icon></v-card-subtitle>
                                                    </div>
                                                </div>
                                            </v-card>
                                            <v-card class="mt-1 mb-3 mx-2 pa-2" color="blue lighten-4" v-else>
                                                <div>
                                                    <v-card-title class="body-2">{{item.productName}}</v-card-title>
                                                    <v-card-subtitle>{{item.productId}}</v-card-subtitle>
                                                </div>
                                                <div class="d-flex flex-no-wrap justify-space-between mt-n4">
                                                    <div>
                                                        <v-card-subtitle class="mt-n4">Stock Databse</v-card-subtitle>
                                                        <v-card-subtitle class="mt-n6">Stock Perhitungan</v-card-subtitle>
                                                    </div>
                                                    <div align="center">
                                                        <v-card-subtitle class="mt-n4">{{item.realStock}}</v-card-subtitle>
                                                        <v-card-subtitle class="mt-n6">{{item.opnameStock}}</v-card-subtitle>
                                                    </div>
                                                </div>
                                            </v-card>
                                        </template>
                                    </v-data-table>
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions v-if="stockOpname.status != 'Selesai'">
                        <v-container>
                            <v-row justify="center">
                                <v-btn color="red darken-1" text @click="close">Batal</v-btn>
                                <v-btn color="blue white--text" @click="opnameProduct">Mulai</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <v-dialog v-model="opnameProductDialog" fullscreen hide-overlay>
                <v-card>
                    <v-toolbar dense flat> 
                        <span class="title font-weight-light">STOCK OPNAME</span>
                        <v-btn absolute right icon @click="closeProductStockOpname"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-card-title class="justify-center headline mt-n4">KODE STOCK OPNAME</v-card-title>
                            <v-card-subtitle class="text-center">{{stockOpname.opnameNumber}}</v-card-subtitle>
                            <v-col cols="12">
                                <v-select
                                    :items="opnameProductList"
                                    item-text="productName"
                                    :return-object="true"
                                    label="Pilih Barang"
                                    outlined
                                    dense
                                    color="accent"
                                    v-model="opnameProductSelected"
                                    class="mt-n4 mb-n4"
                                ></v-select>
                            </v-col>
                            <v-col cols="12" class="text-center mt-n10">
                                <v-card-text class="headline">Counter</v-card-text>
                                <v-btn :disabled="Object.keys(opnameProductSelected).length === 0" @click="opnameProductSelected.opnameStock++" color="primary" class="justify-center button"><v-icon class="display-4">mdi-plus</v-icon></v-btn>
                            </v-col>
                            <v-col cols="12" class="mt-n6 text-center">
                                <v-card-text class="title" v-if="Object.keys(opnameProductSelected).length !== 0">{{opnameProductSelected.opnameStock}} / {{opnameProductSelected.realStock}}</v-card-text>
                                <v-card-text class="title" v-else>- / -</v-card-text>
                                <div v-if="Object.keys(opnameProductSelected).length !== 0" class="mt-n6 mb-n2">
                                    <v-card-text class="red--text" v-if="opnameProductSelected.opnameStock < opnameProductSelected.realStock">Stock Kurang Dari Stock Di Database</v-card-text>
                                    <v-card-text class="green--text" v-if="opnameProductSelected.opnameStock == opnameProductSelected.realStock">Stock Pas</v-card-text>
                                    <v-card-text class="red--text" v-if="opnameProductSelected.opnameStock > opnameProductSelected.realStock">Stock Lebih Dari Stock Di Database</v-card-text>
                                </div>
                            </v-col>
                            <v-col cols="12" class="text-center mt-n10 mb-n8 ">
                                <v-card-text class="title">ATAU</v-card-text>
                            </v-col>
                            <v-col cols="12" class="mb-n6">
                                <v-row justify="center">
                                    <v-col cols="12">
                                        <v-text-field
                                            v-model.number="opnameProductSelected.opnameStock"
                                            color="accent"
                                            outlined
                                            dense
                                            label="Input Manual"
                                            :disabled="Object.keys(opnameProductSelected).length === 0"
                                            :filled="Object.keys(opnameProductSelected).length === 0"
                                        />
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col cols="12" class="text-center mt-n10">
                                <v-textarea
                                    v-model="opnameProductSelected.description"
                                    label="Keterangan (Opsional)"
                                    :auto-grow="true"
                                    outlined
                                    rows="1"
                                    :disabled="Object.keys(opnameProductSelected).length === 0"
                                    :filled="Object.keys(opnameProductSelected).length === 0"
                                />
                            </v-col>
                        </v-card-text>
                    </v-form>
                    <v-card-actions class="mt-n12">
                        <v-container>
                            <v-row justify="center">
                                <v-col cols="6">
                                    <v-btn width="100%" x-large color="blue darken-1" class="body-2" outlined @click="closeProductStockOpname">Selesai (Keluar)</v-btn>
                                </v-col>
                                <v-col cols="6">
                                    <v-btn :disabled="Object.keys(opnameProductSelected).length === 0" width="100%" x-large color="green darken-1 white--text" @click="submitStockOpnameProduct">Submit</v-btn>
                                </v-col>
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
import moment from 'moment/src/moment'
import _ from 'lodash'

export default {
    name: 'StockOpname',

    mounted() {
        this.get()
    },

    data() {
        return {
            // Search goes here
            searchStockOpnameNumber: '',
            newProductSearchId:'',
            newProductSearchName:'',
            // Boolean data status goes here
            showAdvancedatePickerDateStart: false,
            showAdvancedatePickerDateFinish: false,
            // Dialog goes here
            newStockOpnameDialog: false,
            detailsDialog: false,
            opnameProductDialog: false,
            // Data and Json data preparation goes here
            opnameProductSelected: {},
            opnameProductSelectedDefault: {},
            opnameProductList:[],
            products:[],
            stockOpnames:[],
            opnameStatusSelection: [
                'Belum Diperiksa',
                'Proses',
                'Selesai',
            ],
            stockOpname: {
                id:null,
                opnameNumber:'',
                dateStart:'',
                dateFinish:'',
                status:'Belum Diperiksa',
                description:'',
                products:[]
            },
            stockOpnameDefault: {
                id:null,
                opnameNumber:'',
                dateStart:'',
                dateFinish:'',
                status:'Belum Diperiksa',
                description:'',
                products:[]
            },
            newProduct: {
                productId:null,
                productName:null,
                realStock:null,
                status:'Belum Diperiksa'
            },
            newProductDefault: {
                productId:null,
                productName:null,
                realStock:null,
                status:'Belum Diperiksa'
            },
            selectedIndex:-1,
            // Header goes here
            newProductStockOpnameHeader: [
                {text:'ID Barang', value:'productId', width:'30%'},
                {text:'Nama Barang', value:'productName'},
                {value:'actions',width:'10%'}
            ],
            productCheckStockOpnameHeader: [
                {text:'ID Barang', value:'productId', width:'30%'},
                {text:'Nama Barang', value:'productName'},
                {text:'Stock Database', value:'realStock'},
                {text:'Stock Perhitungan', value:'opnameStock'},
                {text:'Status', value:'status'}
            ],
            // SnackBar goes here
            snackbar: false,
            snackbarMessage: '',
            snackbarColor: '',
            opnameMessage:null,
            // Misc
            counter:null,
        }
    },

    methods: {
        get() {
            api.getAllStockOpname()
                .then(stockOpnames => {
                    this.stockOpnames = stockOpnames
                })
            api.getAllProducts()
                .then(products => {
                    this.products = products
                    products.forEach(product => {
                        if(product.specification!='undefined') product.name = product.name.concat(' || ',product.specification)
                    });
                })
        },
        close() {
            if(this.newStockOpnameDialog) {
                this.newStockOpnameDialog = false
                this.stockOpname = Object.assign({},this.stockOpnameDefault)
            } else {
                if(this.detailsDialog) {
                    this.detailsDialog = false
                    this.stockOpname = Object.assign({},this.stockOpnameDefault)
                } else {
                    if(this.opnameProductDialog) {
                        this.opnameProductDialog = false
                    } else {
                        if(this.opnameProductDialog) {
                            this.opnameProductDialog = false
                        }
                    }
                }
            }
            this.counter = 0
            this.opnameProductList = []
            this.opnameProductSelected = Object.assign({},this.opnameProductSelectedDefault)
        },
        closeProductStockOpname() {
            this.close()
            this.get()
        },
        dayFormat(date) {
            let i = new Date(date).getDay(date)
            var dayOftheWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
            return dayOftheWeek[i]
        },
        onChangenewProductSearchId() {
            this.newProductSearchId = null
            this.newProduct.productName = _.find(this.products,['id',this.newProduct.productId]).name
        },
        onChangenewProductSearchProductName() {
            this.newProductSearchName = null
            this.newProduct.productId = _.find(this.products,['name',this.newProduct.productName]).id
        },
        addNewProduct() {
            this.newProduct.realStock = _.find(this.products,['id',this.newProduct.productId]).stock
            this.stockOpname.products.push(this.newProduct)
            this.clearNewProduct()
        },
        clearNewProduct() {
            this.newProduct = Object.assign({},this.newProductDefault)
        },
        insertStockOpname() {

            api.addStockOpname(this.stockOpname)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    this.get()
                    this.stockOpname = Object.assign({},this.stockOpnameDefault)
                    this.close()
                })
        },
        details(item) {
            this.selectedIndex = this.stockOpnames.indexOf(item)
            this.stockOpname = Object.assign({},item)
            this.stockOpname.products.forEach(item => {
                if(item.opnameStock != null) this.counter++
            });
            this.detailsDialog = true
        },
        opnameProduct() {
            this.stockOpname.products.forEach(item => {
                if(item.opnameStock == null) this.opnameProductList.push(item)
            });
            this.detailsDialog = false
            this.opnameProductDialog = true
        },
        submitStockOpnameProduct() {
            this.opnameProductSelected.opnameDate = new Date().toISOString().substr(0, 10)
            this.opnameProductSelected.opnameId = this.stockOpname.id
            if(this.opnameProductSelected.description == null) {
                this.opnameProductSelected.description = '-'
            }
            api.updateProductStockOpname(this.opnameProductSelected)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                    const idx = this.opnameProductList.indexOf(this.opnameProductSelected)
                    this.opnameProductList.splice(idx, 1)
                    this.opnameProductSelected = Object.assign({},this.opnameProductSelectedDefault)
                }) .catch((error) => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    if(this.opnameProductList.length == 0) {
                        this.stockOpname.status = 'Selesai'
                    } else {
                        this.stockOpname.status = 'Proses'
                    }
                    api.updateStockOpname(this.stockOpname)
                    this.get()
                })
            
        }
    },

    computed: {
        formatDate() {
            return this.stockOpname.dateStart ? moment(this.stockOpname.dateStart).format('DD/MM/YYYY') : ''
        },
        formatDateFinish() {
            return this.stockOpname.dateFinish ? moment(this.stockOpname.dateFinish).format('DD/MM/YYYY') : ''
        },
        popUpBreakPoint() {
            if (this.$vuetify.breakpoint.name == 'xs') {
                return true
            } else {
                return false
            }
        },
        stockOpnamesHeader() {
            return [
                {text:'Nomor Stock Opname', value:'opnameNumber'},
                {text:'Status', value:'status'},
                {value:'actions'}
            ]
        }
    }
}
</script>

<style scoped>
    .button {
        padding: 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        border-radius: 50%;
        width: 200px;
        height: 200px !important;
    }
</style>