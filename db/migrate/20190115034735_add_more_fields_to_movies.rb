class AddMoreFieldsToMovies < ActiveRecord::Migration[5.0]
  def change
  	add_column :movies, :show_time, :datetime
  end
end
