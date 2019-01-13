class AddFieldsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :ratings, :float
    add_column :movies, :description, :text
  end
end
