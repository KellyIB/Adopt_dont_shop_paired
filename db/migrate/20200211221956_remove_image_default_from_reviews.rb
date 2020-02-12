class RemoveImageDefaultFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :image, :string
  end
end
