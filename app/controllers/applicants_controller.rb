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
    @pets = Pet.adoptable.search_pets(params[:search])
  end

  def create
    applicant = Applicant.create(applicant_params)
    if applicant[:name].empty? || applicant[:address].empty? || applicant[:description].empty?
      redirect_to "/applicants/new", notice: "You cannot submit an application with any fields left blank"
    else
      redirect_to "/applicants/#{applicant.id}"
    end
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
