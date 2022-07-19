require 'rails_helper'

RSpec.describe 'admin applicants show page' do

  # When I visit an admin application show page ('/admin/applications/:id')
  # For every pet that the application is for, I see a button to approve the application for that specific pet
  # When I click that button
  # Then I'm taken back to the admin application show page
  # And next to the pet that I approved, I do not see a button to approve this pet
  # And instead I see an indicator next to the pet that they have been approved
  let!(:sally) {Applicant.create!(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!', status: "Pending")}
  let!(:pet_1) {Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id)}
  let!(:shelter_1) {Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:applicant_pets) {ApplicantPet.create!(applicant_id: sally.id, pet_id: pet_1.id)}
  it 'has the ability to approve the pet' do



  visit "/admin/applicants/#{sally.id}"
  
    within "#pet-0" do
      click_button "Approve Application"
    end
    save_and_open_page
    # expect(page).not_to have_text("Approve Application")
    # expect(page).to have_text("X")
  end
end
