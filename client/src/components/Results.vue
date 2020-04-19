<template>
  <div id="test" v-if="searchData.results[0]">
    <p> {{searchData.results[0].name || searchData.results[0].title}} </p>
    <p> {{ searchData.results[0].overview }} </p>
    <p> {{ searchData.results[0].first_air_date || searchData.results[0].release_date }}</p>

  </div>
</template>

<script>

export default {
  name: 'Results',
  props: {
    searchData: {
      required: true,
    },
    streamDetails: {

    },
  },
  data() {
    return {
    }
  },
  computed: {

  },
  methods: {

  }
}
</script>

<style scoped>
#test {
  text-align: center;

}
</style>
