<template>
  <v-dialog
      v-model="dialog"
      scrollable fullscreen 
      persistent :overlay="false"
      max-width="500px"
      transition="dialog-transition"
  >
      boi
  </v-dialog>
</template>

<script>
export default {
    data(){
        return{
            dialog:true
        }
    }
}
</script>

<style>

</style>