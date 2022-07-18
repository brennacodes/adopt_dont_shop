include 'rails_helper'

RSpec.describe 'admin shelter index page' do
    let!(shelter_1) {Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
    let!(shelter_2) {Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)}
    let!(shelter_3) {Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)}
    let!(shelter_4) {Shelter.create!(name: 'Habitat for Animals', city: 'Coulder, CO', foster_program: true, rank: 7)}

    before do
        visit "/admin/shelters"
    end

    it 'lists all shelters in reverse alphabetical order' do
      expect(page).to have_content("Habitat for Animals")
      expect(page).to have_content("Fancy pets of Colorado")
      expect(page).to have_content("RGV animal shelter")
      expect(page).to have_content("Aurora shelter")

      within 'table' do
        expect(('td')[0]).to have_content("RGV animal shelter")
      end
    end
end