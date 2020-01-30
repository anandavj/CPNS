<template>
  <v-layout row wrap justify-center>
    <v-flex xs12 md6 lg4>
      <v-card raised>
        <v-layout justify-center>
          <v-img
            src="https://www.american.edu/uploads/profiles/large/chris_palmer_profile_11.jpg"
            max-width="40%"
            style="border-radius:50%;"
            class="mt-2"
          ></v-img>
        </v-layout>
        <v-layout row wrap justify-center>
          <v-card-title primary-title>
            <div class="text-center">
              <h3 class="headline mb-0">Ananda Vijaya</h3>
              <div>Manajer</div>
            </div>
          </v-card-title>
        </v-layout>
        <v-divider></v-divider>
        <v-card-text>
          <v-layout>
            <table>
              <tr>
                <td>
                  <h3>HP</h3>
                </td>
                <td>:</td>
                <td>
                  <v-text-field name="name" label="0812345678910" disabled id="id"></v-text-field>
                </td>
              </tr>
              <tr>
                <td>
                  <h3>Email</h3>
                </td>
                <td>:</td>
                <td>
                  <v-text-field name="name" label="ayam17an@gmail.com" disabled id="id"></v-text-field>
                </td>
              </tr>
              <tr>
                <td>
                  <h3>Alamat</h3>
                </td>
                <td>:</td>
                <td>
                  <v-text-field name="name" label="Semarang" disabled id="id"></v-text-field>
                </td>
              </tr>
            </table>
          </v-layout>
        </v-card-text>
        <v-divider></v-divider>
        <v-card-text>
          <h2>Roles</h2>
          <v-list>
            <v-list-item-content>
              <v-list-item-title>Atur Barang</v-list-item-title>
              <v-list-item-subtitle>
                <div class="text-wrap">Dapat menambah data barang baru, menghapus, dll</div>
              </v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-content>
              <v-list-item-title>Atur Karyawan</v-list-item-title>
              <v-list-item-subtitle>
                <div class="text-wrap">Dapat menambah data karyawan baru, menghapus, dll</div>
              </v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-content>
              <v-list-item-title>Atur Pricelist</v-list-item-title>
              <v-list-item-subtitle>
                <div class="text-wrap">Dapat merubah harga barang, harga minimum, dll</div>
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list>
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: "Profil"
};
</script>

<style>
</style>