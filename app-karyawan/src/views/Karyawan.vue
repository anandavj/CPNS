<template>
    <v-app>
        <div>
            <!-- *************************************************************************************************************** -->
            <!-- Search Karyawan in karyawans Array -->
            <!-- *************************************************************************************************************** -->
            <v-text-field
                placeholder="Cari Karyawan"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchKaryawan"
            />
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Add Karyawan -->
            <!-- *************************************************************************************************************** -->
            <v-btn v-if="create_karyawan" fab dark large color="primary" fixed right bottom @click="popUpNew = !popUpNew">
                <v-icon dark>mdi-plus</v-icon>
            </v-btn>
            <v-container class="my-n7">
                <v-dialog v-model="popUpNew" persistent max-width='1000px'>
                    <v-card>
                        <v-toolbar dense flat>
                            <span class="title font-weight-light">Tambah Karyawan</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                        </v-toolbar>
                        <v-form ref="form">
                            <v-card-text>
                                <v-row>
                                    <v-col cols="12">
                                        <v-text-field color="accent" label="Nama" v-model="karyawan.name" :rules="nameRules"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field color="accent" label="Email" v-model="karyawan.email" :rules="emailRules"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field 
                                            color="accent"
                                            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                                            :rules="passwordRules"
                                            :type="showPassword ? 'text' : 'password'"
                                            v-model="karyawan.password"
                                            label="Password"
                                            hint="Minimal 8 Karakter"
                                            class="input-group--focused"
                                            @click:append="showPassword = !showPassword"
                                        />
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field color="accent" label="Tempat Lahir" v-model="karyawan.placeOfBirth" :rules="placeOfBirthRules"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-menu
                                            ref="datePickerMenuAdd"
                                            v-model="datePickerMenuAdd"
                                            :close-on-content-click="false"
                                            :return-value.sync="karyawan.dateOfBirth"
                                            transition="scale-transition"
                                            offset-y
                                            min-width="290px"
                                            >
                                            <template v-slot:activator="{ on }">
                                                <v-text-field
                                                color="accent"
                                                v-model="karyawan.dateOfBirth"
                                                label="Tanggal Lahir"
                                                prepend-icon="mdi-calendar"
                                                readonly
                                                v-on="on"
                                                ></v-text-field>
                                            </template>
                                            <v-date-picker v-model="karyawan.dateOfBirth" no-title scrollable>
                                                <v-spacer></v-spacer>
                                                <v-btn text color="primary" @click="datePickerMenuAdd = false">Cancel</v-btn>
                                                <v-btn text color="primary" @click="$refs.datePickerMenuAdd.save(karyawan.dateOfBirth)">OK</v-btn>
                                            </v-date-picker>
                                        </v-menu>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-select
                                        :items="religions"
                                        label="Agama"
                                        color="accent"
                                        v-model="karyawan.religion"
                                        ></v-select>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-select
                                        :items="status"
                                        label="Status"
                                        color="accent"
                                        v-model="karyawan.status"
                                        ></v-select>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-text-field color="accent" label="Alamat" v-model="karyawan.address" :rules="addressRules"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field color="accent" label="Nomor HP" v-model="karyawan.telephone" type="number" :rules="telephoneRules"/>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-select
                                        item-text="name"
                                        item-value="id"
                                        :items="listuserTaskGroupId"
                                        label="Divisi"
                                        color="accent"
                                        v-model="karyawan.userTaskGroupId"
                                        v-on:change="selectuserTaskGroupId"></v-select>
                                    </v-col>
                                    <v-col cols="12" v-if="edit_tasks">
                                        <div class="title mt-n1">Permission</div>
                                        <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                            <v-expansion-panel v-for="(permission,index) in tasks" :key="index">
                                                <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                                <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                    <v-checkbox
                                                        v-model="karyawan.taskId"
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
                                    <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                    <v-btn class="mt-n5" color="blue darken-1" text @click="saveNewKaryawan">Ya</v-btn>
                                </v-row>
                                <div v-if="loading">
                                    <v-progress-linear
                                        indeterminate
                                        height="8"
                                        color="yellow darken-2"
                                        >
                                    </v-progress-linear>
                                </div>
                            </v-container>
                        </v-card-actions>
                        <div v-if="loading">
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
            <!-- List Data Karyawan -->
            <!-- *************************************************************************************************************** -->
            <v-data-table
                :headers="karyawanHeaders"
                :items="karyawans"
                :search="searchKaryawan"
                @click:row="details"
                :disable-sort="true"
                :footer-props="{
                    'items-per-page-options': [10, 50, 100, -1]
                }"
                :mobile-breakpoint="1"
                item-key="id"
                :loading="loadingList"
                no-data-text="Data Karyawan Kosong"
                no-results-text="Data Karyawan Tidak Ditemukan"
                class="font-regular font-weight-light"
                style="cursor:pointer"
            >
                <template v-slot:item.actions="{ item }">
                    <v-icon v-if="update_karyawan" class="mr-2" @click.stop="editKaryawan(item)">mdi-pencil</v-icon>
                    <v-icon v-if="update_karyawan" class="mr-2" @click.stop="editPassword(item)">mdi-form-textbox-lock</v-icon>
                    <v-icon v-if="delete_karyawan" class="mr-2" @click.stop="confirmDelete(item)">mdi-delete</v-icon>
                </template>
            </v-data-table>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Details Karyawan -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
            <v-dialog v-if="popUpBreakPoint" v-model="popupDetails" fullscreen hide-overlay transition="dialog-bottom-transition">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    {{karyawan}}
                </v-card>
            </v-dialog >
            <!-- Laptop/PC or other md lg device will not display fullscreen dialog -->
            <v-dialog v-else v-model="popupDetails" width="650px">
                <v-card>
                    <v-toolbar dense flat>
                        <span class="title font-weight-light">Detail Profil</span>
                        <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols="4" class="text-center">
                                    <v-avatar class="profile" size="164">
                                        <v-img src="../assets/avatar.png"/>
                                    </v-avatar>
                                    <v-list-item>
                                        <v-list-item-content>
                                        <v-list-item-title class="title">{{karyawan.name}}</v-list-item-title>
                                        <v-list-item-subtitle>{{karyawan.userTaskGroupId}}</v-list-item-subtitle>
                                        </v-list-item-content>
                                    </v-list-item>
                                </v-col>
                                <v-col cols="8">
                                    <table class="subtitle-1 detailsKaryawan">
                                        <tr>
                                            <td>E-Mail</td>
                                            <td>:</td>
                                            <td>{{karyawan.email}}</td>
                                        </tr>
                                        <tr>
                                            <td>TTL</td>
                                            <td>:</td>
                                            <td>{{karyawan.placeOfBirth}}, {{formatDateList(karyawan.dateOfBirth)}}</td>
                                        </tr>
                                        <tr>
                                            <td>religion</td>
                                            <td>:</td>
                                            <td>{{karyawan.religion}}</td>
                                        </tr>
                                        <tr>
                                            <td>Status</td>
                                            <td>:</td>
                                            <td>{{karyawan.status}}</td>
                                        </tr>
                                        <tr>
                                            <td>address</td>
                                            <td>:</td>
                                            <td>{{karyawan.address}}</td>
                                        </tr>
                                        <tr>
                                            <td>No. HP</td>
                                            <td>:</td>
                                            <td>{{karyawan.telephone}}</td>
                                        </tr>
                                    </table>
                                    <div class="title">Permission</div>
                                    <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                        <v-expansion-panel v-for="(permission,index) in tasks" :key="index">
                                            <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                            <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                <v-checkbox
                                                    disabled
                                                    v-model="karyawan.taskId"
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
                        </v-container>
                    </v-card-text>
                </v-card>
            </v-dialog>
            <!-- *************************************************************************************************************** -->
            <!-- *************************************************************************************************************** -->

            <!-- *************************************************************************************************************** -->
            <!-- Edit Password -->
            <!-- *************************************************************************************************************** -->
            <v-dialog v-model="popUpEditPassword" width="500px">
                <v-card>
                    <v-toolbar dense flat>
                            <span class="title font-weight-light">Ubah Password</span>
                            <v-btn absolute right icon @click="close"><v-icon>mdi-close</v-icon></v-btn>
                    </v-toolbar>
                    <v-form ref="form">
                        <v-card-text>
                            <v-row>
                                <v-col cols='12'>
                                    <v-text-field 
                                        color="accent"
                                        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                                        :rules="passwordRules"
                                        :type="showPassword ? 'text' : 'password'"
                                        v-model="karyawan.password"
                                        label="Password"
                                        hint="Minimal 8 Karakter"
                                        class="input-group--focused mt-n6"
                                        @click:append="showPassword = !showPassword"
                                    />
                                </v-col>
                            </v-row>
                        </v-card-text>
                    </v-form>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n12" color="red darken-1" text @click="close">Close</v-btn>
                                <v-btn class="mt-n12" color="blue darken-1" text @click="confirmUpdatePassword">Save</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-dialog>

            <v-dialog persistent v-model="popUpConfirmEditPassword" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin mengubah password <b>{{tempnameKaryawan}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="updatePassword">Ya</v-btn>
                            </v-row>
                            <div v-if="loadingConfirm">
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
            <!-- Edit Karyawan -->
            <!-- *************************************************************************************************************** -->
            <!-- Phone / other xs sm device will display fullscreen dialog -->
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
                                    <v-text-field color="accent" label="Nama" v-model="karyawan.name" :rules="nameRules"/>
                                </v-col>
                                <v-col cols="12">
                                    <v-text-field color="accent" label="Email" v-model="karyawan.email" :rules="emailRules"/>
                                </v-col>
                                <!-- <v-col cols="6">
                                    <v-text-field 
                                        color="accent"
                                        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                                        :rules="passwordRules"
                                        :type="showPassword ? 'text' : 'password'"
                                        v-model="karyawan.password"
                                        label="Password"
                                        hint="Minimal 8 Karakter"
                                        class="input-group--focused"
                                        @click:append="showPassword = !showPassword"
                                    />
                                </v-col> -->
                                <v-col cols="6">
                                    <v-text-field color="accent" label="Tempat Lahir" v-model="karyawan.placeOfBirth" :rules="placeOfBirthRules"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-menu
                                        ref="datePickerMenuEdit"
                                        v-model="datePickerMenuEdit"
                                        :close-on-content-click="false"
                                        :return-value.sync="karyawan.dateOfBirth"
                                        transition="scale-transition"
                                        offset-y
                                        min-width="290px"
                                        >
                                        <template v-slot:activator="{ on }">
                                            <v-text-field
                                            color="accent"
                                            v-model="karyawan.dateOfBirth"
                                            label="Tanggal Lahir"
                                            prepend-icon="mdi-calendar"
                                            readonly
                                            v-on="on"
                                            ></v-text-field>
                                        </template>
                                        <v-date-picker v-model="karyawan.dateOfBirth" no-title scrollable>
                                            <v-spacer></v-spacer>
                                            <v-btn text color="primary" @click="datePickerMenuEdit = false">Cancel</v-btn>
                                            <v-btn text color="primary" @click="$refs.datePickerMenuEdit.save(karyawan.dateOfBirth)">OK</v-btn>
                                        </v-date-picker>
                                    </v-menu>
                                </v-col>
                                <v-col cols="6">
                                    <v-select
                                    :items="religions"
                                    label="Agama"
                                    color="accent"
                                    v-model="karyawan.religion"
                                    ></v-select>
                                </v-col>
                                <v-col cols="6">
                                    <v-select
                                    :items="status"
                                    label="Status"
                                    color="accent"
                                    v-model="karyawan.status"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12">
                                    <v-text-field color="accent" label="Alamat" v-model="karyawan.address" :rules="addressRules"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-text-field color="accent" label="Nomor HP" v-model="karyawan.telephone" type="number" :rules="telephoneRules"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-select
                                    item-text="name"
                                    item-value="id"
                                    :items="listuserTaskGroupId"
                                    label="Divisi"
                                    color="accent"
                                    v-model="karyawan.userTaskGroupId"
                                    v-on:change="selectuserTaskGroupId"></v-select>
                                </v-col>
                                <v-col cols="12" v-if="edit_tasks">
                                    <div class="title mt-n1">Permission</div>
                                    <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                        <v-expansion-panel v-for="(permission,index) in tasks" :key="index">
                                            <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                            <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                <v-checkbox
                                                    v-model="karyawan.taskId"
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
                                    <v-text-field color="accent" label="Nama" v-model="karyawan.name" :rules="nameRules"/>
                                </v-col>
                                <v-col cols="12">
                                    <v-text-field color="accent" label="Email" v-model="karyawan.email" :rules="emailRules"/>
                                </v-col>
                                <!-- <v-col cols="6">
                                    <v-text-field 
                                        color="accent"
                                        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                                        :rules="passwordRules"
                                        :type="showPassword ? 'text' : 'password'"
                                        v-model="karyawan.password"
                                        label="Password"
                                        hint="Minimal 8 Karakter"
                                        class="input-group--focused"
                                        @click:append="showPassword = !showPassword"
                                    />
                                </v-col> -->
                                <v-col cols="6">
                                    <v-text-field color="accent" label="Tempat Lahir" v-model="karyawan.placeOfBirth" :rules="placeOfBirthRules"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-menu
                                        ref="datePickerMenuEdit"
                                        v-model="datePickerMenuEdit"
                                        :close-on-content-click="false"
                                        :return-value.sync="karyawan.dateOfBirth"
                                        transition="scale-transition"
                                        offset-y
                                        min-width="290px"
                                        >
                                        <template v-slot:activator="{ on }">
                                            <v-text-field
                                            color="accent"
                                            v-model="karyawan.dateOfBirth"
                                            label="Tanggal Lahir"
                                            prepend-icon="mdi-calendar"
                                            readonly
                                            v-on="on"
                                            ></v-text-field>
                                        </template>
                                        <v-date-picker v-model="karyawan.dateOfBirth" no-title scrollable>
                                            <v-spacer></v-spacer>
                                            <v-btn text color="primary" @click="datePickerMenuEdit = false">Cancel</v-btn>
                                            <v-btn text color="primary" @click="$refs.datePickerMenuEdit.save(karyawan.dateOfBirth)">OK</v-btn>
                                        </v-date-picker>
                                    </v-menu>
                                </v-col>
                                <v-col cols="6">
                                    <v-select
                                    :items="religions"
                                    label="Agama"
                                    color="accent"
                                    v-model="karyawan.religion"
                                    ></v-select>
                                </v-col>
                                <v-col cols="6">
                                    <v-select
                                    :items="status"
                                    label="Status"
                                    color="accent"
                                    v-model="karyawan.status"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12">
                                    <v-text-field color="accent" label="Alamat" v-model="karyawan.address" :rules="addressRules"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-text-field color="accent" label="Nomor HP" v-model="karyawan.telephone" type="number" :rules="telephoneRules"/>
                                </v-col>
                                <v-col cols="6">
                                    <v-select
                                    item-text="name"
                                    item-value="id"
                                    :items="listuserTaskGroupId"
                                    label="Divisi"
                                    color="accent"
                                    v-model="karyawan.userTaskGroupId"
                                    v-on:change="selectuserTaskGroupId"></v-select>
                                </v-col>
                                <v-col cols="12" v-if="edit_tasks">
                                    <div class="title mt-n1">Permission</div>
                                    <v-expansion-panels accordion class="elevation-0" :multiple="true" v-model="panel">
                                        <v-expansion-panel v-for="(permission,index) in tasks" :key="index">
                                            <v-expansion-panel-header>{{permission.modul}}</v-expansion-panel-header>
                                            <v-expansion-panel-content v-for="(permissionList,idx) in permission.action" :key="idx">
                                                <v-checkbox
                                                    v-model="karyawan.taskId"
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
                    <v-card-text>Apakah Anda Yakin ingin mengubah profil <b>{{tempnameKaryawan}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="save">Ya</v-btn>
                            </v-row>
                            <div v-if="loadingConfirm">
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
            <!-- *************************************************************************************************************** -->
            
            <!-- *************************************************************************************************************** -->
            <!-- Confirm on Delete -->
            <!-- *************************************************************************************************************** -->
            <v-dialog persistent v-model="popUpConfirmDelete" width="500px">
                <v-card>
                    <v-card-title>Konfirmasi</v-card-title>
                    <v-card-text>Apakah Anda Yakin ingin menghapus Karyawan <b>{{karyawan.name}}</b>?</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="close">Tidak</v-btn>
                                <v-btn class="mt-n5" color="blue darken-1" text @click="deleteKaryawan">Ya</v-btn>
                            </v-row>
                            <div v-if="loading">
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
import api from '@/api.js'
import _ from 'lodash'
import moment from 'moment/src/moment'
export default {
    name: 'Karyawan',
    created() {
        this.get()
    },
    data() {
        return {
            create_karyawan: _.indexOf(JSON.parse(localStorage.getItem('tasks')), 'create_karyawan') >= 0,
            update_karyawan: _.indexOf(JSON.parse(localStorage.getItem('tasks')), 'update_karyawan') >= 0,
            delete_karyawan: _.indexOf(JSON.parse(localStorage.getItem('tasks')), 'delete_karyawan') >= 0,
            edit_tasks: _.indexOf(JSON.parse(localStorage.getItem('tasks')), 'edit_tasks') >= 0,
            karyawans: [
                // {id:1, email:'ananda@gmail.com', password:'coreofthecore', name:'Mahendra Fajar', userTaskGroupId:'Gudang', placeOfBirth:'Denpasar', dateOfBirth:'1999-04-27', religion:'Islam', status:'Belum Menikah', address:'Jalan', telephone:'08180', tasks: []},
                // {id:2, email:'ananda@gmail.com', password:'coreofthecore', name:'Ananda Vijaya', userTaskGroupId:'Gudang', placeOfBirth:'Denpasar', dateOfBirth:'1999-04-27', religion:'Islam', status:'Belum Menikah', address:'Jalan', telephone:'08180', tasks: []},
                // {id:3, email:'ananda@gmail.com', password:'coreofthecore', name:'Satria Kemal', userTaskGroupId:'Gudang', placeOfBirth:'Denpasar', dateOfBirth:'1999-04-27', religion:'Islam', status:'Belum Menikah', address:'Jalan', telephone:'08180', tasks: []},
            ],
            religions: ['Islam','Kristen Protestan','Katolik','Hindu','Buddha','Lainnya..'],
            status: ['Belum Menikah','Menikah','Lainnya..'],
            karyawan: {
                id:null,
                email:'',
                password: '',
                name:'',
                userTaskGroupId:'', 
                placeOfBirth:'',
                dateOfBirth:'',
                religion:'',
                status:'', 
                address:'',
                telephone:'',
                taskId: [],
                uid: ''
            },
            karyawanDefault: {
                id:null,
                email:'',
                password: '',
                name:'',
                userTaskGroupId:'', 
                placeOfBirth:'',
                dateOfBirth:'',
                religion:'',
                status:'', 
                address:'',
                telephone:'',
                taskId: [],
                uid: ''
            },
            tasks: [
                {modul:'Barang', action: [
                    {id:0,label:'Add Barang'},
                    {id:1,label:'Read Barang'}
                ]},
                {modul:'Karyawan', action: [
                    {id:2,label:'Add Karyawan'},
                    {id:3,label:'Read Karyawan'}
                ]}
            ],
            listuserTaskGroupId:[],
            tempnameKaryawan:'',
            searchKaryawan:'',
            newPassword: '',
            loadingList:true,
            loading: false,
            loadingConfirm: false,
            snackbar: false,
            snackbarColor: null,
            snackbarMessage: null,
            showPassword: false,
            popUpNew: false,
            datePickerMenuAdd: false,
            datePickerMenuEdit: false,
            datePickerMenu: false,
            popupDetails: false,
            popUpEdit: false,
            popUpConfirmSave: false,
            popUpConfirmDelete: false,
            popUpEditPassword: false,
            popUpConfirmEditPassword: false,
            panel: false,
            selectedIndex: -1,
            // -----
            // Rules
            // -----
            emailRules: [
                v => !!v || 'E-mail Harus Diisi',
                v => /.+@.+\..+/.test(v) || 'E-mail Tidak Valid',
            ],
            nameRules: [v => !!v || 'Name Harus Diisi'],
            placeOfBirthRules: [v => !!v || 'Tempat Lahir Harus Diisi'],
            addressRules: [v => !!v || 'address Harus Diisi'],
            telephoneRules: [
                v => !!v || 'Nomor HP Harus Diisi',
                // v => (v && v.length >= 8) || 'Nomor HP Tidak Valid',
            ],
            passwordRules: [
                v => !!v || 'Password Harus Diisi',
                v => v.length >= 8 || 'Minimal 8 Karakter',
            ],
            // -----
            editedIndex: null       
        }
    },
    
    methods: {
        get(){
            api.getAllUser().then(karyawans => {
                this.karyawans = karyawans
                this.loadingList = false
            })
            api.getAllUserTaskGroup().then(userTaskGroups => {
                this.listuserTaskGroupId = userTaskGroups
            })
            api.getAllTask().then(tasks => {
                this.tasks = tasks
            })
        },
        selectuserTaskGroupId(value){
            this.karyawan.userTaskGroupId = value
            api.getGroupTaskByUserTaskGroupId(value).then(groupTasks => {
                this.karyawan.taskId = []
                groupTasks.task.forEach(element => {
                    this.karyawan.taskId.push(element.taskId)
                });
            })
        },
        details(item) {
            this.selectedIndex = this.karyawans.indexOf(item)
            this.karyawan = Object.assign({},item)
            this.popupDetails = true
        },
        formatDateList(val) {
            return val ? moment(val).format('DD/MM/YYYY') : ''
        },
        close() {
            this.popUpConfirmEditPassword = false
            this.popupDetails = false
            this.popUpConfirmSave = false
            this.popUpConfirmDelete = false
            this.popUpEdit = false
            this.popUpNew = false
            this.popUpEdit = false
            this.popUpEditPassword = false
            this.selectedIndex = -1
            this.karyawan = Object.assign({},this.karyawanDefault)
        },
        saveNewKaryawan() {
            this.loading = true
            if(this.$refs.form.validate()) {
                api.insertUser(this.karyawan).then(response => {
                    this.snackbarColor = 'success'
                    this.snackbarMessage = response
                }).catch(error => {
                    this.snackbarColor = 'error'
                    this.snackbarMessage = error
                }).finally(() => {
                    this.loading = false
                    this.snackbar = true
                    this.close()
                    this.get()
                })
            }
        },
        editKaryawan(item) {
            this.selectedIndex = this.karyawans.indexOf(item)
            this.tempnameKaryawan = item.name
            this.karyawan = Object.assign({},item)
            this.popUpEdit = true
        },
        editPassword(item) {
            this.selectedIndex = this.karyawans.indexOf(item)
            this.tempnameKaryawan = item.name
            this.karyawan = Object.assign({},item)
            this.popUpEditPassword = true
        },
        deleteKaryawan(){
            this.loading = true
            api.deleteUser(this.karyawan).then(response => {
                this.snackbarColor = 'success'
                this.snackbarMessage = response
            }).catch(error => {
                this.snackbarColor = 'error'
                this.snackbarMessage = error
            }).finally(() => {
                this.loading = false
                this.close()
                this.snackbar = true
                this.get()
            })
        },
        // Save Karyawan
        confirmSave() {
            if(this.$refs.form.validate()) {
                this.popUpEdit = false
                this.popUpConfirmSave = true
            }
        },
        confirmDelete(item){
            this.karyawan = item
            this.popUpConfirmDelete = true
        },
        confirmUpdatePassword() {
            if(this.$refs.form.validate()) {
                this.popUpEditPassword = false
                this.popUpConfirmEditPassword = true
            }
        },
        updatePassword(){
            this.loadingConfirm = true
            api.updatePasswordUser(this.karyawan).then(response => {
                this.snackbarColor = 'success'
                this.snackbarMessage = response
            }).catch(error => {
                this.snackbarColor = 'error'
                this.snackbarMessage = error
            }).finally(() => {
                this.close()
                this.get()
                this.loadingConfirm = false
                this.popUpConfirmSave = false
                this.snackbar = true
            })
        },

        //this need promise to ensure that the data in the db and vue in synced !!! IMPORTANT !!!
        save() {
            // //to find the object inside karyawans
            // let obj = this.karyawans.find( ({id}) => id === this.karyawan.id )
            // //get all of the property name of karyawans
            // var loop = Object.getOwnPropertyNames(this.karyawanDefault)
            // //assign all the value of the property of obj2 in karyawans with karyawan
            // for(let i=0; i<loop.length; i++) {
            //     this.karyawans[this.karyawans.indexOf(obj)][loop[i]] = this.karyawan[loop[i]]
            // }
            // this.karyawan = Object.assign({},this.karyawanDefault)
            this.loadingConfirm = true
            api.updateUser(this.karyawan).then(response => {
                this.snackbarColor = 'success'
                this.snackbarMessage = response
            }).catch(error => {
                this.snackbarColor = 'error'
                this.snackbarMessage = error
            }).finally(() => {
                this.get()
                this.loadingConfirm = false
                this.popUpConfirmSave = false
                this.snackbar = true
            })
        }
    },

    computed: {
        karyawanHeaders() {
            if(!this.popUpBreakPoint) {
                return [
                    {text:'name',value:'name'},
                    {text:'',value:'actions',width:'15%'}
                ]
            } else {
                return [
                    {text:'name',value:'name'},
                    {text:'',value:'actions',width:'40%'}
                ]
            }
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
            if(!this.popupDetails) {
                this.karyawan = Object.assign({},this.karyawanDefault)
            }
        },
        popUpEditPassword() {
            this.$refs.form.resetValidation()
        }
    }

}
</script>

<style scoped>

.detailsKaryawan tr td:nth-child(2) {
    width: 20%;
    text-align: center
}

</style>