# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Applicant.destroy_all
Pet.destroy_all
VeterinaryOffice.destroy_all
Veterinarian.destroy_all

shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
shelter_2 = Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
shelter_3 = Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
shelter_4 = Shelter.create!(name: 'Habitat for Animals', city: 'Coulder, CO', foster_program: true, rank: 7)

sally = Applicant.new(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
joe = Applicant.new(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!')
peyton = Applicant.new(name: 'Peyton', address: '456 Manning St, Fort Collins, CO, 85214', description: 'I am super active!')
billy = Applicant.new(name: 'Billy', address: '909 Madison St, Morrison, CO, 81808', description: 'I like rocks!')
rusty = Applicant.new(name: 'Rusty', address: '11 Nail St, Rincon, CO, 88109', description: 'No comment.')
betty = Applicant.new(name: 'Betty', address: '654 White St, Denver, CO, 80211', description: 'I am not a good owner but I want a pet!')

shelter_1.pets.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
shelter_1.pets.create!(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
shelter_4.pets.create!(name: 'Pipo', breed: 'ragdoll', age: 2, adoptable: false)
shelter_4.pets.create!(name: 'Lobster', breed: 'doberman', age: 4, adoptable: true)

vet_office_1 = VeterinaryOffice.create!(name: 'Special Friends', boarding_services: true, max_patient_capacity: 100)
vet_office_2 = VeterinaryOffice.create!(name: 'Pet Emergency Room', boarding_services: true, max_patient_capacity: 50)
vet_office_3 = VeterinaryOffice.create!(name: 'The Country Vet', boarding_services: true, max_patient_capacity: 200)
vet_office_4 = VeterinaryOffice.create!(name: 'Best Vets', boarding_services: true, max_patient_capacity: 20)

vet_office_1.veterinarians.create!(name: 'Morgan', on_call: true, review_rating: 10)
vet_office_2.veterinarians.create!(name: 'Heather', on_call: true, review_rating: 6)
vet_office_3.veterinarians.create!(name: 'John', on_call: true, review_rating: 9)
vet_office_4.veterinarians.create!(name: 'Taylor', on_call: true, review_rating: 7)
vet_office_2.veterinarians.create!(name: 'Jim', on_call: true, review_rating: 8)
