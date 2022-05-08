require 'rails_helper'

RSpec.describe UserApartment, type: :model do
  subject do
    user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
    apartment = Apartment.create!(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1',
                                  rental: true, favourite: true, rental_price: 30, house_price: 900, period: 3)
    UserApartment.new(apartment_id: apartment.id, user_id: user.id)
  end

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:apartment) }
    it { should belong_to(:user) }
  end
end
