def movie_attributes(overrides = {})
	{
		name: "Movie 1",
		description: "ok" ,
		ratings: 9,
		show_time: 10.days.since,
		price: 10
	}.merge(overrides)
end
