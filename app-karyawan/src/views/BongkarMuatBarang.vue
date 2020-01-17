<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Nomor"
                solo
                clearable
                append-icon="mdi-magnify"
                v-model="searchNomor"
            />
            <v-data-table
                :headers="headers"
                :items="items"
                :search="searchNomor"
                :custom-filter="items.nomor"
                hide-default-footer="true"
            >
            </v-data-table>
        </div>
    </v-app>
</template>
<script>
export default {
    name:'BongkarMuatBarang',
    data() {
        return {
            items: [
                {nomor:'INV/XXX/XX',status:'Bongkar',tanggal:'10 Januari 2020',keterangan:''}
            ],
            searchNomor:''
        }
    },
    computed: {
        headers() {
            return [
                {text:'Nomor', value:'nomor'},
                {text:'Status', value:'status',filter: value => {if (!this.status) return true
                return value < parseInt(this.status)}},
                {text:'Tanggal', value:'tanggal',filter: value => {if (!this.tanggal) return true
                return value < parseInt(this.tanggal)}},
                {text:'Keterangan', value:'keterangan',filter: value => {if (!this.keterangan) return true
                return value < parseInt(this.keterangan)}}
            ]
        }
    }
}
</script>