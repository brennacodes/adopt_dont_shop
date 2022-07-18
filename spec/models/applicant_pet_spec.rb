require 'rails_helper'

RSpec.describe ApplicantPet, type: :model do
  describe 'relationships' do
    it { should belong_to :applicant }
    it { should belong_to :pet }
  end

  describe 'instance methods' do
    it 'can tell a pets name' do
      shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      sally = Applicant.create!(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
      pet_1 = Pet.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, shelter_id: shelter.id)
      applicant_pet_1 = ApplicantPet.create!(applicant_id: sally.id, pet_id: pet_1.id)
      expect(applicant_pet_1.pets_name).to eq('Mr. Pirate')
    end
    
    it 'can tell if a pet is adopted' do
      shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      sally = Applicant.create!(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
      pet_1 = Pet.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, shelter_id: shelter.id)
      applicant_pet_1 = ApplicantPet.create!(applicant_id: sally.id, pet_id: pet_1.id)
      expect(Pet.adoptable_pets).to eq([pet_1])
      expect(pet_1.is_adopted?).to eq(false)
      applicant_pet_1.pet_adopted
      expect(Pet.adoptable_pets).to eq([])
      expect(pet_1.is_adopted?).to eq(true)
    end
  end
end
