class Review < ApplicationRecord
  validates_presence_of :title, :rating, :content
  belongs_to :shelter

  before_save :set_defaults

  def set_defaults
    self.image = 'https://images-na.ssl-images-amazon.com/images/I/71%2BdU6s7%2BHL._AC_SL1500_.jpg' if self.image == ""
  end
end
