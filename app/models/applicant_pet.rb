class ApplicantPet < ApplicationRecord
  belongs_to :pet
  belongs_to :applicant

  # after_create :pet_adopted

  def pets_name
    pet.name
  end

  def pet_adopted
    pet.write_attribute(:adoptable, false)
    save
  end
end
