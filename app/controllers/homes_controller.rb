class HomesController < ApplicationController
	def index
		@hotels = HTTParty.get( 'https://5c08f37bea3172001389ccbd.mockapi.io/hotels/en', headers: {'Content-Type' => 'application/json'} )

		if params['lang'] == 'zh'
			@hotels = HTTParty.get( 'https://5c08f37bea3172001389ccbd.mockapi.io/hotels/zh', headers: {'Content-Type' => 'application/json'} )
		elsif params['lang'] == 'ja'				
			@hotels = HTTParty.get( 'https://5c08f37bea3172001389ccbd.mockapi.io/hotels/ja', headers: {'Content-Type' => 'application/json'} )
		end
	end
end
