<template>
    <v-app>
        <file-pond
            name="test"
            ref="pond"
            label-idle="Drop files here or <span class='filepond--label-action'>Browse</span> <span class='filepondFormatText'>Format: xls / xlsx</span>"
            accepted-file-types="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.oasis.opendocument.spreadsheet"
            v-bind:files="myFiles"
            instant-upload="false"
            v-on:updatefiles="handleFilePondUpdateFile"
            labelInvalidField="remove"
            :fileValidateTypeDetectType="detectorFunction"
            fileValidateTypeLabelExpectedTypes="Hanya menerima format XLS dan XLSX"
        />
    </v-app>
</template>

<script>
import vueFilePond from 'vue-filepond'
import 'filepond/dist/filepond.min.css'
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type'

const FilePond = vueFilePond(
    FilePondPluginFileValidateType,
)

export default {
    name:'ImportBarang',
    data: function() {
      return { myFiles: [] }
    },
    components: {
      FilePond
    },

    methods: {
        handleFilePondUpdateFile(files) {
            this.myFiles = files.map(files => files.file);
        },

        detectorFunction(source, type) {
            return new Promise((resolve, reject) => {
                let validTypes = [
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    "application/vnd.ms-excel",
                    "application/vnd.oasis.opendocument.spreadsheet"
                ]
                let bCondition01 = (validTypes.indexOf(type) > -1)
                let ext = source.name.slice(-5).toLowerCase()
                let bCondition02 = (type == "") && (ext === ".xlsx")
                if (bCondition01 || bCondition02) {
                    resolve(validTypes[0])
                } else {
                    reject()
                }
                resolve(type);
            })
        },
    }
}
</script>

<style>

.filepond--file-action-button {
    cursor: pointer;
}
.filepond--drop-label {
    color: white;
}
.filepond--panel-root {
    background-color: rgba(29, 111, 66, 1);
}
.filepond--file-action-button {
    background-color: white;
    color: red;
}
.filepond--item-panel {
    background-color: #1D6F42;
}
.filepondFormatText {
    font-size: 14px !important;
    display: block;
}

</style>