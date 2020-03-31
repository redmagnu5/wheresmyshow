<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div class="">
      <input v-model="message" placeholder="Search movies, tv shows, films..">
    </div>
    <child :msg= "message" :url="url"/>
  </div>
</template>

<script>
import child from './components/child.vue'
let baseURL = 'https://api.themoviedb.org/3/';

export default {
  name: 'App',
  components: {
    child
  },

  data() {
    return {
      message: "",
      url: baseURL,
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 80px;
}
</style>
