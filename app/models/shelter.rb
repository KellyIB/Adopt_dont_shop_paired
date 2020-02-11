class Shelter < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :pets, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  def pet_count
    pets.count
  end

  def adoption_pending_check
    pending = pets.where(adoptable?: false)
    !pending.empty?
  end

  def avg_rating
    reviews.average(:rating)
  end

  def applications_on_file
    pets.joins(:applications).select('applications.*').distinct.count
  end
end
