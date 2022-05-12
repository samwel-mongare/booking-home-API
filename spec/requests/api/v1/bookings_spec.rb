require 'swagger_helper'

RSpec.describe 'api/v1/bookings', type: :request do
  # rubocop:disable Metrics/BlockLength
  path '/api/v1/bookings' do
    get('list all booking') do
      tags 'Bookings'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    post('add a booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          booking: {
            type: :object,
            properties: {
              user_id: { type: :integer },
              apartment_id: { type: :integer },
              date: { type: :string, format: :datetime }
            },
            required: %w[user_id apartment_id date]
          }
        }
      }
    end
  end

  path '/api/v1/bookings/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    delete 'Delete a Booking' do
      tags 'Bookings'
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '204', 'Booking deleted' do
        let!(:user) { User.create(name: 'testuser', email: 'test@mail.com') }
        let!(:apartment) do
          apartment.create(name: 'test-apartment', price: 20, description: 'this is test-apartment', country: 'canada',
                       city: 'toronto', address: 'street 1', property_type: 'apartment', image_url: 'http://image.com')
        end

        let!(:id) { Booking.create(user:, apartment:).id }

        run_test!
      end
    end

    put('update a booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          booking: {
            type: :object,
            properties: {
              user_id: { type: :integer },
              apartment_id: { type: :integer },
              date: { type: :string, format: :datetime }
            },
            required: %w[user_id apartment_id date]
          }
        }
      }
    end
  end
end