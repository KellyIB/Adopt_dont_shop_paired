class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex
  belongs_to :shelter

  has_many :application_pets
  has_many :applications, through: :application_pets

  def self.adoptable_pet_sort
    Pet.order(adoptable?: :desc)
  end
end
