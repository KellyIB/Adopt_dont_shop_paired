class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex
  validates_inclusion_of :adoptable?, :in => [true, false]
  belongs_to :shelter

  has_many :application_pets
  has_many :applications, through: :application_pets

  def self.adoptable_pet_sort
    Pet.order(adoptable?: :desc)
  end

  def applicant(pet_id)
    pet = Pet.find(pet_id)
    pet.application_pets.where(approved?: true).first.application
  end
end
