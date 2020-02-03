class RemoveZipFromShelters < ActiveRecord::Migration[5.1]
  def change
    remove_column :shelters, :zip, :integer
  end
end
