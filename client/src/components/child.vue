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
let showData = "";

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

let runSearch = function (keyword, baseURL) {
    let url = ''.concat(baseURL, 'search/multi?api_key=', APIKEY, '&query=', keyword);
    fetch(url)
    .then(result=>result.json())
    .then((data)=>{
        console.log(data);
        //process the returned data

        document.getElementById('output').innerHTML = JSON.stringify(data, null, 4);
        //work with results array...

    })
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
  computed: {
    inputData: function() {
      return runSearch(this.msg, this.url);
    }
  }
}
</script>

<style scoped>
#test {
  text-align: center;

}
</style>
