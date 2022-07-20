class AdminApplicantsController < AdminsController
    def index
      @applicants = Applicant.all
    end

    def show
      @applicant = Applicant.find(params[:id])
    end

    def update
      applicant = Applicant.find(params[:id])
      applicant_pet = ApplicantPet.find_by(pet_id: params[:pet_id], applicant_id: params[:id])
      applicant_pet.update(status: params[:status])
      redirect_to "/admin/applicants/#{applicant.id}"
    end
end
