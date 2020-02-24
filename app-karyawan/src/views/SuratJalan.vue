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
                        <!-- Search Surat Jalan -->
                        <v-row justify="end" no-gutters>
                            <v-col cols="12">
                                <v-text-field
                                    placeholder="Cari Nomor Surat Jalan"
                                    :solo="true"
                                    :clearable="true"
                                    append-icon="mdi-magnify"
                                    v-model="advanceSearch.nomor"
                                    class="mb-n4"
                                />
                            </v-col>
                            <!-- PC / Laptop view -->
                            <v-expand-transition v-if="!popUpBreakPoint">
                                <v-col cols="12" class="mb-n5" v-if="showAdvanceSearchOption">
                                    <v-row no-gutters>
                                        <v-col cols="4">
                                            <v-menu
                                                ref="showAdvancedatePickerMenuAdd"
                                                v-model="showAdvancedatePickerMenuAdd"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-text-field
                                                    color="accent"
                                                    
                                                    label="Tanggal"
                                                    append-icon="mdi-calendar"
                                                    :value="formatDate"
                                                    readonly
                                                    v-on="on"
                                                    :solo="true"
                                                    :clearable="true"
                                                    @click:clear="advanceSearch.tanggal = null"
                                                    dense
                                                    class="mr-3"
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="advanceSearch.tanggal" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerMenuAdd = false">
                                                </v-date-picker>
                                            </v-menu>
                                        </v-col>
                                        <v-col cols="4">
                                            <v-text-field
                                                placeholder="Nama"
                                                :solo="true"
                                                :clearable="true"
                                                dense
                                                class="mr-3"
                                                color="accent"
                                                v-model="advanceSearch.nama"
                                            >
                                            </v-text-field>
                                        </v-col>
                                        <v-col cols="4">
                                            <v-select
                                                placeholder="Status"
                                                :solo="true"
                                                :clearable="true"
                                                dense
                                                color="accent"
                                                :items="status"
                                                v-model="advanceSearch.status"
                                                item-text="name"
                                            >
                                            </v-select>
                                        </v-col>
                                    </v-row>
                                </v-col>
                            </v-expand-transition>
                            <!-- Mobile Phone view -->
                            <v-expand-transition v-else>
                                <v-col cols="12" class="mb-n5" v-if="showAdvanceSearchOption">
                                    <v-row no-gutters>
                                        <v-col cols="12">
                                            <v-text-field
                                                placeholder="Nama"
                                                :solo="true"
                                                :clearable="true"
                                                dense
                                                color="accent"
                                                class="mb-n4"
                                                v-model="advanceSearch.nama"
                                            >
                                            </v-text-field>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-menu
                                                ref="showAdvancedatePickerMenuAdd"
                                                v-model="showAdvancedatePickerMenuAdd"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-text-field
                                                    color="accent"
                                                    class="mb-n4 mr-1"
                                                    label="Tanggal"
                                                    append-icon="mdi-calendar"
                                                    :value="formatDate"
                                                    readonly
                                                    v-on="on"
                                                    :solo="true"
                                                    :clearable="true"
                                                    @click:clear="advanceSearch.tanggal = null"
                                                    dense
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="advanceSearch.tanggal" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerMenuAdd = false">
                                                </v-date-picker>
                                            </v-menu>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-select
                                                placeholder="Status"
                                                :solo="true"
                                                :clearable="true"
                                                dense
                                                color="accent"
                                                :items="status"
                                                v-model="advanceSearch.status"
                                                item-text="name"
                                                class="ml-1"
                                            >
                                            </v-select>
                                        </v-col>
                                    </v-row>
                                </v-col>
                            </v-expand-transition>
                            <v-col>
                                <v-btn class="body-2" text dense color="blue white--text"  @click="showAdvanceSearch"><span class="mr-1"><v-icon v-if="!showAdvanceSearchOption">mdi-filter-menu-outline</v-icon><v-icon v-else>mdi-filter-minus-outline</v-icon></span>Filter</v-btn>
                                <v-btn text :disabled="advanceSearch.nama == '' && (advanceSearch.tanggal == '' || advanceSearch.tanggal == null) && advanceSearch.status == ''" v-if="showAdvanceSearchOption" dense @click="clearAllAdvanceSearch" class="caption showAdvanceSearchOptionText"><v-icon>mdi-filter-variant-remove</v-icon> Clear Filter</v-btn>
                            </v-col>
                        </v-row>
                        <!-- List Surat Jalan -->
                            <!-- mobile phone -->
                        <div v-if="popUpBreakPoint">
                            <v-data-table
                                :headers="listSuratJalanHeader"
                                :items="listSuratJalans"
                                item-key="nomor"
                                :hide-default-footer="true"
                                @click:row="detailSuratJalan"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                                <template v-slot:item="{ item }">
                                    <v-card @click="detailSuratJalan(item)" class="mt-1 mb-3 mx-2" color="grey lighten-2" outlined>
                                        <v-card-title class="body-2">{{ item.nama }}</v-card-title>
                                        <v-card-subtitle>{{ item.nomor }}</v-card-subtitle>
                                        <div class="d-flex flex-no-wrap justify-space-between mt-n4">
                                            <v-card-subtitle>{{ item.status }}</v-card-subtitle>
                                            <v-card-subtitle>{{ formatDateList(item.tanggal) }}</v-card-subtitle>
                                        </div>
                                    </v-card>
                                </template>
                            </v-data-table>
                        </div>
                            <!--  -->
                            <!-- PC / laptop -->
                        <div v-else>
                            <v-data-table
                                :headers="listSuratJalanHeader"
                                :items="listSuratJalans"
                                item-key="nomor"
                                :hide-default-footer="true"
                                @click:row="detailSuratJalan"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                                <template v-slot:item.tanggal="{ item }">
                                    <span>{{ formatDateList(item.tanggal) }}</span>
                                </template>
                                <template v-slot:item.actions="{ item }">
                                    <v-btn dense color="white--text green" :disabled="item.status != 'Belum Diproses'" @click.stop="prosesSuratJalan(item)">Muat</v-btn>
                                </template>
                            </v-data-table>
                            <!-- Pop Up Proses Surat Jalan -->
                                <!-- Mobile Phone -->
                                <!--  -->
                                <!-- PC/Laptop -->
                            <v-dialog v-model="popUpProsesSuratJalan" fullscreen hide-overlay transition="dialog-bottom-transition">
                                <v-card>
                                    <v-toolbar dense flat>
                                        <span class="title font-weight-light">Proses Surat Jalan</span>
                                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                    </v-toolbar>
                                    <v-card-text>
                                        <v-data-table
                                            :headers="suratJalanProsesHeader"
                                            :items="surat.barangs"
                                            :show-select="true"
                                            :disable-sort="true"
                                            :disable-filtering="true"
                                            :mobile-breakpoint="1"
                                            :hide-default-footer="true"
                                            v-model="selectedItemsForSuratJalan"
                                        />
                                    </v-card-text>
                                </v-card>
                            </v-dialog>
                                <!--  -->
                        </div>
                        <!--  -->
                        <!-- Pop Up Detail Surat -->
                        <v-dialog v-model="popUpDetailSuratJalan" fullscreen hide-overlay transition="dialog-bottom-transition">
                            <v-card>
                                <v-toolbar dense flat>
                                    <span class="title font-weight-light">Detail Surat Jalan</span>
                                    <v-btn absolute right icon @click="close" :disabled="suratJalanEditToggle"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                <v-form ref="form" class="px-2">
                                    <v-card-text>
                                        <v-row>
                                            <v-col cols="12" class="my-n8">
                                                <v-row justify="space-between">
                                                    <v-col>
                                                        <v-switch :disabled="suratJalanEditToggle" value v-model="suratJalanEditToggle" class="pa-0 ma-0" label="Edit Surat Jalan"></v-switch>
                                                    </v-col>
                                                    <!-- Tanggal -->
                                                    <v-col cols="5" v-if="popUpBreakPoint">
                                                        <v-text-field v-model="surat.tanggal" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                    </v-col>
                                                    <v-col cols="3" v-else>
                                                        <v-text-field v-model="surat.tanggal" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                    </v-col>
                                                    <!--  -->
                                                </v-row>
                                            </v-col>
                                            <v-col cols="12" class="mt-n5">
                                                <v-row justify="end">
                                                    <v-col cols="4">
                                                        <v-divider></v-divider>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                            <!-- Nama Penerima -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="surat.namaPenerima" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Nama Penerima"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="surat.namaPenerima" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Nama Penerima"/>
                                            </v-col>
                                            <!--  -->
                                            <!-- Nomor Surat -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="surat.nomor" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Nomor Surat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="surat.nomor" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Nomor Surat"/>
                                            </v-col>
                                            <!--  -->
                                            <!-- Alamat -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="surat.alamat" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Alamat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="surat.alamat" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Alamat"/>
                                            </v-col>
                                            <!--  -->
                                            <!-- Nama Surat -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="surat.nama" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Nama Surat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="surat.nama" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" label="Nama Surat"/>
                                            </v-col>
                                            <!--  -->
                                            <v-col cols="12" class="my-n5">
                                                <v-textarea v-model="surat.keterangan" dense color="accent" outlined :filled="!suratJalanEditToggle" :disabled="!suratJalanEditToggle" :auto-grow="true" :no-resize="true" label="Keterangan"/>
                                            </v-col>
                                            <v-col cols="12" class="mb-n5 mt-n3">
                                                <v-divider></v-divider>
                                            </v-col>
                                            <v-col cols="12" v-if="!popUpBreakPoint">
                                                <v-row justify="center" class="headline">
                                                    Daftar Barang
                                                </v-row>
                                            </v-col>
                                            <!-- PC / Laptop View -->
                                            <v-col cols="12" class="my-n4" v-if="!popUpBreakPoint">
                                                <v-data-table
                                                    :headers="suratJalanNewHeader"
                                                    :items="surat.barangs"
                                                    :hide-default-footer="true"
                                                    :disable-filtering="true"
                                                    :disable-pagination="true"
                                                    :disable-sort="true"
                                                    no-data-text="Belum ada Barang yang ditambah"
                                                >
                                                    <template v-slot:body.append v-if="suratJalanEditToggle">
                                                        <tr>
                                                            <td><v-text-field color="accent" id="focusGained" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.id"/></td>
                                                            <td><v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.nama"/></td>
                                                            <td><v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.jumlah"/></td>
                                                        </tr>
                                                    </template>
                                                </v-data-table>
                                            </v-col>
                                            <!-- Mobile view -->
                                            <v-col cols="12" class="mb-4 mt-n10" v-else>
                                                <v-data-table
                                                    :headers="suratJalanNewHeader"
                                                    :items="surat.barangs"
                                                    :hide-default-footer="true"
                                                    :disable-filtering="true"
                                                    :disable-pagination="true"
                                                    :disable-sort="true"
                                                    no-data-text="Belum ada Barang yang ditambah"
                                                >
                                                    <template v-slot:body.prepend="{ headers }">
                                                        <tr>
                                                            <td :colspan="headers.length" class="text-center">
                                                                Daftar Barang
                                                            </td>
                                                        </tr>
                                                    </template>
                                                    <template v-slot:body.append="{ headers }" v-if="suratJalanEditToggle">
                                                        <tr>
                                                            <td :colspan="headers.length" class="text-center">
                                                                <v-row>
                                                                    <v-col cols="12">
                                                                        Tambah Barang
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-text-field class="mb-n4" color="accent" label="ID Barang" outlined dense v-model="suratJalanNewItem.id"/>
                                                                    </v-col>
                                                                    <v-col cols="12" class="mt-n4">
                                                                        <v-text-field class="mb-n4" color="accent" label="Nama Barang" outlined dense v-model="suratJalanNewItem.nama"/>
                                                                    </v-col>
                                                                    <v-col cols="9" class="mt-n4 mr-n3">
                                                                        <v-text-field class="mb-n4" color="accent" label="Jumlah" outlined dense v-model="suratJalanNewItem.jumlah"/>
                                                                    </v-col>
                                                                    <v-col cols="3" class="mt-n4">
                                                                        <v-btn color="green" dark @click="addSuratJalanNewItem"><v-icon>mdi-plus</v-icon></v-btn>
                                                                    </v-col>
                                                                </v-row>
                                                            </td>
                                                        </tr>
                                                    </template>
                                                    <template v-slot:item="{ item }">
                                                        <v-card color="grey lighten-2">
                                                            <div class="d-flex flex-no-wrap justify-space-between align-center">
                                                                <div>
                                                                    <v-card-title class="body-2">{{item.nama}}</v-card-title>
                                                                    <v-card-subtitle>{{item.id}}</v-card-subtitle>
                                                                </div>
                                                                <div>
                                                                    <v-card-subtitle>{{item.jumlah}}</v-card-subtitle>
                                                                </div>
                                                            </div>
                                                        </v-card>
                                                    </template>
                                                </v-data-table>
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-form>
                                <v-card-actions v-if="suratJalanEditToggle">
                                    <v-container>
                                        <v-row justify="center">
                                            <v-btn class="mt-n12" color="red darken-1" text @click="close">Cancel</v-btn>
                                            <v-btn class="mt-n12" color="blue white--text" @click="saveNewBarang">Save</v-btn>
                                        </v-row>
                                    </v-container>
                                </v-card-actions>
                            </v-card>
                        </v-dialog>
                        <!--  -->
                        <!-- Add Surat Jalan -->
                        <v-btn fab dark large color="primary" fixed right bottom @click="popUpNewSuratJalan = !popUpNewSuratJalan">
                            <v-icon>mdi-plus</v-icon>
                        </v-btn>
                        <v-container class="my-n3">
                            <v-dialog v-model="popUpNewSuratJalan" persistent fullscreen hide-overlay transition="dialog-bottom-transition">
                                <v-card>
                                    <v-toolbar dense flat>
                                        <span class="title font-weight-light">Tambah Surah Jalan</span>
                                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                    </v-toolbar>
                                    <v-form ref="form" class="px-2">
                                        <v-card-text>
                                            <v-row>
                                                <v-col cols="12" class="my-n8">
                                                    <v-row justify="end">
                                                        <!-- Tanggal -->
                                                        <v-col cols="5" v-if="popUpBreakPoint">
                                                            <v-text-field v-model="surat.tanggal" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                        </v-col>
                                                        <v-col cols="3" v-else>
                                                            <v-text-field v-model="surat.tanggal" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                        </v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col cols="12" class="mt-n5">
                                                    <v-row justify="end">
                                                        <v-col cols="4">
                                                            <v-divider></v-divider>
                                                        </v-col>
                                                    </v-row>
                                                </v-col>
                                                <!-- Nama Penerima -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="surat.namaPenerima" dense color="accent" outlined label="Nama Penerima"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="surat.namaPenerima" dense color="accent" outlined label="Nama Penerima"/>
                                                </v-col>
                                                <!--  -->
                                                <!-- Nomor Surat -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="surat.nomor" dense color="accent" outlined label="Nomor Surat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="surat.nomor" dense color="accent" outlined label="Nomor Surat"/>
                                                </v-col>
                                                <!--  -->
                                                <!-- Alamat -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="surat.alamat" dense color="accent" outlined label="Alamat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="surat.alamat" dense color="accent" outlined label="Alamat"/>
                                                </v-col>
                                                <!--  -->
                                                <!-- Nama Surat -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="surat.nama" dense color="accent" outlined label="Nama Surat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="surat.nama" dense color="accent" outlined label="Nama Surat"/>
                                                </v-col>
                                                <!--  -->
                                                <v-col cols="12" class="my-n5">
                                                    <v-textarea v-model="surat.keterangan" dense color="accent" :auto-grow="true" outlined label="Keterangan"/>
                                                </v-col>
                                                <v-col cols="12" class="mb-n5 mt-n3" v-if="!popUpBreakPoint">
                                                    <v-divider v-if="!popUpBreakPoint"></v-divider>
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-row justify="center" class="headline" v-if="!popUpBreakPoint">
                                                        Daftar Barang
                                                    </v-row>
                                                </v-col>
                                                <!-- PC / Laptop View -->
                                                <v-col cols="12" class="mt-n4" v-if="!popUpBreakPoint">
                                                    <v-data-table
                                                        :headers="suratJalanNewHeader"
                                                        :items="surat.barangs"
                                                        :hide-default-footer="true"
                                                        :disable-filtering="true"
                                                        :disable-pagination="true"
                                                        :disable-sort="true"
                                                        no-data-text="Belum ada Barang yang ditambah"
                                                    >
                                                        <template v-slot:body.append>
                                                            <tr>
                                                                <td><v-text-field color="accent" id="focusGained" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.id"/></td>
                                                                <td><v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.nama"/></td>
                                                                <td><v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="suratJalanNewItem.jumlah"/></td>
                                                            </tr>
                                                        </template>
                                                        <template v-slot:item.actions="{ item }">
                                                            <v-icon class="mr-2" @click.stop="editSuratJalanNew(item)">mdi-pencil</v-icon>
                                                            <v-icon @click.stop="deleteSuratJalanNew(item)">mdi-delete</v-icon>
                                                        </template>
                                                    </v-data-table>
                                                </v-col>
                                                <!-- Mobile view -->
                                                <v-col cols="12" class="mb-4 mt-n10" v-else>
                                                    <v-data-table
                                                        :headers="suratJalanNewHeader"
                                                        :items="surat.barangs"
                                                        :hide-default-footer="true"
                                                        :disable-filtering="true"
                                                        :disable-pagination="true"
                                                        :disable-sort="true"
                                                        no-data-text="Belum ada Barang yang ditambah"
                                                    >
                                                        <template v-slot:body.prepend="{ headers }">
                                                            <tr>
                                                                <td :colspan="headers.length" class="text-center">
                                                                    Daftar Barang
                                                                </td>
                                                            </tr>
                                                        </template>
                                                        <template v-slot:body.append="{ headers }">
                                                            <tr>
                                                                <td :colspan="headers.length" class="text-center">
                                                                    <v-row>
                                                                        <v-col cols="12">
                                                                            Tambah Barang
                                                                        </v-col>
                                                                        <v-col cols="12">
                                                                            <v-text-field class="mb-n4" color="accent" label="ID Barang" outlined dense v-model="suratJalanNewItem.id"/>
                                                                        </v-col>
                                                                        <v-col cols="12" class="mt-n4">
                                                                            <v-text-field class="mb-n4" color="accent" label="Nama Barang" outlined dense v-model="suratJalanNewItem.nama"/>
                                                                        </v-col>
                                                                        <v-col cols="9" class="mt-n4 mr-n3">
                                                                            <v-text-field class="mb-n4" color="accent" label="Jumlah" outlined dense v-model="suratJalanNewItem.jumlah"/>
                                                                        </v-col>
                                                                        <v-col cols="3" class="mt-n4">
                                                                            <v-btn color="green" dark @click="addSuratJalanNewItem"><v-icon>mdi-plus</v-icon></v-btn>
                                                                        </v-col>
                                                                    </v-row>
                                                                </td>
                                                            </tr>
                                                        </template>
                                                        <template v-slot:item="{ item }">
                                                            <v-card color="grey lighten-2" class="mt-1 mb-3 mx-2">
                                                                <div class="d-flex flex-no-wrap justify-space-between align-center">
                                                                    <div>
                                                                        <v-card-title class="body-2">{{item.nama}}</v-card-title>
                                                                        <v-card-subtitle>{{item.id}}</v-card-subtitle>
                                                                    </div>
                                                                    <div>
                                                                        <v-card-subtitle>{{item.jumlah}}</v-card-subtitle>
                                                                    </div>
                                                                </div>
                                                            </v-card>
                                                        </template>
                                                    </v-data-table>
                                                </v-col>
                                            </v-row>
                                        </v-card-text>
                                    </v-form>
                                    <v-card-actions>
                                        <v-container>
                                            <v-row justify="center">
                                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Batal</v-btn>
                                                <v-btn class="mt-n12" color="blue white--text" @click="saveNewSuratJalan">Buat Surat Jalan</v-btn>
                                            </v-row>
                                        </v-container>
                                    </v-card-actions>
                                </v-card>
                            </v-dialog>
                        </v-container>
                    </v-tab-item>
                    <!-- *************************************************************************************************************** -->
                    <!-- *************************************************************************************************************** -->
                    
                </v-tabs-items>
            </v-card>
        </div>
    </v-app>
</template>

<script>

import moment from 'moment'

export default {
    name: 'SuratJalan',

    data() {
        return {
            tab:'',
            /* -------------------- SURAT JALAN -------------------- */
            // List & Details
            // listSuratJalanHeader on computed
            searchSuratJalan:'',
            advanceSearch: {
                nomor:'',
                tanggal: '',
                nama:'',
                status:''
            },
            listSuratJalans:[
                {
                    id:1,
                    nomor:'xxx',
                    nama:'Pemesanana dari x untuk y',
                    tanggal: '2020-04-02',
                    namaPenerima:'Yoga',
                    alamat:'Yogya',
                    barangs:[
                        {id:1, nama:'Paku', jumlah:100}
                    ],
                    status:'Dikirim',
                    keterangan:''
                },
                {
                    id:2,
                    nomor:'yxx',
                    nama:'Pemesanana dari y untuk x',
                    tanggal:'2020-04-02',
                    namaPenerima:'Yoga',
                    alamat:'Yogya',
                    barangs:[],
                    status:'Belum Diproses',
                    keterangan:''
                }
            ],
            surat: {
                id:null,
                nomor:'',
                nama:'',
                tanggal:'',
                namaPenerima:'',
                alamat:'',
                barangs:[],
                status:'',
                keterangan:''
            },
            suratDefault: {
                id:null,
                nomor:'',
                nama:'',
                tanggal:'',
                namaPenerima:'',
                alamat:'',
                barangs:[],
                status:'',
                keterangan:''
            },
            counter:0,
            status: [
                {id:1, name:'Belum Diproses', color:'yellow'},
                {id:2, name:'Dikirim', color:'blue'},
                {id:3, name:'Selesai', color:'green'},
                {id:4, name:'Batal', color:'red'}
            ],
            suratJalanEditToggle: false,
            suratJalanNewHeader: [
                {text:'ID Barang', value:'id'},
                {text:'Nama Barang', value:'nama'},
                {text:'Jumlah', value:'jumlah'},
                {value:'actions'}
            ],
            // object of Item in surat jalan before pushing it into surat.barangs
            suratJalanNewItem: {
                id:'',
                nama:'',
                jumlah:null
            },
            suratJalanNewItemDefault: {
                id:'',
                nama:'',
                jumlah:null
            },
            // Proses Surat Jalan
            suratJalanProsesHeader: [
                {text:'ID Barang', value:'id'},
                {text:'Nama Barang', value:'nama'},
                {text:'Jumlah', value:'jumlah'},
            ],
            // Proses Muat ditampung disini
            selectedItemsForSuratJalan:[],
            // --
            selectedIndexSuratJalan:-1,
            // PopUp Var
            popUpNewSuratJalan: false,
            popUpDetailSuratJalan: false,
            popUpProsesSuratJalan: false,
            showAdvanceSearchOption: false,
            showAdvancedatePickerMenuAdd: false,
            /* --------------------             -------------------- */
            /* -------------------- DO -------------------- */
            /* --------------------    -------------------- */
        }
    },
    methods: {
        /* -------------------- SURAT JALAN -------------------- */
        // Advance Search
        showAdvanceSearch() {
            if(!this.showAdvanceSearchOption) {
                this.showAdvanceSearchOption = true
            } else {
                if(this.showAdvanceSearchOption) {
                    this.showAdvanceSearchOption = false
                    // this.advanceSearch.nama = ''
                    // this.advanceSearch.tanggal = ''
                    // this.advanceSearch.status = ''
                }
            }
        },
        clearAllAdvanceSearch() {
            this.advanceSearch.nama = ''
            this.advanceSearch.tanggal = ''
            this.advanceSearch.status = ''
        },
        advanceSearchNomor(value) {
            if(!this.advanceSearch.nomor) {
                return true
            }
            return value.toLowerCase().includes(this.advanceSearch.nomor.toLowerCase())
        },
        advanceSearchTanggal(value) {
            if(!this.advanceSearch.tanggal) {
                return true
            }
            return value === this.advanceSearch.tanggal
        },
        advanceSearchNama(value) {
            if(!this.advanceSearch.nama) {
                return true
            }
            return value.toLowerCase().includes(this.advanceSearch.nama.toLowerCase())
        },
        advanceSearchStatus(value) {
            if(!this.advanceSearch.status) {
                return true
            }
            return value === this.advanceSearch.status;
        },
        dayFormat(date) {
            let i = new Date(date).getDay(date)
            var dayOftheWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
            return dayOftheWeek[i]
        },
        formatDateList(val) {
            return val ? moment(val).format('DD MMMM YYYY') : ''
        },
        // Save New Surat Jalan
        saveNewSuratJalan() {
            this.listSuratJalans.push(this.surat)
            this.surat.status = 'Belum Diproses'
            this.surat = Object.assign({},this.suratDefault)
            this.selectedIndexSuratJalan = -1
            this.popUpNewSuratJalan = false
        },
        // Detail Surat Jalan
        detailSuratJalan(item) {
            this.selectedIndexSuratJalan = this.listSuratJalans.indexOf(item)
            this.surat = Object.assign({},item)
            this.popUpDetailSuratJalan = true
        },
        close() {
            // Surat Jalan
            if(this.popUpNewSuratJalan) {
                this.popUpNewSuratJalan = false
                this.suratJalanNewItem = Object.assign({},this.suratJalanNewItemDefault)
                this.surat = Object.assign({},this.suratDefault)
            } else {
                if(this.popUpDetailSuratJalan) {
                    if(this.suratJalanEditToggle) {
                        this.suratJalanEditToggle = false
                        for(let i=0; i<this.counter; i++) {
                            this.surat.barangs.pop()
                        }
                        this.counter = 0
                        this.suratJalanNewItem = Object.assign({},this.suratJalanNewItemDefault)
                    }
                    this.popUpDetailSuratJalan = false
                    this.surat = Object.assign({},this.suratDefault)
                    this.selectedIndexSuratJalan = -1
                } else {
                    if(this.popUpProsesSuratJalan) {
                        this.popUpProsesSuratJalan = false
                        this.surat = Object.assign({},this.suratDefault)
                        this.selectedIndexSuratJalan = -1
                    }
                }
            }
        },
        addSuratJalanNewItem() {
            this.counter++
            this.surat.barangs.push(this.suratJalanNewItem)
            this.suratJalanNewItem = Object.assign({},this.suratJalanNewItemDefault)
            document.getElementById("focusGained").focus()
        },
        // Proses Surat jalan
        prosesSuratJalan(item) {
            this.selectedIndexSuratJalan = this.listSuratJalans.indexOf(item)
            this.barang = Object.assign({},item)
            this.popUpProsesSuratJalan = true
        }
        /* --------------------             -------------------- */
        /* -------------------- DO -------------------- */
        /* --------------------    -------------------- */
    },

    computed: {
        formatDate() {
            return this.advanceSearch.tanggal ? moment(this.advanceSearch.tanggal).format('DD MMMM YYYY') : ''
        },
        listSuratJalanHeader() {
            return [
                {text:'Nomor Surat Jalan', value:'nomor',filter: this.advanceSearchNomor},
                {text:'Tanggal', value:'tanggal',filter: this.advanceSearchTanggal},
                {text:'Nama', value:'nama',filter: this.advanceSearchNama},
                {text:'Keterangan', value:'keterangan'},
                {text:'Status', value:'status',filter: this.advanceSearchStatus},
                {text:'', value:'actions',width:'10%'}
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

<style scoped>

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