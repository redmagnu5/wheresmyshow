<template>
  <div id="test">
    <p>{{inputData}}</p>
    <p id="output"></p>
  </div>
</template>

<script>
//const APIKEY is inside key.js
let APIKEY = "45d8067615f09095c8d918479844088c";
let configData = null;
let baseImageURL = null;
let searchData = "";

/*
let getConfig = function (input) {
    let url = "".concat(baseURL, 'configuration?api_key=', APIKEY);
    fetch(url)
    .then((result)=>{
        return result.json();
    })
    .then((data)=>{
        baseImageURL = data.images.secure_base_url;
        configData = data.images;
        console.log('config:', data);
        console.log('config fetched');
        runSearch(input)
    })
    .catch(function(err){
        alert(err);
    });
}
*/

function runsearch(keyword, baseURL) {
  let url = ''.concat(baseURL, 'search/multi?api_key=', APIKEY, '&query=', keyword);
  return fetch(url)
  .then((response) => response.json())
  .then((responseData) => {
    console.log(responseData);
    document.getElementById('output').innerHTML = JSON.stringify(responseData, null, 4);
    return responseData;
  })
  .catch(error => console.warn(error));
}

export default {
  name: 'child',
  props: {
    msg: {
      type: String,
      required: true,
    },
    url: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      searchData: "",
    }
  },
  computed: {
    inputData: function() {
      return runsearch(this.msg, this.url);
    },
  },
}
</script>

<style scoped>
#test {
  text-align: center;

}
</style>
