class ChangePetAgeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :age, :approximate_age
  end
end
