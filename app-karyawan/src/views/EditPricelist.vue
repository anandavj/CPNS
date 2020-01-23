<template>
    <v-app>
        <div>
            <v-text-field
                placeholder="Cari Karyawan"
                :solo="true"
                :clearable="true"
                append-icon="mdi-magnify"
                class="font-regular font-weight-light"
                v-model="searchKaryawan"
            />
            <v-data-table
                :headers="headers"
                :items="karyawans"
                v-model="karyawansSelected"
                :show-select="true"
                :disable-sort="true"
                :mobile-breakpoint="1"
                :hide-default-footer="true"
                :items-per-page=9999
                class="font-regular font-weight-light"
            >
            <template v-slot:item.actions="{ item }">
                <v-icon class="mr-2" @click="editItem(item)" :disabled="karyawansSelected.length > 0">mdi-pencil</v-icon>
                <v-icon @click="confirmDelete(item)" :disabled="karyawansSelected.length > 0">mdi-delete</v-icon>
            </template>
            </v-data-table>
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'EditPricelist',

    data() {
        return {
            karyawans: [
                {id:1, nama:'Mahendra Fajar', margin:'5'},
                {id:2, nama:'Satria Kemal', margin:'10'}
            ],
            karyawansSelected: [],
            editableKaryawan: {
                nama: '',
                margin: null
            },
            defaultKaryawan: {
                nama: '',
                margin: null
            },
            searchKaryawan:''
        }
    },

    computed: {
        headers() {
            return [
                {text:'Nama', value:'nama', width:'50%'},
                {text:'Margin', value:'margin', filter: () => true},
                {text:'', value:'actions', width:'50%', filter: () => true}
            ]
        }
    }
}
</script>