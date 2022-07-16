class ApplicantPet < ApplicationRecord
  belongs_to :pet
  belongs_to :applicant

  def pets_name
    pet.name
  end
end
