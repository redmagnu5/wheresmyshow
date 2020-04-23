<template>
<div id="app">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" >

        </div>
      </div>

    </div>
  </header>
  <div class="container">
    <br />
    <br />
    <br />
    <div class="row justify-content-center">
      <div class="col-12 col-md-10 col-lg-8">
        <form class="card card-sm">
          <div class="card-body row no-gutters align-items-center">
            <div class="col-auto">
              <i class="fas fa-search h4 text-body"></i>
            </div>
            <!--end of col-->
            <div class="col">
              <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search any movie or TV show.. " v-on:keyup.capture="Search('3166-2:UM'), Details" v-model="input">
            </div>
            <!--end of col-->
          </div>
        </form>
      </div>
      <!--end of col-->
    </div>
  </div>
  <br />
  <br />
  <NoResults v-if="!searchData" />
  <Results v-if="searchData" v-bind:searchData="searchData" v-bind:searchDetails="searchDetails"/>

</div>
</template>

<script>
import Results from './components/Results.vue';
import NoResults from './components/Noresults.vue';
let baseURL = 'https://api.themoviedb.org/3/';
let APIKEY = process.env.VUE_APP_API_KEY;
let streamURL = "https://www.themoviedb.org/";

export default {
  name: 'App',
  components: {
    Results,
    NoResults,
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
          console.log(this.searchDetails);
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
    StreamDetails: function streamTVDetails(id) {
      let url = ''.concat(streamURL, 'tv/', id, '/watch');
      //console.log(url);
      return fetch(url)
        .then((response) => response.json())
        .then((responseData) => {
          this.streamDetails = responseData;
          //console.log(this.streamDetails);
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
        return this.searchDetails;
      } else if (this.searchData.results[0].media_type == 'movie') {
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
  margin-top: 0px;
}

.form-control-borderless {
  border: none;
}

.form-control-borderless:hover,
.form-control-borderless:active,
.form-control-borderless:focus {
  border: none;
  outline: none;
  box-shadow: none;
}
.carousel-item {
  height: 40vh;
  min-height: 100px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  background-image: url('assets/banner.png');
}
section {
  padding-top: 0rem;
  padding-bottom: 5rem;
}

.lnr {
  display: inline-block;
  fill: currentColor;
  width: 1em;
  height: 1em;
  vertical-align: -0.05em;
  stroke-width: 1;
}

.services-icon {
  margin-bottom: 20px;
  font-size: 30px;
}
bgc2, .vLine, .hLine {
    background-color: #0F52BA;
}

.quote-icon {
  font-size: 40px;
  margin-bottom: 20px;
}
.services-icon {
    font-size: 60px;
    margin-left: 2rem;
}
</style>
