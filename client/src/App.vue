<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div class="">
      <input v-on:keyup.enter="Search" v-model="message" placeholder="Search Movies, TV, Film..">
    </div>
    <p>{{ theData }}</p>
  </div>
</template>

<script>
//import child from './components/child.vue'
let baseURL = 'https://api.themoviedb.org/3/';
let APIKEY = "45d8067615f09095c8d918479844088c";

export default {
  name: 'App',
  components: {
    //child
  },

  data() {
    return {
      message: "",
      //export search data to child components
      searchData: "",
      url: baseURL,
    }
  },
  methods: {
    Search: function runsearch() {
      let url = ''.concat(baseURL, 'search/multi?api_key=', APIKEY, '&query=', this.message);
      return fetch(url)
      .then((response) => response.json())
      .then((responseData) => {
        var responseString = JSON.stringify(responseData, null, 4);
        this.searchData = responseString;
        //Successfully returning searchdata into instance variable, no need for next line
        document.getElementById('output').innerHTML = JSON.stringify(responseString, null, 4);
      })
      .catch(error => console.warn(error));
    }
  },
  computed: {
    theData: function() {
      return this.searchData;
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
