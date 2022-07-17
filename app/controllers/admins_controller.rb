class AdminsController < ApplicationController
  def index
  end

  def shelters
    @shelters = Shelter.sorted_by_name_reverse
    @pending = Shelter.with_pending_applicants
  end

  def applicants
    @applicants = Applicant.pending
  end
end