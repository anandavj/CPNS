<template>
    <v-app>
        <form>
            <v-text-field v-model="namaDivisi" label="Nama Divisi"></v-text-field>
        </form>
    </v-app>
</template>

<script>
export default {
    name:'addDivisi',
    data() {
        return {
            namaDivisi:'',
        }
    }
}
</script>