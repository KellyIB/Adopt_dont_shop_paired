class Favorite
  attr_reader :contents
  def initialize(initial_contents)
    @contents = initial_contents ||= Array.new
  end

  def add_pet(pet)
    @contents << pet
  end

end
