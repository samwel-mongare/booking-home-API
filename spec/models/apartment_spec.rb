require 'rails_helper'

RSpec.describe Apartment, type: :model do
  subject do
    user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
    Apartment.new(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1', rental: true,
                  favourite: true, rental_price: 30, house_price: 900, period: 3)
  end

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:users) }
    it { should have_many(:user_apartments) }
    it { should have_many(:markets) }
    it { should have_many(:rentals) }
  end

  describe 'validations' do
    context 'uniqueness of apartment name' do
      let(:apartment) do
        user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
        Apartment.new(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1', rental: true,
                      favourite: true, rental_price: 30, house_price: 900, period: 3)
      end
      it { expect(apartment).to_not be_valid }
    end

    it 'isn\'t valid without name value' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with name more than 50 characters' do
      subject.name = 'hkdsbvdjkvbjfvbksjc jhdv chjv ajv jkv jdch ejc dvadfra'
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with empty location value' do
      subject.location = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with empty description value' do
      subject.description = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with empty image1 value' do
      subject.image1 = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with empty rental price value' do
      subject.rental_price = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with rental price value less than 0' do
      subject.rental_price = -8
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with empty house price value' do
      subject.house_price = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with house price value less than 0' do
      subject.house_price = -1
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with empty period value' do
      subject.period = ''
      expect(subject).to_not be_valid
    end

    it 'should check inclusive values for rental' do
      %w[true false].each do |v|
        should allow_value(v).for(:rental)
      end
    end

    it { should_not allow_value('').for(:rental) }

    it 'should check inclusive values for favourite' do
      %w[true false].each do |v|
        should allow_value(v).for(:favourite)
      end
    end

    it { should_not allow_value('').for(:favourite) }
  end
end
