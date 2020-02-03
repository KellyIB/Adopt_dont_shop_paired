class AddZipToShelters < ActiveRecord::Migration[5.1]
  def change
    add_column :shelters, :zip, :string
  end
end
