<template>
    <v-app>
        <v-content>
            <v-container class="fill-height" fluid>
                <v-row align="center" justify="center">
                <v-col cols="12" sm="8" md="4">
                    <v-card class="elevation-12">
                    <v-toolbar color="primary" dark flat>
                        <v-toolbar-title>Login</v-toolbar-title>
                        <v-spacer />
                    </v-toolbar>
                    <v-card-text>
                        <v-form>
                        <v-text-field
                            v-model="email"
                            v-on:keyup.enter="signIn"
                            id="email"
                            label="E-Mail"
                            name="email"
                            type="email"
                        />

                        <v-text-field
                            v-model="password"
                            v-on:keyup.enter="signIn"
                            id="password"
                            label="Password"
                            name="password"
                            type="password"
                        />
                        </v-form>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer />
                        <v-btn color="primary" @click="signIn">Login</v-btn>
                    </v-card-actions>
                    </v-card>
                </v-col>
                </v-row>
            </v-container>
        </v-content>
    </v-app>
</template>

<script>

import firebase from 'firebase'

export default {
    name: 'Login',
    data() {
        return {
            email:'',
            password:''
        }
    },
    methods: {
        signIn() {
            firebase.auth().signInWithEmailAndPassword(this.email,this.password)
                .then( () => {
                    this.$route.meta.drawer = true
                    this.$router.push('dashboard')
                })
                .catch( (err) => {
                    alert(err)
                })
        }
    }
}
</script>