class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all
  end

  def new
  end

  def edit
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def create
    applicant = Applicant.create(applicant_params)
    # binding.pry
    redirect_to "/applicants/#{applicant.id}"
  end

  def update
    applicant = Applicant.find(params[:id])
  end

  def destroy
  end

  private

  def applicant_params
    params.permit(:name, :address, :description)
  end
end
