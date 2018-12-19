# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
# $(document).ready ->
# 	$hdn_lang				= $('#hdn-language')
# 	$select_lang 		= $('#select-language')
# 	# $datatable 			= $('#dataTable')
# 	$modal 					= $('#exampleModal')
# 	$card_hotel			= $('.card-hotel')

# 	get_url_params = ->
# 		query_parameters = {}
# 		query_string = location.search.substring(1)
# 		re = /([^&=]+)=([^&]*)/g
# 		while (m = re.exec(query_string))
# 			query_parameters[decodeURIComponent(m[1])] = decodeURIComponent(m[2])
# 		query_parameters

# 	if $hdn_lang.val() != 'en'
# 		$select_lang.val($hdn_lang.val())
# 	else
# 		$select_lang.val('en')

# 	$select_lang.change ->
# 		$this = $(this)
# 		url_params = get_url_params()
# 		url_params['lang'] = $this.val()
# 		location.search = $.param(url_params)

# 	$card_hotel.click ->
# 		$this = $(this)
# 		id = $this.find('.hotel-id').val()
# 		name = $this.find('.hotel-name').val()
# 		rating = $this.find('.hotel-rating').val()
# 		stars = $this.find('.hotel-stars').val()
# 		address = $this.find('.hotel-address').val()
# 		photo = $this.find('.hotel-photo').val()
# 		price = $this.find('.hotel-price').val()
# 		description = $this.find('.hotel-description').val()

# 		$modal.find('#exampleModalLabel').text(name)
# 		$modal.find('#hotel-image').attr('src', photo)
# 		$modal.find('#hotel-rating').text(rating)
# 		$modal.find('#hotel-price').text(price)
# 		$modal.find('#hotel-address').text(address)
# 		$modal.find('#hotel-description').append(description)

# 		$modal.find('#exampleModalLabel').append('<div id="hotel-stars">')
# 		for i in [1..stars]
# 			$modal.find('#exampleModalLabel').append('<i class="fas fa-star text-warning"></i>')
# 		if stars != '5'
# 			for i in [1..5-stars]
# 				$modal.find('#exampleModalLabel').append('<i class="far fa-star text-warning"></i>')
# 		$modal.find('#exampleModalLabel').append('</div>')

# 		$modal.modal('show')

# 	# $datatable.DataTable();