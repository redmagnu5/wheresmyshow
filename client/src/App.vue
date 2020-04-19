<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div class="">
      <input v-on:keyup.capture="Search('3166-2:UM'), Details" v-model="input" placeholder="Search Movies, TV, Film..">
    </div>
    <Results v-if="searchData != null" v-bind:searchData = "searchData"/>
  </div>
</template>

<script>
import Results from './components/Results.vue';
let baseURL = 'https://api.themoviedb.org/3/';
let APIKEY = "45d8067615f09095c8d918479844088c";
let streamURL = "https://www.themoviedb.org/";

export default {
  name: 'App',
  components: {
    Results,
  },

  data() {
    return {
      searchData: null,
      input: null,
      streamDetails: null,
      searchDetails: null,
    }
  },
  methods: {
    Search: function multiSearch(region) {
      let url = ''.concat(baseURL, 'search/multi?api_key=', APIKEY, '&region=', region, '&query=', encodeURIComponent(this.input));
      if (this.input == null) {
        return null;
      } else {
        return fetch(url)
        .then((response) => response.json())
        .then((responseData) => {
          this.searchData = responseData;
          //console.log(this.searchData);
          //console.log(url);
        })
        .catch(error => console.warn(error));
      }
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
        //console.log(this.searchDetails);
      })
      .catch(error => console.warn(error));
    },
    StreamDetails: function streamTVDetails(id) {
      let url = ''.concat(streamURL, 'tv/', id, '/watch');
      console.log(url);
      return fetch(url)
      .then((response) => response.json())
      .then((responseData) => {
        this.streamDetails = responseData;
        console.log(this.streamDetails);
      })
      .catch(error => console.warn(error));
    },
  },
  mounted() {

  },
  computed: {
    //scrape html from moviedb to show streaming networks
    Details: function() {
      var showID = this.searchData.results[0].id;
      if (this.searchData == null || this.searchData == 'undefined') {
        this.searchDetails == "";
        return this.searchDetails;
      } else if (this.searchData.results[0].media_type == 'tv') {
        this.TvDetails(showID);
        this.StreamDetails(showID);
        return this.searchDetails;
      } else if (this.searchData.results[0].media_type == 'movie'){
        this.MovieDetails(showID);
        return this.searchDetails;
      } else {
        return this.searchDetails;
      }
    },
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
