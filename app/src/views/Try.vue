<template>
  <v-app>
    
    <v-col class="pa-0">

    <v-col class="ma-0 pa-0"><Toolbar/></v-col>
     <v-col>
       <v-row no-gutters
        v-for="n in 4"
        :key="n"
        class=ma-0>
        <v-col
        v-for="k in 4"
        :key="k"
          >
        <v-card
          class="pa-2 ma-0"
          outlined
          tile
        >
          boi
        </v-card>
        </v-col>
        </v-row> 
        </v-col>
    </v-col>
    

  </v-app>
</template>


<script>
import Toolbar from '@/components/Toolbar'
export default {
  name: "Try",
  props: {
    source: String
  },

  components: {Toolbar},
  methods: {}
};
</script>

<style>
  .cont{
    margin:0px;
  }
</style>>
