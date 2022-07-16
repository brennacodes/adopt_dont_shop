class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.current_applicants
  end
  
  def new
  end
  
  def edit
  end
  
  def show
    @applicant = Applicant.find(params[:id])
    @applicants_pets = @applicant.pets.distinct
    if params[:search]
      @pets_found = Pet.adoptable.search_pets(params[:search])
    else
      render :notice => "No pets found"
    end
  end

  def addpet
    applicant = Applicant.find(params[:id])
    pet = Pet.find(params[:pet_id])
    ApplicantPet.create!(applicant: applicant, pet: pet)
    redirect_to "/applicants/#{applicant.id}"
  end

  def create
    applicant = Applicant.create!(applicant_params)
    # binding.pry
    redirect_to "/applicants/#{applicant.id}"
  end

  def update
    applicant = Applicant.find(params[:id])

    # applicant.update(applicant_params)
    # redirect_to applicant_path(applicant)

  end

  def destroy
  end

  private
  
  def applicant_params
    params.permit(:name, :address, :description)
  end

end
