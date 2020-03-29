<template>
    <v-layout align-center fill-height>
        <v-container fluid>
            <v-row align="center" justify="center">
            <v-col cols="12" sm="8" md="4">
                <v-card class="elevation-12" :disabled="loading">
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
                        :rules="emailRules"
                    />

                    <v-text-field
                        v-model="password"
                        v-on:keyup.enter="signIn"
                        id="password"
                        label="Password"
                        name="password"
                        type="password"
                        :rules="passRules"
                    />
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer />
                    <v-btn color="primary" class="mt-n7 mb-2 mr-1" @click="signIn">
                        <span v-if="loading">
                            <v-progress-circular size="20" :indeterminate="{loading}"></v-progress-circular>
                        </span>
                        <span v-else class="body-2">Login</span>
                    </v-btn>
                </v-card-actions>
                </v-card>
            </v-col>
            </v-row>
        </v-container>
        <v-dialog v-model="errLogin" width="400px">
                <v-card>
                    <v-card-title>Error Login!</v-card-title>
                    <v-card-text>{{errLoginMsg}}</v-card-text>
                    <v-card-actions>
                        <v-container>
                            <v-row justify="center">
                                <v-btn class="mt-n5" color="red darken-1" text @click="errLogin = !errLogin">OK</v-btn>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
        </v-dialog>
    </v-layout>
</template>

<script>

import firebase from 'firebase'

export default {
    mounted(){
        firebase.auth().onAuthStateChanged(function(user) {
            if (user) this.$router.push('/')
        });
    },
    name: 'Login',
    data() {
        return {
            email:'',
            password:'',
            loading:false,
            errLogin:false,
            errLoginMsg:'',
            emailRules: [
                v => !!v || 'Email is Required',
                v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
            ],
            passRules: [
                v => !!v || 'Password is Required'
            ]
        }
    },
    methods: {
        signIn() {
            this.loading = true
            firebase.auth().signInWithEmailAndPassword(this.email,this.password)
                .then(() => {
                    this.$router.push('/')
                    this.loading = false
                })
                .catch((err) => {
                    this.errLogin= true
                    this.errLoginMsg = err
                    this.loading = false
                })
        }
    }
}
</script>