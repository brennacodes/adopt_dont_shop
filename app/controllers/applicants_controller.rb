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
    @applicants_pets = @applicant.pets.distinct
    if params[:search]
      @pets_found = Pet.adoptable_pets.search_pets(params[:search])
    else
      render :notice => "No pets found"
    end
  end

  def addpet
    applicant = Applicant.find(params[:id])
    pet = Pet.find(params[:pet_id])
    session[:pet_wanted] = ApplicantPet.create!(applicant: applicant, pet: pet)
    redirect_to "/applicants/#{applicant.id}"
  end

  #this method is not working since latest changes
  def create
    @applicant = Applicant.new(applicant_params)
      if @applicant.save
        redirect_to "/applicants/#{@applicant.id}"
      else
        flash[:notice] = "You cannot submit an application with any fields left blank"
        redirect_to "/applicants/new"
      end
  end
    # if @applicant[:name].empty? || @applicant[:address].empty? || @applicant[:description].empty?
    #   redirect_to "/applicants/new", notice: "You cannot submit an application with any fields left blank"
    # else
    #   @applicant.save
    #   redirect_to "/applicants/#{@applicant.id}"
    # end

    # respond_to do |format|
    #   if @applicant.save
    #     format.html { redirect_to "/applicants/#{@applicant.id}", notice: "Applicant was successfully created." }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #   end
    # end
  def update
    applicant = Applicant.find(params[:id])
    applicant.status = "Pending"
    applicant.save
    redirect_to "/applicants/#{applicant.id}"
  end

  def destroy
  end

  private

  def applicant_params
    params.permit(:name, :address, :description)
  end

end
