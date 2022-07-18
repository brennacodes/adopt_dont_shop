require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should have_many :applicant_pets }
    it { should have_many(:pets).through(:applicant_pets) }
  end
  
    describe 'instance methods' do
      it 'application_submitted' do
        sally = Applicant.create(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
        joe = Applicant.new(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!')
        sally.application_submitted
        expect(sally.status).to eq('Pending')
        expect(joe.status).to eq('In Progress')
      end
  
      it 'application_accepted' do
        sally = Applicant.create(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
        joe = Applicant.new(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!')
        sally.application_accepted
        expect(sally.status).to eq('Accepted')
        expect(joe.status).to eq('In Progress')
      end
  
      it 'application_rejected' do
        sally = Applicant.create(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
        joe = Applicant.new(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!')
        sally.application_rejected
        expect(sally.status).to eq('Rejected')
        expect(joe.status).to eq('In Progress')
      end
    end
  
    describe 'class methods' do
      it 'current_applicants' do
        sally = Applicant.create(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
        joe = Applicant.create(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!')
        sally.application_submitted
        expect(Applicant.current_applicants).to eq([joe])
      end
  
      it 'pending_applicants' do
        sally = Applicant.create(name: 'Sally', address: '123 California St, Boulder, CO, 80304', description: 'I rock!')
        joe = Applicant.new(name: 'Joe', address: '321 Jones St, Grand Junction, CO, 87654', description: 'I like dags!')
        sally.application_submitted
        expect(Applicant.pending_applicants).to eq([sally])
      end
    end
end
