class AdminsController < ApplicationController
  def shelters
    @shelters = Shelter.all
  end

  def applicants
    @applicants = Applicant.all
  end
end