$(document).ready () ->
	tag = "blandaful"
	dom = $('.js-grams')
	load = $('.js-load')
	time = 30000

	gram = new Grams(dom, tag, load)
	$('.js-tag').text(tag)
	$('.js-refresh').bind 'click', (event) =>
		gram.refresh()
		$('.js-extra').fadeOut(800)
	
	setInterval (->
		if gram.length() > 0
			gram.refresh()
	), time