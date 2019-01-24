class FavoritesController < ApplicationController
    before_action :require_sign_in
    before_action :set_movie

    def create
        @movie.fans << current_user
        redirect_to @movie, notice: "Glad you like the movie!"
    end

    def destroy
        favorite = current_user.favorites.find(params[:id])
        favorite.destroy

        redirect_to @movie, notice: "Sorry you unfaved it !"
    end

private

    def set_movie
        @movie = Movie.find_by!(slug: params[:movie_id])        
    end

end
