<template>
  <v-app>
    <div>
    <Toolbar />
    <v-btn color="primary" @click="showNav()">Show Category</v-btn>
    <v-col>
      <v-col 
      sm="2"
      class="ma-5"
      v-bind:class="[visible ? 'show' : 'hide']"
      id= 'nav'
    >
      
        <v-card 
        color="orange darken-2"
        >
          <v-col 
          v-for="x in 10"
          :key = x
          color="primary" text-color="primary" >
            <v-card 
              dark
              color="orange darken-2"
              outlined
              flat
              class="pa-1 hide"
            >
              Category {{ x }}
            </v-card>
          </v-col>
        </v-card>
        </v-col>
    </v-col>
    </div>
  </v-app>
</template>

<script>
// import Vue from 'vue';

// var nav = new Vue({
//   el: '#nav',
//   data: () => {
//     visible=true
//   }
// });

// import Navbar from "@/components/Navbar";
import Toolbar from "@/components/Toolbar";
export default {
  name: "Catalogue",
  data(){
    return{
      visible: true
    }
  },
  props: {
    source: String
  },

  components: { Toolbar },
  methods: {
    showNav(){
      this.visible = !this.visible;
    }
  }
};
</script>
  
<style scoped>

</style>