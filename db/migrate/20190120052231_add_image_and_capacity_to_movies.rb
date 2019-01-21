class AddImageAndCapacityToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :image_file_name, :string, default: ""
    add_column :movies, :capacity, :integer, default: 1
  end
end
