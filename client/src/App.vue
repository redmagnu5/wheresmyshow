<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div class="">
      <input v-on:keyup="Search" v-model="input" placeholder="Search Movies, TV, Film..">
    </div>
    <Results v-bind:searchData = "SearchInfo" v-bind:searchDetails="SearchDetails"/>
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
    //change to tv search only
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
    TvDetails: function tvDetails(ID) {
      let url = ''.concat(baseURL, 'tv/', ID, '?api_key=', APIKEY);
      //console.log(url);
      return fetch(url)
      .then((response) => response.json())
      .then((responseData) => {
        this.searchDetails = responseData;
        //console.log(this.searchDetails);
      })
      .catch(error => console.warn(error));
    },
    MovieDetails: function movieDetails(ID) {
      let url = ''.concat(baseURL, 'movie/', ID, '?api_key=', APIKEY);
      //console.log(url);
      return fetch(url)
      .then((response) => response.json())
      .then((responseData) => {
        this.searchDetails = responseData;
        console.log(this.searchDetails);
      })
      .catch(error => console.warn(error));
    },
  },
  mounted() {
  },
  computed: {
    // correctly returns the right request, but spams them. Not sure why
    Details: function() {
      if (this.searchData == null || this.searchData == 'undefined') {
        this.searchDetails == "";
        return this.searchDetails;
      } else if (this.searchData.results[0].media_type == 'tv') {
        this.TvDetails(this.searchData.results[0].id);
        return this.searchDetails;
      } else if (this.searchData.results[0].media_type == 'movie'){
        this.MovieDetails(this.searchData.results[0].id);
        return this.searchDetails;
      } else {
        return "";
      }
    },
    SearchInfo: function() {
      if (this.searchData == null || this.searchData == 'undefined') {
        this.searchData == {results: "Nothing Yet"};
        return this.searchData;
      } else {
        return this.searchData;
      }
    },
    SearchDetails: function() {
      if (this.searchData == null || this.searchData == 'undefined') {
        this.searchData == {results: "Nothing Yet"};
        return this.searchDetails;
      } else {
        this.TvDetails(this.searchData.results[0].id);
        return this.searchDetails;
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
