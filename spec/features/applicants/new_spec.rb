require 'rails_helper'

RSpec.describe 'New Applicants' do

  it 'can fill in and submit an application for a new Pet' do
    sally = Applicant.create!(name: 'Sally',
                              address: '123 California St, Boulder, CO, 80304',
                              description: 'I rock!',
                              status: "Pending")
    visit '/applicants/new'

    fill_in 'name', with: 'Sally'
    fill_in 'address', with: '123 California St, Boulder, CO, 80304'
    fill_in 'description', with: 'I rock!'

    click_on 'Create Application'
    # expect(current_path).to eq("/applicants/#{sally.id}")

    expect(page).to have_content('Sally')
    expect(page).to have_content('123 California St, Boulder, CO, 80304')
    expect(page).to have_content('In Progress')
  end
end
