<template>
  <div id="test">
    <p> {{searchData.results[0].name || searchData.results[0].title}} </p>
    <p> {{ searchData.results[0].overview }} </p>
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
  },
  data() {
    return {
      overview: "",
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
