<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Karyawan"
                :solo='true'
                :clearable='true'
                append-icon="mdi-magnify"
            />
            <v-data-table
                :headers="karyawanHeaders"
                :items="karyawans"
                :disable-sort="true"
                :disable-filtering="true"
                :mobile-breakpoint="1"
                :hide-default-footer="true"
            >
            </v-data-table>
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Karyawan',

    data() {
        return {
            karyawans: [
                {no:1, nama:'Mahendra Fajar'},
                {no:2, nama:'Ananda Vijaya'},
                {no:3, nama:'Satria Kemal'},
            ]
        }
    },

    computed: {
        karyawanHeaders() {
            return [
                {text:'No',value:'no',width:'20%',filter: () => true},
                {text:'Nama',value:'nama'}
            ]
        }
    }
    
}
</script>