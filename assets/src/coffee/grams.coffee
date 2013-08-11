class Grams
	constructor: (@dom, @tag, @load) ->
		@cache = {}
		@onLoaded()

	url: (count) ->
		return 'https://api.instagram.com/v1/tags/' + @tag + '/media/recent?callback=?&count='+ count

	refresh: ->
		@onLoad()
		token = '34292689.017e6b1.9b93c3bdc8a9450f85caeb083155098e'
		access_parameters = {access_token:token}
		count = if @length() < 1 then 20 else 4
		me = this
		$.getJSON(@url(count), access_parameters, (response) -> me.onDataLoaded(response))

	onDataLoaded: (response) ->
		if response.meta.code == 200
			@onSuccess response
		else
			@onError response
	onError: (response) ->
		error = response.meta.error_message
		@dom.append("Something happened, Instagram said: " + error)
	onSuccess: (response) ->
		photos = response.data
		result = $("<div>")
		if photos.length > 0
			for key of photos
				photo = photos[key]
				id = photo.id
				if @cache[id] == undefined
					photo = photo.images.low_resolution.url
					@cache[id] = ""
					photo = $("<img>", {src: photo})
					result.append photo
			@dom.prepend result
		else
			response = meta:
				error_message: "Hmm. I couldn't find anything!"
			@onError response
		@onLoaded()

	length: () ->
		size = 0
		obj = @cache
		for key of obj
			if obj.hasOwnProperty(key)
				size++
		return size

	onLoad: ->
		@load.slideDown()
	onLoaded: ->
		@load.slideUp()

