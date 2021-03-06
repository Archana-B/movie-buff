class MakeReviewsAJoinTable < ActiveRecord::Migration[5.0]
  def up
    Review.delete_all
    remove_column :reviews, :name
    add_reference :reviews, :user, foreign_key: true  
  end

  def down
    Review.delete_all
    add_column :reviews, :name, :string
    remove_reference :reviews, :user, foreign_key: true
  end
end
