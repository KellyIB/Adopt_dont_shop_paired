class RemoveShelterFromPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :shelter, :string
  end
end
