class Favorite
  attr_reader :contents, :remove_all

  def initialize(initial_contents)
    @contents = initial_contents ||= Array.new
  end

  def add_pet(pet)
    @contents << pet.id
  end

  def total_count
    @contents.count
  end

  def remove_pet(pet)
    @contents.delete(pet.id)
  end

  def remove_all
    @contents = Array.new
  end

  def pet_objects
    @contents.map do |pet_id|
      Pet.find(pet_id)
    end
  end

end
