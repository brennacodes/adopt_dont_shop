class AdminApplicantsController < AdminsController
    def index
      @applicants = Applicant.all
    end

    def show
      @applicant = Applicant.find(params[:id])
    end

    def update
      applicant_pet = ApplicantPet.find_by(pet_id: params[:pet_id], applicant_id: params[:id])
      applicant_pet.status = "Approved"
      applicant_pet.save
      redirect_to "admin/applicants/#{@applicant.id}"
    end
end
