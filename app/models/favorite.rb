class Favorite
  attr_reader :contents, :remove_all, :pets_with_apps

  def initialize(initial_contents)
    @contents = initial_contents ||= Array.new
  end

  def add_pet(pet)
    @contents << pet.id
  end

  def total_count
    @contents.count
  end

  def remove_pet(pet_id)
    @contents.delete(pet_id)
  end

  def favorite_to_applied_for(pet_id)
    pets_applied_for(pet_id)
    @contents.delete(pet_id)
  end

  def pets_applied_for(pet_id)
    ps_with_apps = []
    ps_with_apps << (pet_id)
    @pets_with_apps = ps_with_apps.map do |pet_id|
      Pet.find(pet_id)
    end
  end

  def remove_all
    @contents = Array.new
  end

  def pet_objects
    @contents.map do |pet_id|
      Pet.find(pet_id)
    end
  end

  def pets_approved
    Pet.where(adoptable?:false)
  end


end
