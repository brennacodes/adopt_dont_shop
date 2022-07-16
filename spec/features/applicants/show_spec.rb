require 'rails_helper'

RSpec.describe 'applicant show page' do
  let!(:shelter_1) {Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:shelter_2) {Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)}
  let!(:shelter_3) {Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)}
  let!(:shelter_4) {Shelter.create!(name: 'Habitat for Animals', city: 'Coulder, CO', foster_program: true, rank: 7)}

  let!(:sally) {Applicant.create!(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!', status: "Pending")}
  let!(:joe) {Applicant.create!(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!', status: "Rejected")}
  let!(:peyton) {Applicant.create!(name: 'Peyton', address: '456 Manning St, Fort Collins, CO, 85214', description: 'I rock!', status: "In Progress")}
  let!(:betty) {Applicant.create!(name: 'Betty', address: '654 White St, Denver, CO, 80211', description: 'I rock!', status: "Accepted")}

  let!(:shelter_1_pet_1) {shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)}
  let!(:shelter_1_pet_2) {shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)}
  let!(:shelter_3_pet_1) {shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)}
  let!(:shelter_3_pet_2) {shelter_3.pets.create(name: 'Bella', breed: 'sphynx', age: 2, adoptable: false)}
  let!(:shelter_4_pet_1) {shelter_4.pets.create(name: 'Pipo', breed: 'ragdoll', age: 2, adoptable: true)}
  
  before do
    visit "/applicants/#{sally.id}"
  end

  it 'can show applicants information' do
    within "tbody" do
      expect(page).to have_content("Sally")
      expect(page).to have_content("123 California St, Boulder, CO, 80304")
      expect(page).to have_content("I rock!")
      expect(page).to have_content("Pending")
      expect(page).to have_content("Bella")
      # expect(page).to have_selector(:link_or_button, "Bella")
    end
  end

  # When I visit an application's show page
  # And that application has not been submitted,
  # Then I see a section on the page to "Add a Pet to this Application"
  # In that section I see an input where I can search for Pets by name
  # When I fill in this field with a Pet's name
  # And I click submit,
  # Then I am taken back to the application show page
  # And under the search bar I see any Pet whose name matches my search
  it 'can add a pet to an application while the application is in progress' do
    expect(page).to have_content("In Progress")
    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_content("Search for a Pet")

    fill_in "Search for a Pet", with: "Bella"
    click_on "Search"

    expect(page).to have_content("Bella")
    expect(page).to have_content("Add this Pet to this Application")
  end

end
