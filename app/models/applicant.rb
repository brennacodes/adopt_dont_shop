class Applicant < ApplicationRecord
  has_many :applicant_pets
  has_many :pets, through: :applicant_pets

  attribute :status, default: "In Progress"
  validates_presence_of :name, :address, :description

  # after_create :application_created

  def application_submitted
    write_attribute(:status, "Pending")
    save
  end

  def application_accepted
    write_attribute(:status, "Accepted")
    save
  end

  def application_rejected
    write_attribute(:status, "Rejected")
    save
  end

  def self.current_applicants
    where(status: "In Progress")
  end

  def self.pending_applicants
    where(status: "Pending")
  end
end
