<template>
    <v-app>
        <div>
            <v-text-field
            placeholder="Cari Karyawan"
            solo
            clearable
            append-icon="mdi-magnify"
        />
        <v-card :elevation="2" min-height="112">
            <v-card-title>Mahendra Fajar</v-card-title>
            <v-card-text>CEO</v-card-text>
        </v-card>
        </div>
    </v-app>
</template>

<script>
export default {
    name: 'Karyawan',

    data() {
        return {
        }
    }
    
}
</script>