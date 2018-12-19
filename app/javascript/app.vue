<template>
  <div id="app" class="ml-5 mr-5">
    <div class="row mt-5">
      <div class="col-md-12 ml-auto mr-auto">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-3">
                <div class="form-group">
                  <input type="text" v-model="search_name" id="name" class="form-control" placeholder="Name ..." />
                </div>
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <input type="number" v-model="search_price" id="price" class="form-control" placeholder="Price ..." />
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <input type="text" v-model="search_address" id="address" class="form-control" placeholder="Address ..." />
                </div>
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <select id="stars" v-model="search_stars" class="form-control">
                    <option value="">Star</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                  </select>
                </div>
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <input type="number" v-model="search_rating" id="rating" class="form-control" placeholder="Rating ..."/>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-2 ml-auto text-right">
                <input type="hidden" value="en"/>
                <button type="button" id="btn-search" class="btn btn-primary" v-on:click="search">Search</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  <div class="row mt-5 mb-1">
    <label for="select-language" class="col-md-1 col-form-label ml-auto">Language</label>
    <div class="col-md-2">
      <select v-model="language" id="select-language" name="language" class="form-control" v-on:change="change_language">
        <option value="en">English</option>
        <option value="zh">Chinese</option>
        <option value="ja">Japanese</option>
      </select>
    </div>
  </div>

    <div class="row mb-5">
      <div class="col-md-3" v-for="hotel in filtered_hotels">
        <div class="card-body card-hotel">
          <div class="card-hotel-image">
            <img v-bind:src="hotel.photo" />
          </div>
          <div class="card-hotel-name">
            {{ hotel.name }}
          </div>
          <div class="card-hotel-stars">
            <i class="fas fa-star text-warning" v-for="i in hotel.stars"></i><i class="far fa-star text-warning" v-for="i in 5-hotel.stars"></i>
          </div>
          <div class="card-hotel-address">
            <i class="fas fa-map-marker-alt text-danger"></i>
            {{ hotel.address }}
          </div>
          <div class="card-hotel-price">
            <i class="fas fa-dollar-sign text-success"></i>
            {{ format_decimal(hotel.price, 2) }}
          </div>
          <div class="card-hotel-rating">
            <i class="fas fa-thumbs-up text-primary"></i>
            {{ format_decimal(hotel.rating, 1) }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'app',
  data: function () {
    return {
      message: "Hello Vue!",
      hotels_en: [],
      hotels_zh: [],
      hotels_ja: [],
      hotels: [],
      filtered_hotels: [],
      language: 'en',
      search_name: '',
      search_price: '',
      search_address: '',
      search_stars: '',
      search_rating: '',
    }
  },
  mounted () {
    axios.all([
      axios.get('https://5c08f37bea3172001389ccbd.mockapi.io/hotels/en'),
      axios.get('https://5c08f37bea3172001389ccbd.mockapi.io/hotels/zh'),
      axios.get('https://5c08f37bea3172001389ccbd.mockapi.io/hotels/ja')
    ])
    .then(axios.spread((en_response, zh_response, ja_response) => {
      this.hotels_en = en_response.data
      this.hotels_zh = zh_response.data
      this.hotels_ja = ja_response.data
      // default is english
      this.hotels = en_response.data
      this.filtered_hotels = en_response.data
    }))
  },
  methods: {
    format_decimal: function (value) {
      return value.toFixed(2)
    },
    search: function () {
      const name = this.search_name.toLowerCase()
        , price = this.search_price
        , address = this.search_address.toLowerCase()
        , stars = this.search_stars
        , rating = this.search_rating

      // filter name
      if (name) {
        this.filtered_hotels = this.hotels.filter(hotel => {
          return hotel['name'].toLowerCase().includes(name)
        })
      }
      // filter price
      if (price) {
        this.filtered_hotels = this.hotels.filter(hotel => {
          return hotel['price'] <= price
        })
      }
      // filter address
      if (address) {
        this.filtered_hotels = this.hotels.filter(hotel => {
          return hotel['address'].toLowerCase().includes(address)
        })
      }
      // filter stars
      if (stars) {
        this.filtered_hotels = this.hotels.filter(hotel => {
          return hotel['stars'] >= stars
        })
      }
      // filter rating
      if (rating) {
        this.filtered_hotels = this.hotels.filter(hotel => {
          return hotel['rating'] >= rating
        })
      }

      // no filter
      if (!name && !price && !address && !stars && !rating) {
        this.filtered_hotels = this.hotels
      }
    },
    change_language: function () {
      if (this.language == 'en') {
        this.hotels = this.hotels_en
      } else if (this.language == 'zh') {
        this.hotels = this.hotels_zh
      } else if (this.language == 'ja') {
        this.hotels = this.hotels_ja
      }
      this.search()
    },
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
