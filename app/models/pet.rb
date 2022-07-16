class Pet < ApplicationRecord
  has_many :applicant_pets, dependent: :destroy
  has_many :applicants, through: :applicant_pets
  belongs_to :shelter
  
  validates :name, presence: true
  validates :age, presence: true, numericality: true

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.search_pets(input)
    where("name ILIKE ?", "%#{ input }%")
  end
end
