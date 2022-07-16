class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.current_applicants
  end
  
  def new
    @applicant = Applicant.new
  end
  
  def edit
  end
  
  def show
    @applicant = Applicant.find(params[:id])
    @pets = Pet.adoptable.search_pets(params[:search])
  end

  def create
    applicant = Applicant.create!(applicant_params)
  end

  def update
    applicant = Applicant.find(params[:id])
    applicant.update(applicant_params)
    redirect_to applicant_path(applicant)
  end

  def destroy
  end

  private
    def applicant_params
      params.require(:applicant).permit(:name, :address, :description, :status)
    end
end
