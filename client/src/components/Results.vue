<template>
  <div id="test" v-if="searchData.results[0]">
    <p> {{searchData.results[0].name || searchData.results[0].title}} </p>
    <p> {{ searchData.results[0].overview }} </p>
    <p> {{ searchData.results[0].first_air_date || searchData.results[0].release_date }}</p>
    <p> {{ searchDetails.networks[0].name }}</p>

  </div>
</template>

<script>
// Add result id prop, and use for details query data
export default {
  name: 'Results',
  props: {
    searchData: {
      required: true,
    },
    searchDetails: {

    },
  },
  data() {
    return {
      Title: "",
    }
  },
  computed: {
  },
}
</script>

<style scoped>
#test {
  text-align: center;

}
</style>
