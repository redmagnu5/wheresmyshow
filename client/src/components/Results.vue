<template>
<div id="test" v-if="searchData.results[0] != null || searchData.results[0] != 'undefined'">
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="text-center"> {{ Name || Title }}</h2>
      <p class="text-muted mb-5 text-center"> {{ Overview }}</p>
      <div class="row">
        <div v-if="FirstAir !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-magic-wand"></use>
          </svg>
          <h6>First Aired</h6>
          <p class="text-muted"> {{FirstAir}} </p>
        </div>
        <div v-if="ReleaseDate !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-heart"></use>
          </svg>
          <h6>Release Date</h6>
          <p class="text-muted">{{ReleaseDate}}</p>
        </div>
        <div v-if="MediaType !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-rocket"></use>
          </svg>
          <h6>Media Type</h6>
          <p class="text-muted">{{MediaType}}</p>
        </div>
        <div v-if="Seasons !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-paperclip"></use>
          </svg>
          <h6>Number of Seasons</h6>
          <p class="text-muted">{{Seasons}}</p>
        </div>
        <div v-if="Episodes !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-screen"></use>
          </svg>
          <h6>Number of Episodes</h6>
          <p class="text-muted">{{Episodes}}</p>
        </div>
        <div v-if="Revenue !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-inbox"></use>
          </svg>
          <h6>Revenue</h6>
          <p class="text-muted">{{Revenue}}</p>
        </div>
        <div v-if="Runtime !=null" class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-inbox"></use>
          </svg>
          <h6>Runtime</h6>
          <p class="text-muted">{{Runtime}}</p>
        </div>
      </div>
    </div>
  </section>
</div>
</template>

<script>
export default {
  name: 'Results',
  props: {
    searchData: {
      required: true,
    },
    searchDetails: {
      required: true,
    },
  },
  data() {
    return {}
  },
  computed: {
    Overview: function() {
      if (this.searchData.results[0] == null || this.searchData.results[0] == "") {
        return null;
      } else {
        return this.searchData.results[0].overview;
      }
    },
    Name: function() {
      if (this.searchData.results[0] == null || this.searchData.results[0] == "") {
        return null;
      } else {
        return this.searchData.results[0].name;
      }
    },
    Title: function() {
      if (this.searchData.results[0] == null || this.searchData.results[0] == "") {
        return null;
      } else {
        return this.searchData.results[0].title;
      }
    },
    FirstAir: function() {
      if (this.searchData.results[0] == null || this.searchData.results[0].first_air_date == "") {
        return null;
      } else {
        return this.searchData.results[0].first_air_date;
      }
    },
    ReleaseDate: function() {
      if (this.searchData.results[0] == null) {
        return null;
      } else {
        return this.searchData.results[0].release_date;
      }
    },
    MediaType: function() {
      if (this.searchData.results[0] == null) {
        return null;
      } else {
        return this.searchData.results[0].media_type.toUpperCase();
      }
    },
    Seasons: function() {
      if (this.searchDetails == null) {
        return null;
      } else {
        return this.searchDetails.number_of_seasons;
      }
    },
    Episodes: function() {
      if (this.searchDetails == null) {
        return null;
      } else {
        return this.searchDetails.number_of_episodes;
      }
    },
    Revenue: function() {
      if (this.searchDetails == null) {
        return null;
      } else {
        return "$" + this.searchDetails.revenue.toString();
      }
    },
    Runtime: function() {
      if (this.searchDetails == null) {
        return null;
      } else {
        return this.searchDetails.runtime.toString() + "minutes";
      }
    },
    Status: function() {
      if (this.searchDetails == null) {
        return null;
      } else {
        return this.searchDetails.status;
      }
    },
    Budget: function() {
      if (this.searchDetails == null) {
        return null;
      } else {
        return "$" + this.searchDetails.budget.toString();
      }
    },
  },
  methods: {

  }
}
</script>

<style scoped>
#test {
  text-align: center;

}
section {
  padding-top: 5rem;
  padding-bottom: 5rem;
}
</style>
