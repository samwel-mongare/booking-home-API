require 'swagger_helper'

RSpec.describe 'registrations', type: :request do
  path '/registrations' do
    post('create registration') do
      tags 'sign up'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :registration, in: :body, schema: {
        type: :object,
        properties: {
          user: { type: :object,
                  properties: {
                    name: { type: :string },
                    email: { type: :string },
                    password: { type: :string },
                    password_confirmation: { type: :string }
                  } }
        },
        required: %w[name email password password_confirmation]
      }

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:registration) { { user: { name: 'Barbare', email: 'barbare@test.come', password: 'Password123456', password_confirmation: 'Password123456' } } }
        run_test!
      end
    end
  end
end
