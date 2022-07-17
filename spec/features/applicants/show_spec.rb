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
    visit "/applicants/#{peyton.id}"
  end

  it 'can show applicants information' do
    expect(page).to have_content("Peyton")
    expect(page).to have_content("456 Manning St, Fort Collins, CO, 85214")

    expect(page).to have_content("I rock!")
    expect(page).to have_content("In Progress")

    expect(page).not_to have_content("Pending")
    expect(page).not_to have_content("Submit Application")
    expect(page).not_to have_content("Mr. Pirate")
  end

  it 'can search for a pet' do
    within ".pet_search" do
      expect(page).to have_content("Search")

      fill_in "search", with: "Mr. Pirate"
      click_on "Search"

      expect(current_path).to eq("/applicants/#{peyton.id}")
      expect(page).to have_content("Mr. Pirate")
      expect(page).to have_button("Add Pet to Application")
    end
  end

  it 'can add a pet to an applicant' do
    within ".pet_search" do
      expect(page).to have_content("Search")

      fill_in "search", with: "Mr. Pirate"
      click_on "Search"

      expect(current_path).to eq("/applicants/#{peyton.id}")
      expect(page).to have_content("Mr. Pirate")
      expect(page).to have_button("Add Pet to Application")

      click_on "Add Pet to Application"

      expect(current_path).to eq("/applicants/#{peyton.id}")
    end

      expect(page).to have_content("Mr. Pirate")
      expect(page).not_to have_content("Add to Application")
      expect(page).to have_button("Submit Application")
  end

  it 'has a section to submit an application' do
    within ".pet_search" do
      expect(page).to have_content("Search")

      fill_in "search", with: "Mr. Pirate"
      click_on "Search"

      expect(current_path).to eq("/applicants/#{peyton.id}")
      expect(page).to have_content("Mr. Pirate")
      expect(page).to have_button("Add Pet to Application")

      click_on "Add Pet to Application"
    end
      expect(current_path).to eq("/applicants/#{peyton.id}")

      expect(page).to have_content("Mr. Pirate")
      expect(page).not_to have_content("Add to Application")
      expect(page).to have_button("Submit Application")

      click_on 'Submit Application'

      expect(current_path).to eq("/applicants/#{peyton.id}")
      expect(page).to have_content("Mr. Pirate")
      expect(page).not_to have_content('Add to Application')
    end
  end
