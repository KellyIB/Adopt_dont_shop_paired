class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex
  belongs_to :shelter

  def self.adoptable_pet_sort
    Pet.order(adoptable?: :desc)
  end
end
