require 'rails_helper'

RSpec.describe Rental, type: :model do
  subject do
    user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
    apartment = Apartment.create!(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1',
                                  rental: true, favourite: true, rental_price: 30, house_price: 900, period: 3)
    Rental.new(apartment_id: apartment.id, price: 900, period: 4)
  end

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:apartment) }
  end

  describe 'validations' do
    it 'isn\'t valid with price value empty' do
      subject.price = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with price value less than 0' do
      subject.price = -8
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with price value if not a number' do
      subject.price = 'string'
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with period value empty' do
      subject.period = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with period value less than 0' do
      subject.period = -8
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with period value if not a number' do
      subject.period = 'string'
      expect(subject).to_not be_valid
    end
  end
end
