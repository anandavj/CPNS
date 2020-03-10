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
                                    v-model="advanceSearch.referenceNumber"
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
                                                    @click:clear="advanceSearch.date = null"
                                                    dense
                                                    class="mr-3"
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="advanceSearch.date" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerMenuAdd = false">
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
                                                v-model="advanceSearch.name"
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
                                                v-model="advanceSearch.name"
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
                                                    @click:clear="advanceSearch.date = null"
                                                    dense
                                                    ></v-text-field>
                                                </template>
                                                <v-date-picker v-model="advanceSearch.date" show-current="false" no-title scrollable :weekday-format="dayFormat" @change="showAdvancedatePickerMenuAdd = false">
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
                                <v-btn text :disabled="advanceSearch.name == '' && (advanceSearch.date == '' || advanceSearch.date == null) && advanceSearch.status == ''" v-if="showAdvanceSearchOption" dense @click="clearAllAdvanceSearch" class="caption showAdvanceSearchOptionText"><v-icon>mdi-filter-variant-remove</v-icon> Clear Filter</v-btn>
                            </v-col>
                        </v-row>
                        <!-- List Surat Jalan -->
                            <!-- mobile phone -->
                        <div v-if="popUpBreakPoint">
                            <v-data-table
                                :headers="listSuratJalanHeader"
                                :items="suratJalans"
                                item-key="nomor"
                                :footer-props="{
                                    'items-per-page-options': [10, 50, 100, -1]
                                }"
                                @click:row="detailSuratJalan"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                                <template v-slot:item="{ item }"> 
                                    <v-card @click.stop="detailSuratJalan(item)" class="mt-1 mb-3 mx-2 pa-2" color="grey lighten-2" outlined>
                                        <div class="d-flex flex-no-wrap justify-space-between mt-n4">
                                            <div>
                                                <v-card-title class="body-2">{{ item.nama }}</v-card-title>
                                                <v-card-subtitle>{{ item.nomor }}</v-card-subtitle>
                                            </div>
                                            <div>
                                                <v-btn @click.stop="prosesSuratJalan(item)" :disabled="item.status != 'Belum Diproses'" dense color="white--text green" small :dark="item.status == 'Belum Diproses'" fab class="my-5 mx-1">
                                                    <v-icon>mdi-truck-fast</v-icon>
                                                </v-btn>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-no-wrap justify-space-between mt-n4">
                                            <v-card-subtitle>{{ item.status }}</v-card-subtitle>
                                            <v-card-subtitle>{{ formatDateList(item.date) }}</v-card-subtitle>
                                        </div>
                                    </v-card>
                                </template>
                            </v-data-table>
                            <v-dialog v-model="popUpProsesSuratJalan" fullscreen hide-overlay transition="dialog-bottom-transition">
                                <v-card>
                                    <v-toolbar dense flat>
                                        <span class="title font-weight-light">Proses Surat Jalan</span>
                                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                                    </v-toolbar>
                                    <v-card-text>
                                        <v-data-table
                                            :headers="deliveryOrderProcessHeader"
                                            :items="deliveryOrder.items"
                                            :show-select="true"
                                            :disable-sort="true"
                                            :disable-filtering="true"
                                            :mobile-breakpoint="1"
                                            :hide-default-footer="true"
                                            v-model="selectedItemsForDeliveryOrder"
                                        />
                                    </v-card-text>
                                </v-card>
                            </v-dialog>
                        </div>
                            <!--  -->
                            <!-- PC / laptop -->
                        <div v-else>
                            <v-data-table
                                :headers="listSuratJalanHeader"
                                :items="suratJalans"
                                item-key="nomor"
                                :footer-props="{
                                    'items-per-page-options': [10, 50, 100, -1]
                                }"
                                @click:row="detailSuratJalan"
                                class="font-regular font-weight-light"
                                style="cursor:pointer"
                            >
                                <template v-slot:item.date="{ item }">
                                    <span>{{ formatDateList(item.date) }}</span>
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
                                            :headers="deliveryOrderProcessHeader"
                                            :items="deliveryOrder.items"
                                            :show-select="true"
                                            :disable-sort="true"
                                            :disable-filtering="true"
                                            :mobile-breakpoint="1"
                                            :hide-default-footer="true"
                                            v-model="selectedItemsForDeliveryOrder"
                                        >
                                            <template v-slot:item.name="{ item }">
                                                {{productNameWithSpec(item)}}
                                            </template>
                                        </v-data-table>
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
                                    <v-btn absolute right icon @click="close" :disabled="deliveryOrderEditToggle"><v-icon>mdi-close</v-icon></v-btn>
                                </v-toolbar>
                                <v-form ref="form" class="px-2">
                                    <v-card-text>
                                        <v-row>
                                            <v-col cols="12" class="my-n8">
                                                <v-row justify="space-between">
                                                    <v-col>
                                                        <v-switch :disabled="deliveryOrderEditToggle" value v-model="deliveryOrderEditToggle" class="pa-0 ma-0" label="Edit Surat Jalan"></v-switch>
                                                    </v-col>
                                                    <!-- Tanggal -->
                                                    <v-col cols="5" v-if="popUpBreakPoint">
                                                        <v-text-field v-model="deliveryOrder.date" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                    </v-col>
                                                    <v-col cols="3" v-else>
                                                        <v-text-field v-model="deliveryOrder.date" dense color="accent" outlined filled disabled label="Tanggal"/>
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
                                                <v-text-field v-model="deliveryOrder.receiverName" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Nama Penerima"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="deliveryOrder.receiverName" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Nama Penerima"/>
                                            </v-col>
                                            <!--  -->
                                            <!-- Nomor Surat -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="deliveryOrder.referenceNumber" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Nomor Surat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="deliveryOrder.referenceNumber" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Nomor Surat"/>
                                            </v-col>
                                            <!--  -->
                                            <!-- Alamat -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="deliveryOrder.address" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Alamat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="deliveryOrder.address" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Alamat"/>
                                            </v-col>
                                            <!--  -->
                                            <!-- Nama Surat -->
                                            <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                <v-text-field v-model="deliveryOrder.name" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Nama Surat"/>
                                            </v-col>
                                            <v-col cols="6" class="my-n5" v-else>
                                                <v-text-field v-model="deliveryOrder.name" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" label="Nama Surat"/>
                                            </v-col>
                                            <!--  -->
                                            <v-col cols="12" class="my-n5">
                                                <v-textarea v-model="deliveryOrder.description" dense color="accent" outlined :filled="!deliveryOrderEditToggle" :disabled="!deliveryOrderEditToggle" :auto-grow="true" :no-resize="true" label="Keterangan"/>
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
                                                    :headers="deliveryOrderNewHeaders"
                                                    :items="deliveryOrder.items"
                                                    :hide-default-footer="true"
                                                    :disable-filtering="true"
                                                    :disable-pagination="true"
                                                    :disable-sort="true"
                                                    no-data-text="Belum ada Barang yang ditambah"
                                                >
                                                    <template v-slot:item.name="{ item }">
                                                        {{productNameWithSpec(item)}}
                                                    </template>
                                                    <template v-slot:body.append v-if="deliveryOrderEditToggle">
                                                        <tr>
                                                            <td><v-text-field color="accent" id="focusGained" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="deliveryOrderNewItem.productId"/></td>
                                                            <td><v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="deliveryOrderNewItem.name"/></td>
                                                            <td><v-text-field color="accent" v-on:keyup.enter="addSuratJalanNewItem" outlined dense v-model="deliveryOrderNewItem.amount"/></td>
                                                        </tr>
                                                    </template>
                                                </v-data-table>
                                            </v-col>
                                            <!-- Mobile view -->
                                            <v-col cols="12" class="mb-4 mt-n10" v-else>
                                                <v-data-table
                                                    :headers="deliveryOrderNewHeaders"
                                                    :items="deliveryOrder.items"
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
                                                    <template v-slot:body.append="{ headers }" v-if="deliveryOrderEditToggle">
                                                        <tr>
                                                            <td :colspan="headers.length" class="text-center">
                                                                <v-row>
                                                                    <v-col cols="12">
                                                                        Tambah Barang
                                                                    </v-col>
                                                                    <v-col cols="12">
                                                                        <v-text-field class="mb-n4" color="accent" label="ID Barang" outlined dense v-model="deliveryOrderNewItem.productId"/>
                                                                    </v-col>
                                                                    <v-col cols="12" class="mt-n4">
                                                                        <v-text-field class="mb-n4" color="accent" label="Nama Barang" outlined dense v-model="deliveryOrderNewItem.name"/>
                                                                    </v-col>
                                                                    <v-col cols="9" class="mt-n4 mr-n3">
                                                                        <v-text-field class="mb-n4" color="accent" label="Jumlah" outlined dense v-model="deliveryOrderNewItem.amount"/>
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
                                <v-card-actions v-if="deliveryOrderEditToggle">
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
                        <v-btn fab dark large color="primary" fixed right bottom @click="dialogSuratJalan">
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
                                                            <v-text-field v-model="deliveryOrder.date" dense color="accent" outlined filled disabled label="Tanggal"/>
                                                        </v-col>
                                                        <v-col cols="3" v-else>
                                                            <v-text-field v-model="deliveryOrder.date" dense color="accent" outlined filled disabled label="Tanggal"/>
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
                                                    <v-text-field v-model="deliveryOrder.receiverName" dense color="accent" outlined label="Nama Penerima"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="deliveryOrder.receiverName" dense color="accent" outlined label="Nama Penerima"/>
                                                </v-col>
                                                <!--  -->
                                                <!-- Nomor Surat -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="deliveryOrder.referenceNumber" dense color="accent" outlined label="Nomor Surat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="deliveryOrder.referenceNumber" dense color="accent" outlined label="Nomor Surat"/>
                                                </v-col>
                                                <!--  -->
                                                <!-- Alamat -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="deliveryOrder.address" dense color="accent" outlined label="Alamat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="deliveryOrder.address" dense color="accent" outlined label="Alamat"/>
                                                </v-col>
                                                <!--  -->
                                                <!-- Nama Surat -->
                                                <v-col cols="12" class="my-n5" v-if="popUpBreakPoint">
                                                    <v-text-field v-model="deliveryOrder.name" dense color="accent" outlined label="Nama Surat"/>
                                                </v-col>
                                                <v-col cols="6" class="my-n5" v-else>
                                                    <v-text-field v-model="deliveryOrder.name" dense color="accent" outlined label="Nama Surat"/>
                                                </v-col>
                                                <!--  -->
                                                <v-col cols="12" class="my-n5">
                                                    <v-textarea v-model="deliveryOrder.description" dense color="accent" :auto-grow="true" outlined label="Keterangan"/>
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
                                                        :headers="deliveryOrderNewHeaders"
                                                        :items="deliveryOrder.items"
                                                        :hide-default-footer="true"
                                                        :disable-filtering="true"
                                                        :disable-pagination="true"
                                                        :disable-sort="true"
                                                        no-data-text="Belum ada Barang yang ditambah"
                                                        hover=""
                                                    >
                                                        <template v-slot:body.append>
                                                            <tr>
                                                                <td>
                                                                    <v-autocomplete
                                                                        color="accent"
                                                                        id="focusGained"
                                                                        dense
                                                                        v-model="deliveryOrderNewItem.productId"
                                                                        chips
                                                                        :items="products"
                                                                        :clearable="true"
                                                                        :auto-select-first="true"
                                                                        item-color="blue"
                                                                        :search-input.sync="searchId"
                                                                        @click:clear="clearDeliveryOrderNewItem"
                                                                        @change="onChangeSearchId"
                                                                        item-text="id"
                                                                        item-value="id"
                                                                        :readonly="deliveryOrderNewItem.productId!=null"
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
                                                                        v-model="deliveryOrderNewItem.name"
                                                                        chips
                                                                        :items="products"
                                                                        :clearable="true"
                                                                        :auto-select-first="true"
                                                                        item-color="blue"
                                                                        :search-input.sync="searchName"
                                                                        @click:clear="clearDeliveryOrderNewItem"
                                                                        @change="onChangeSearchName"
                                                                        item-text="name"
                                                                        item-value="name"
                                                                        :readonly="deliveryOrderNewItem.name!=null"
                                                                    >
                                                                        <template v-slot:selection="data">
                                                                            <v-chip color="transparent" class="pa-0">
                                                                                {{data.item.name}}
                                                                            </v-chip>
                                                                        </template>
                                                                    </v-autocomplete>
                                                                </td>
                                                                <td><v-text-field id="focusGainedAmount" color="accent" v-on:keydown.enter="addSuratJalanNewItem" v-model="deliveryOrderNewItem.amount"/></td>
                                                            </tr>
                                                        </template>
                                                        <template v-slot:item.actions="{ item }">
                                                            <v-icon @click.stop="deleteSuratJalanNew(item)">mdi-delete</v-icon>
                                                        </template>
                                                    </v-data-table>
                                                </v-col>
                                                <!-- Mobile view -->
                                                <v-col cols="12" class="mb-4 mt-n10" v-else>
                                                    <v-data-table
                                                        :headers="deliveryOrderNewHeaders"
                                                        :items="deliveryOrder.items"
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
                                                                            <v-text-field class="mb-n4" color="accent" label="ID Barang" outlined dense v-model="deliveryOrderNewItem.productId"/>
                                                                        </v-col>
                                                                        <v-col cols="12" class="mt-n4">
                                                                            <v-text-field class="mb-n4" color="accent" label="Nama Barang" outlined dense v-model="deliveryOrderNewItem.name"/>
                                                                        </v-col>
                                                                        <v-col cols="9" class="mt-n4 mr-n3">
                                                                            <v-text-field class="mb-n4" color="accent" label="Jumlah" outlined dense v-model="deliveryOrderNewItem.amount"/>
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
                                                                        <v-card-title class="body-2">{{item.productName}}</v-card-title>
                                                                        <v-card-subtitle>{{item.productId}}</v-card-subtitle>
                                                                    </div>
                                                                    <div>
                                                                        <v-card-subtitle>{{item.amount}}</v-card-subtitle>
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
    name: 'SuratJalan',
    mounted() {
        this.get()
    },
    data() {
        return {
            snackbar: false,
            snackbarMessage: '',
            snackbarColor: '',
            tab:'',
            advanceSearch: {
                referenceNumber:'',
                date: '',
                name:'',
                status:''
            },
            products:[],
            suratJalans:[],
            deliveryOrders:[],
            deliveryOrder: {
                id:null,
                referenceNumber:'',
                name:'',
                date: new Date().toISOString().substr(0, 10),
                receiverName:'',
                address:'',
                items:[],
                status:'',
                description:'',
                type:''
            },
            deliveryOrderDefault: {
                id:null,
                referenceNumber:'',
                name:'',
                date: new Date().toISOString().substr(0, 10),
                receiverName:'',
                address:'',
                items:[],
                status:'',
                description:'',
                type:''
            },
            counter:0,
            status: [
                {id:1, name:'Belum Diproses', color:'yellow'},
                {id:2, name:'Dikirim', color:'blue'},
                {id:3, name:'Selesai', color:'green'},
                {id:4, name:'Batal', color:'red'}
            ],
            deliveryOrderEditToggle: false,
            deliveryOrderNewHeaders: [
                {text:'ID Barang', value:'productId', width:'25%'},
                {text:'Nama Barang', value:'name', width:'50%'},
                {text:'Jumlah', value:'amount', width:'20%'},
                {value:'actions'}
            ],
            // object of Item in surat jalan before pushing it into deliveryOrder.items
            deliveryOrderNewItem: {
                productId:null,
                name:null,
                amount:null
            },
            deliveryOrderNewItemDefault: {
                productId:null,
                name:null,
                amount:null
            },
            // Proses Surat Jalan
            deliveryOrderProcessHeader: [
                {text:'ID Barang', value:'productId'},
                {text:'Nama Barang', value:'name'},
                {text:'Jumlah', value:'amount'},
            ],
            // Proses Muat ditampung disini
            selectedItemsForDeliveryOrder:[],
            // --
            selectedIndex:-1,
            // PopUp Var
            popUpNewSuratJalan: false,
            popUpDetailSuratJalan: false,
            popUpProsesSuratJalan: false,
            showAdvanceSearchOption: false,
            showAdvancedatePickerMenuAdd: false,
            searchId:'',
            searchName:'',
            /* --------------------             -------------------- */
            /* -------------------- DO -------------------- */
            /* --------------------    -------------------- */
        }
    },
    methods: {
        get() {
            api.getAllDeliveryOrder()
                .then(deliveryOrders => {
                    deliveryOrders.forEach(deliveryOrder => {
                        if(deliveryOrder.type == 1) {
                            this.suratJalans.push(deliveryOrder)
                        } else {
                            this.deliveryOrders.push(deliveryOrder)
                        }
                    });
                })
            api.getAllProducts()
                .then(products => {
                    this.products = products
                    products.forEach(product => {
                        if(product.specification!='undefined') product.name = product.name.concat(' || ',product.specification)
                    });
                })
        },
        /* -------------------- SURAT JALAN -------------------- */
        // Advance Search
        showAdvanceSearch() {
            if(!this.showAdvanceSearchOption) {
                this.showAdvanceSearchOption = true
            } else {
                if(this.showAdvanceSearchOption) {
                    this.showAdvanceSearchOption = false
                    // this.advanceSearch.name = ''
                    // this.advanceSearch.date = ''
                    // this.advanceSearch.status = ''
                }
            }
        },
        clearAllAdvanceSearch() {
            this.advanceSearch.name = ''
            this.advanceSearch.date = ''
            this.advanceSearch.status = ''
        },
        advanceSearchNomor(value) {
            if(!this.advanceSearch.referenceNumber) {
                return true
            }
            return value.toLowerCase().includes(this.advanceSearch.referenceNumber.toLowerCase())
        },
        advanceSearchTanggal(value) {
            if(!this.advanceSearch.date) {
                return true
            }
            return value === this.advanceSearch.date
        },
        advanceSearchNama(value) {
            if(!this.advanceSearch.name) {
                return true
            }
            return value.toLowerCase().includes(this.advanceSearch.name.toLowerCase())
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
        dialogSuratJalan() {
            this.deliveryOrder.status = 'Belum Diproses'
            this.popUpNewSuratJalan = !this.popUpNewSuratJalan
            this.deliveryOrder.type = +1
        },
        // Save New Surat Jalan
        saveNewSuratJalan() {
            api.addDeliveryOrder(this.deliveryOrder)
                .then((response) => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }) .catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }) .finally(() => {
                    this.snackbar = true
                    this.suratJalans = []
                    api.getAllDeliveryOrder()
                        .then(deliveryOrders => {
                            deliveryOrders.forEach(deliveryOrder => {
                                if(deliveryOrder.type == 1) {
                                    this.suratJalans.push(deliveryOrder)
                                } else {
                                    this.deliveryOrders.push(deliveryOrder)
                                }
                            });
                            this.deliveryOrders = deliveryOrders
                            this.deliveryOrder = Object.assign({},this.deliveryOrderDefault)
                            this.selectedIndex = -1
                            this.popUpNewSuratJalan = false
                        })
                })
        },
        // Detail Surat Jalan
        detailSuratJalan(item) {
            this.selectedIndex = this.suratJalans.indexOf(item)
            this.deliveryOrder = Object.assign({},item)
            this.popUpDetailSuratJalan = true
        },
        productNameWithSpec(item) {
            return _.find(this.products,['id',item.id]).name
        },
        close() {
            // Surat Jalan
            if(this.popUpNewSuratJalan) {
                this.popUpNewSuratJalan = false
                this.deliveryOrderNewItem = Object.assign({},this.deliveryOrderNewItemDefault)
                this.deliveryOrder = Object.assign({},this.deliveryOrderDefault)
            } else {
                if(this.popUpDetailSuratJalan) {
                    if(this.deliveryOrderEditToggle) {
                        this.deliveryOrderEditToggle = false
                        for(let i=0; i<this.counter; i++) {
                            this.deliveryOrder.items.pop()
                        }
                        this.counter = 0
                        this.deliveryOrderNewItem = Object.assign({},this.deliveryOrderNewItemDefault)
                    }
                    this.popUpDetailSuratJalan = false
                    this.deliveryOrder = Object.assign({},this.deliveryOrderDefault)
                    this.selectedIndex = -1
                } else {
                    if(this.popUpProsesSuratJalan) {
                        this.popUpProsesSuratJalan = false
                        this.deliveryOrder = Object.assign({},this.deliveryOrderDefault)
                        this.selectedIndex = -1
                    }
                }
            }
        },
        addSuratJalanNewItem() {
            this.counter++
            this.deliveryOrder.items.push(this.deliveryOrderNewItem)
            this.deliveryOrderNewItem = Object.assign({},this.deliveryOrderNewItemDefault)
            document.getElementById("focusGained").focus()
        },
        focusChange() {
            document.getElementById("focusGainedAmount").focus()
        },
        onChangeSearchId() {
            this.searchId = ''
            this.deliveryOrderNewItem.name = _.find(this.products,['id', this.deliveryOrderNewItem.productId]).name
            this.focusChange()
        },
        onChangeSearchName() {
            this.searchName = ''
            this.deliveryOrderNewItem.productId = _.find(this.products,['name',this.deliveryOrderNewItem.name]).id
            this.focusChange()
        },
        clearDeliveryOrderNewItem() {
            this.deliveryOrderNewItem = Object.assign({},this.deliveryOrderNewItemDefault)
        },
        // Proses Surat jalan
        prosesSuratJalan(item) {
            this.selectedIndex = this.suratJalans.indexOf(item)
            this.deliveryOrder = Object.assign({},item)
            this.popUpProsesSuratJalan = true
        },
        // changeStatus() {
        //     if(deliveryOrder.status == 'Belum Diproses') {

        //     }
        // }
        /* --------------------             -------------------- */
        /* -------------------- DO -------------------- */
        /* --------------------    -------------------- */
    },

    computed: {
        formatDate() {
            return this.advanceSearch.date ? moment(this.advanceSearch.date).format('DD MMMM YYYY') : ''
        },
        listSuratJalanHeader() {
            return [
                {text:'Nomor Surat Jalan', value:'referenceNumber',filter: this.advanceSearchNomor},
                {text:'Tanggal', value:'date',filter: this.advanceSearchTanggal},
                {text:'Nama', value:'name',filter: this.advanceSearchNama},
                {text:'Keterangan', value:'description'},
                {text:'Status', value:'status',filter: this.advanceSearchStatus},
                {text:'', value:'actions',width:'10%'}
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