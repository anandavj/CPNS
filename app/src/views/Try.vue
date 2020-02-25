<template>
  <v-app>
    <select class="image-picker show-html">
      <optgroup label="Cats">
        <option data-img-src="http://placekitten.com/220/200" value="1">Cute Kitten 1</option>
        <option data-img-src="http://placekitten.com/180/200" value="2">Cute Kitten 2</option>
        <option data-img-src="http://placekitten.com/130/200" value="3">Cute Kitten 3</option>
        <option data-img-src="http://placekitten.com/270/200" value="4">Cute Kitten 4</option>
      </optgroup>
      <optgroup label="Animals">
        <option data-img-src="http://lorempixel.com/220/200/animals/" value="5">Animal 1</option>
        <option data-img-src="http://lorempixel.com/180/200/animals/" value="6">Animal 2</option>
        <option data-img-src="http://lorempixel.com/130/200/animals/" value="7">Animal 3</option>
        <option data-img-src="http://lorempixel.com/270/200/animals/" value="8">Animal 4</option>
      </optgroup>
    </select>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    dataImages: [
      "https://picsum.photos/id/231/200",
      "https://picsum.photos/id/22/200",
      "https://picsum.photos/id/221/200",
      "https://picsum.photos/id/13/200",
      "https://picsum.photos/id/1/200",
      "https://picsum.photos/id/14/200",
      "https://picsum.photos/id/123/200",
      "https://picsum.photos/id/222/200"
    ],
    onSelectMultipleImage: []
  })
};
</script>

<style>
</style>