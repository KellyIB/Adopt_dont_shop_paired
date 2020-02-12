class AddImageToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :image, :string, :default => 'https://images-na.ssl-images-amazon.com/images/I/71%2BdU6s7%2BHL._AC_SL1500_.jpg'
  end
end
