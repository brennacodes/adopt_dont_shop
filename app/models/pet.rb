class Pet < ApplicationRecord
  has_many :applicant_pets, dependent: :destroy
  has_many :applicants, through: :applicant_pets
  belongs_to :shelter
  
  attribute :adoptable, default: true

  validates_presence_of :breed, :name, :shelter_id
  validates :age, presence: true, numericality: true
  validates :adoptable, inclusion: [false, true]

  def shelter_name
    shelter.name
  end

  def adopted
    write_attribute(:adoptable, false)
  end

  def is_adopted?
    !adoptable
  end

  def self.adoptable_pets
    where(adoptable: true)
  end

  def self.search_pets(input)
    where("name ILIKE ?", "%#{ input }%")
  end
end
