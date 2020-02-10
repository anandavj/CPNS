<template>
  <v-app-bar class="bar" h>
    <v-layout row class="justify-start align-center ">
      <v-flex md3 class="justify-center">
        <v-layout row>
          <v-icon x-large class="ml-2" color="primary">mdi-checkbox-blank</v-icon>
          <v-col class="primary--text"> BUANA PAKSA INDONESIA</v-col>
        </v-layout>
      </v-flex>
      <v-flex md6 v-if="!this.$route.meta.drawer">
        <v-layout row wrap class="align-center">
          <v-col>
            <div class="align-center mt-6">
              <v-text-field
                outlined
                rounded
                clearable
                single-line
                dense
                label="search"
                append-icon="mdi-magnify"
              ></v-text-field>
            </div>
          </v-col>
        </v-layout>
      </v-flex>
      <v-flex md9 v-if="this.$route.meta.drawer">
        <v-row height=100%>
          <v-flex xs1>
           
          </v-flex>
          <v-flex xs1>
            <v-card color="black">
              boi
            </v-card>
            
          </v-flex>
        </v-row>

      </v-flex>
    </v-layout>
  </v-app-bar>
</template>

<script>
export default {};
</script>

<style>

</style>