<template>
  <v-app>
    <h1 class="text-center font-weight-thin">List Barang</h1>

    <v-container class="mt-n3">
      <v-dialog v-model="popupModal" persistent max-width="400px">
        <template v-slot:activator="{ on }">
          <v-row justify="center" v-if="items.length == 0">
            <v-col lg="11">
              <v-card outlined class="text-center" v-on="on" color="light-green">
                <v-card-text class="white--text">
                  <v-icon class="white--text">mdi-plus</v-icon>Tambah List
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>
          <v-row justify="end" v-else>
            <v-col cols="12" md="2">
              <v-btn block v-on="on" color="light-blue" class="white--text">
                <v-icon>mdi-plus</v-icon>Tambah
              </v-btn>
            </v-col>
          </v-row>
        </template>
        <v-card>
          <v-card-title>Tambah Barang</v-card-title>
          <v-card-text>
            <v-row>
              <v-col cols="12">
                <v-text-field v-model="editableUnit.name" label="Nama Barang" required />
              </v-col>
             
            </v-row>
          </v-card-text>
          <v-card-actions>
            <v-container>
              <v-row justify="center">
                <v-btn class="mt-n5" color="red darken-1" text @click="close">Close</v-btn>
                <v-btn class="mt-n5" color="blue darken-1" text @click="save">Save</v-btn>
              </v-row>
            </v-container>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-container>

    <v-container v-if="items.length > 0" class="mt-n5">
      <v-row justify="center">
        <v-col lg="12">
          <v-data-table
            :headers="headers"
            :items="items"
            :disable-sort="true"
            :disable-filtering="true"
            :hide-default-footer="true"
          >
            <template v-slot:item.actions="{ item }">
              <v-icon class="mr-2" @click="editUnit(item)">mdi-pencil</v-icon>
              <v-icon @click="confirmDelete(item)">mdi-delete</v-icon>
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </v-container>
    <v-container v-if="items.length > 0">
      <v-row justify="end">
        <v-col md="4" lg="2">
          <v-btn block outlined color="red">Cancel</v-btn>
        </v-col>
        <v-col md="4" lg="2">
          <v-btn block color="light-green" dark>Save</v-btn>
        </v-col>
      </v-row>
    </v-container>
    <v-dialog v-model="confirmModal" persistent max-width="350px">
      <v-card>
        <v-card-title>Confirmation</v-card-title>
        <v-card-text>Apakah Anda Yakin Ingin Menghapus List Ini?</v-card-text>
        <v-card-actions>
          <v-container>
            <v-row justify="center">
              <v-btn class="mt-n5" color="red darken-1" text @click="cancel">Tidak</v-btn>
              <v-btn class="mt-n5" color="blue darken-1" text @click="deleteUnit">Ya</v-btn>
            </v-row>
          </v-container>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
export default {
  name: "addUnit",
  data() {
    return {
      headers: [
        { text: "Nama", value: "name" },
      
      ],
      editableUnit: {
        name: "",
      
      },
      defaultUnit: {
        name: "",
       
      },
      items: [],
      popupModal: false,
      confirmModal: false,
      editedIndex: -1
    };
  },
  methods: {
    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.items[this.editedIndex], this.editableUnit);
      } else {
        this.items.push(this.editableUnit);
      }
      this.close();
    },
    close() {
      this.popupModal = false;
      setTimeout(() => {
        this.editableUnit = Object.assign({}, this.defaultUnit);
        this.editedIndex = -1;
      }, 300);
    },
    cancel() {
      this.confirmModal = false;
      setTimeout(() => {
        this.editedIndex = -1;
      }, 300);
    },
    editUnit(item) {
      this.editedIndex = this.items.indexOf(item);
      this.editableUnit = Object.assign({}, item);
      this.popupModal = true;
    },
    confirmDelete(item) {
      this.confirmModal = true;
      this.editedIndex = this.items.indexOf(item);
    },
    deleteUnit() {
      this.items.splice(this.editedIndex, 1);
      this.editedIndex = -1;
      this.confirmModal = false;
    }
  }
};
</script>