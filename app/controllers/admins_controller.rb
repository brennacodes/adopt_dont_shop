class AdminsController < ApplicationController
  def index
  end

  def shelters
    @shelters = Shelter.all
  end

  def applicants
    @applicants = Applicant.all
  end
end