class MoviesController < ApplicationController
	
	def index
		@movies = Movie.upcoming
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update(movie_params)
		redirect_to @movie
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
		redirect_to @movie
	end

	def destroy
		Movie.delete(params[:id])
		redirect_to movies_path
	end

end

private
	def movie_params
		params.require(:movie).permit(:name, :description, :show_time, :ratings, :price)
	end
