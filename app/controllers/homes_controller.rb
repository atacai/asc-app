class HomesController < ApplicationController
	
	def index
	end

	def search
		hotels = HTTParty.get( 'https://5c08f37bea3172001389ccbd.mockapi.io/hotels/en', headers: {'Content-Type' => 'application/json'} )

		if params['lang'] == 'zh'
			hotels = HTTParty.get( 'https://5c08f37bea3172001389ccbd.mockapi.io/hotels/zh', headers: {'Content-Type' => 'application/json'} )
		elsif params['lang'] == 'ja'				
			hotels = HTTParty.get( 'https://5c08f37bea3172001389ccbd.mockapi.io/hotels/ja', headers: {'Content-Type' => 'application/json'} )
		end

		condition = ''
		if !params['name'].nil? && !params['name'].blank?
			condition = condition.blank? ? "hotel['name'].downcase.include? params['name']" : " && hotel['name'].downcase.include? params['name']"
		end
		if !params['price'].nil? && !params['price'].blank?
			condition = condition.blank? ? "hotel['price'] >= params['price']" : " && hotel['price'] >= params['price']"
		end
		if !params['address'].nil? && !params['address'].blank?
			condition = condition.blank? ? "hotel['address'].downcase.include? params['address']" : " && hotel['address'].downcase.include? params['address']"
		end
		if !params['stars'].nil? && !params['stars'].blank?
			condition = condition.blank? ? "hotel['stars'] == params['stars']" : " && hotel['stars'] == params['stars']"
		end
		if !params['rating'].nil? && !params['rating'].blank?
			condition = condition.blank? ? "hotel['rating'] >= params['rating']" : " && hotel['rating'] >= params['rating']"
		end

		@results = condition.blank? ? hotels : hotels.select { |hotel| eval(condition)  }
		
		if params['lang'].nil?
			params['lang'] = 'en'
		end
	end
end
