require 'rails_helper'

RSpec.describe 'New Applicants' do

  it 'can fill in and submit an application for a new Pet' do
    visit '/applicants/new'

    within 'section' do
      fill_in 'name', with: 'Sally'
      fill_in 'address', with: '123 California St, Boulder, CO, 80304'
      fill_in 'description', with: 'I rock!'

      click_on 'Create Application'
    end

    actual_path = Applicant.last.id

    expect(current_path).to eq("/applicants/#{actual_path}")

    expect(page).to have_content('Sally')
    expect(page).to have_content('123 California St, Boulder, CO, 80304')
    expect(page).to have_content('In Progress')
  end

  it 'can send an error message if the form fields are not filled in' do
    visit '/applicants/new'

    click_on 'Create Application'

    expect(page).to have_content("errors prohibited this applicant from being saved")
    # expect(status).to eq(302)
    # will not recognize redirect due to conditional in controlloer action
  end  
end
