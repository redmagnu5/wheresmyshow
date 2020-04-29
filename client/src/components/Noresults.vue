<template>
<div>
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="text-center"> Results </h2>
      <p class="text-muted mb-5 text-center"> The details on the media you specified will be displayed below.</p>
      <div class="row">
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-magic-wand"></use>
          </svg>
          <h6>First Aired</h6>
          <p class="text-muted"> First air date if available </p>
        </div>
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-heart"></use>
          </svg>
          <h6>Release Date</h6>
          <p class="text-muted">Release date if avaialble.</p>
        </div>
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-rocket"></use>
          </svg>
          <h6>Media Type</h6>
          <p class="text-muted">Is it a tv series or a movie</p>
        </div>
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-paperclip"></use>
          </svg>
          <h6>Number of Seasons</h6>
          <p class="text-muted">Self explanatory.</p>
        </div>
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-screen"></use>
          </svg>
          <h6>Number of Episodes</h6>
          <p class="text-muted">Self explanatory.</p>
        </div>
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-inbox"></use>
          </svg>
          <h6>Revenue</h6>
          <p class="text-muted">Amount of total revenue generated.</p>
        </div>
        <div class="col-sm-6 col-lg-4 mb-3">
          <svg class="lnr text-primary services-icon">
            <use xlink:href="#lnr-inbox"></use>
          </svg>
          <h6>Runtime</h6>
          <p class="text-muted">How long is the movie.</p>
        </div>
      </div>
    </div>
  </section>
</div>
</template>

<script>
export default {
  name: "NoResults",
  data: () => ({

  })
}
</script>

<style lang="scss" scoped>
</style>
