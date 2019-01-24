class MoviesController < ApplicationController

	before_action :require_sign_in , except: [:index, :show]

	before_action :require_admin, except: [:index, :show]
	
	def index
		@movies = Movie.upcoming
	end

	def show
		@movie = Movie.find(params[:id])
		@fans = @movie.fans
		if current_user
			@current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
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
		Movie.delete(params[:id])
		redirect_to movies_path, notice: "Movie successfully deleted"
	end

end

private
	def movie_params
		params.require(:movie).permit(:name, :description, :show_time, :price, :image_file_name, :capacity)
	end
