def movie_attributes(overrides = {})
	{
		name: "Movie 1",
		description: "ok good movie to watch" ,
		show_time: 10.days.since,
		capacity: 10,
		price: 10,
		image_file_name: "placeholder.png"
	}.merge(overrides)
end
