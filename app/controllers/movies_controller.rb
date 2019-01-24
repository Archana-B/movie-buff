class MoviesController < ApplicationController

	before_action :require_sign_in , except: [:index, :show]

	before_action :require_admin, except: [:index, :show]

	before_action :set_up_movie, only: [:show, :update, :edit]
	
	def index
		case params[:filter]
		when "free"
			@movies = Movie.free
		when "recent"
			@movies = Movie.recent
		when "released"
			@movies = Movie.released
		else
			@movies = Movie.upcoming
		end
	end

	def show
		@fans = @movie.fans
		@genres = @movie.genres
		
		if current_user
			@current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
		end
	end

	def edit
		@genres = @movie.genres
	end

	def update
		@movie.update(movie_params)
		if @movie.errors.full_messages.any?
			render :edit
		else
			redirect_to @movie, notice: "Movie successfully updated"
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
		if @movie.errors.full_messages.any?
			render :new
		else
			redirect_to @movie, notice: "Movie successfully created"
		end	
	end

	def destroy
		Movie.delete!(slug: params[:id])
		redirect_to movies_path, notice: "Movie successfully deleted"
	end

private
	def movie_params
		params.require(:movie).permit(:name, :description, :show_time, :price, :image_file_name, :capacity, genre_ids: [])
	end

	def set_up_movie
		@movie = Movie.find_by!(slug: params[:id])
	end

end