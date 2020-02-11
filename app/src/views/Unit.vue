  <template>
  <v-app>
    <template>
      <v-btn fab dark large color="primary" fixed right bottom @click="dialog = !dialog">
        <v-icon dark>mdi-plus</v-icon>
      </v-btn>
    </template>
    <v-data-table :headers="headers" :items="units" sort-by="calories" class="elevation-1">
      <template v-slot:top>
        <v-toolbar flat color="white">
          <v-toolbar-title>List Satuan</v-toolbar-title>
          <v-divider class="mx-4" inset vertical></v-divider>
          <v-spacer></v-spacer>
          <v-dialog v-model="dialog" max-width="500px">
            <v-card>
                <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field v-model="editedItem.name" label="Nama satuan"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field v-model="editedItem.abbrev" label="singkatan"></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field v-model="editedItem.quantity" label="besaran"></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                <v-btn color="blue darken-1" text @click="save">Save</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-toolbar>
      </template>
      <template v-slot:item.action="{ item }">
        <v-icon small class="mr-2" @click="editItem(item)">mdi-pencil</v-icon>
        <v-icon small @click="deleteItem(item)">mdi-delete</v-icon>
      </template>
      <template v-slot:no-data>
        <v-btn color="primary" @click="initialize">Reset</v-btn>
      </template>
    </v-data-table>
  </v-app>
</template>


<script>
export default {
  data: () => ({
    dialog: false,
    headers: [
      {
        text: "Nama Satuan",
        align: "left",
        // sortable: false,
        value: "name",
        width: "20%"
      },
      {
        text: "Singkatan",
        align: " d-sm-none d-lg-table-cell",
        value: "abbrev",
        width: "10%"
      },
      {
        text: "Besaran",
        align: " d-none d-lg-table-cell",
        value: "quantity",
        width: "10%"
      },
      {
        text: "Atction",
        align: " d-none d-lg-table-cell",
        value: "action",
        width: "10%"
      }
    ],
    units: [],
    editedIndex: -1,
    editedItem: {
      name: ""
    },
    defaultItem: {
      name: ""
    }
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Satuan Baru" : "Edit satuan";
    }
  },

  watch: {
    dialog(val) {
      val || this.close();
    }
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      this.units = [
        {
          name: "kilogram",
          abbrev: "kg",
          quantity: "massa"
        },
        {
          name: "gram",
          abbrev: "gr",
          quantity: "massa"
        },
        {
          name: "meter",
          abbrev: "m",
          quantity: "panjang"
        }
      ];
    },

    editItem(item) {
      this.editedIndex = this.units.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      const index = this.units.indexOf(item);
      confirm("Apakah anda yakin akan menghapus satuan tersebut?") &&
        this.units.splice(index, 1);
    },

    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.units[this.editedIndex], this.editedItem);
      } else {
        this.units.push(this.editedItem);
      }
      this.close();
    }
  }
};
</script>