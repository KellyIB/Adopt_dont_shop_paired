class Review < ApplicationRecord
  validates_presence_of :title, :rating, :content#, :image

  belongs_to :shelter
end
