require 'rails_helper'

RSpec.describe 'New Applicants' do

  it 'can fill in and submit an application for a new Pet' do
    sally = Applicant.create!(name: 'Sally',
          address: '123 California St, Boulder, CO, 80304', description: 'I rock!',
          name_of_pets: 'Nola', status: "Pending")

    visit '/applicants/new'

    fill_in 'Name', with: 'Sally'
    fill_in 'address', with: '123 California St, Boulder, CO, 80304'
    fill_in 'description', with: "I rock!"
    fill_in 'name_of_pets', with: 'Nola'

    click_button 'Submit Application'
    expect(current_path).to eq("/applicants/#{@applicant_1.id}")
    expect(page).to have_content('Sally')
    expect(page).to have_content('123 California St, Boulder, CO, 80304')
  end







end
