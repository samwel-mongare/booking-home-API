require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate') }

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:user_apartments) }
    it { should have_many(:apartments) }
  end

  describe 'validations' do
    it 'isn\'t valid without name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid without an email' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end
end
