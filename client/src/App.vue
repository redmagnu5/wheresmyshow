<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div class="">
      <input v-on:keyup="Search" v-model="input" placeholder="Search Movies, TV, Film..">
    </div>
    <Results v-bind:searchData = "SearchInfo" v-bind:searchDetails="Details"/>
  </div>
</template>

<script>
import Results from './components/Results.vue';
let baseURL = 'https://api.themoviedb.org/3/';
let APIKEY = "45d8067615f09095c8d918479844088c";

export default {
  name: 'App',
  components: {
    Results,
  },

  data() {
    return {
      searchData: null,
      input: "",
      searchDetails: null,
    }
  },
  methods: {
    Search: function multiSearch() {
      let url = ''.concat(baseURL, 'search/multi?api_key=', APIKEY, '&query=', this.input);
      return fetch(url)
      .then((response) => response.json())
      .then((responseData) => {
        this.searchData = responseData;
        //console.log(responseData);
      })
      .catch(error => console.warn(error));
    },
    detailsSearch: function detailSearch(ID) {
      let url = ''.concat(baseURL, 'tv/', ID, '?api_key=', APIKEY);
      //console.log(url);
      return fetch(url)
      .then((response) => response.json())
      .then((responseData) => {
        this.searchDetails = responseData;
        //console.log(this.searchDetails);
      })
      .catch(error => console.warn(error));
    }
  },
  mounted() {
  },
  computed: {
    Details: function() {
      if (this.searchData == null || this.searchData == 'undefined') {
        this.searchDetails == {networks: ""};
        return this.searchDetails;
      } else {
        this.detailsSearch(this.searchData.results[0].id);
        return this.searchDetails;
      }
    },
    SearchInfo: function() {
      if (this.searchData == null || this.searchData == 'undefined') {
        this.searchData == {results: "Nothing Yet"};
        return this.searchData;
      } else {
        return this.searchData;
      }
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
