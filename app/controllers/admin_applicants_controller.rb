class AdminApplicantsController < AdminsController
    def index
      @applicants = Applicant.all
    end

    def show
      @applicant = Applicant.find(params[:id])
      # require "pry"; binding.pry
    end

    def update
      applicant = Applicant.find(params[:id])
      applicant_pet = ApplicantPet.find_by(pet_id: params[:pet_id], applicant_id: params[:id])
      # require "pry"; binding.pry
      applicant_pet.update(status: "Approved")
      applicant_pet.update(status: "Rejected")
      redirect_to "/admin/applicants/#{applicant.id}"
    end
end
