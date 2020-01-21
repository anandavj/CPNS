<template>
    <v-app>
        <form>
            <v-text-field outlined v-model="namaDivisi" label="Nama Divisi"></v-text-field>
            <v-card flat class="pa-5">
                <div class="headline mb-3">Permission</div>
                <v-divider></v-divider>
                <div v-for="(permission, index) in permissions" :key="index">
                    <v-checkbox v-model="selectedPermission" :label="permission" :value="index"></v-checkbox>
                </div>
            </v-card>
            <v-container>
                <v-row justify="end">
                    <v-col md="4" lg="2">
                        <v-btn block outlined color="red">Cancel</v-btn>
                    </v-col>
                    <v-col md="4" lg="2">
                        <v-btn block color="light-green" dark>Save</v-btn>
                    </v-col>
                </v-row>
            </v-container>
        </form>
    </v-app>
</template>

<script>
export default {
    name:'addDivisi',
    data() {
        return {
            namaDivisi:'',
            permissions:['Update Barang','Create Barang','Delete Barang','Update Stock','Create Karyawan','Update Karyawan','Read Karyawan'],
            selectedPermission:[]
        }
    }
}
</script>