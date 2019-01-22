class RemoveRatingsFromMovie < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :ratings, :float
  end
end
