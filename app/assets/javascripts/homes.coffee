# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$hdn_lang				= $('#hdn-language')
	$select_lang 		= $('#select-language')
	$datatable 			= $('#dataTable')
	$modal 					= $('#exampleModal')

	if $hdn_lang.val() != 'en'
		$select_lang.val($hdn_lang.val())
	else
		$select_lang.val('en')

	$select_lang.change ->
		$this = $(this)
		window.location.href = '?lang=' + $this.val()

	$datatable.find('tbody > tr').click ->
		$this = $(this)
		id = $this.find('.hotel-id').val()
		name = $this.find('.hotel-name').val()
		rating = $this.find('.hotel-rating').val()
		stars = $this.find('.hotel-stars').val()
		address = $this.find('.hotel-address').val()
		photo = $this.find('.hotel-photo').val()
		price = $this.find('.hotel-price').val()
		description = $this.find('.hotel-description').val()

		$modal.find('#exampleModalLabel').text(name)
		$modal.find('#hotel-image').attr('src', photo)
		$modal.find('#hotel-rating').text(rating)
		$modal.find('#hotel-price').text(price)
		$modal.find('#hotel-address').text(address)
		$modal.find('#hotel-description').append(description)

		$modal.modal('show')

	$datatable.DataTable();