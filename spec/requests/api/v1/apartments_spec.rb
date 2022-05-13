require 'swagger_helper'

# rubocop:disable Metrics/BlockLength

RSpec.describe 'api/v1/apartments', type: :request do
  before_context_ivars
  path '/api/v1/apartments' do
    get('list apartments') do
      tags 'apartments'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:user) do
          User.create!(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
        end
        let(:apartment) do
          Apartment.create!(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1', rental: true,
                            favourite: true, rental_price: 30, house_price: 900, period: 3)
        end
        run_test!
      end
    end

    post('create apartment') do
      tags 'apartments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :apartment, in: :body, schema: {
        type: :object,
        properties: {
          apartment: { type: :object,
                       properties: {
                         name: { type: :string },
                         location: { type: :string },
                         description: { type: :string },
                         image1: { type: :string },
                         image2: { type: :string },
                         image3: { type: :string },
                         rental: { type: :boolean },
                         favourite: { type: :boolean },
                         rental_price: { type: :integer },
                         house_price: { type: :integer },
                         period: { type: :integer },
                         user_id: { type: :integer }
                       } }
        },
        required: %w[name location description image1 rental favourite user_id]
      }
      # response(200, 'successful') do
        # after do |example|
        #   example.metadata[:response][:content] = {
        #     'application/json' => {
        #       example: JSON.parse(response.body, symbolize_names: true)
        #     }
        #   }
        # end
      #   let(:user) do
      #     User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
      #   end
      #   let(:apartment) do
      #     Apartment.create(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1', rental: true,
      #                   favourite: true, rental_price: 30, house_price: 900, period: 3)
      #   end
      #   run_test!
      # end
    end
  end

  path '/api/v1/apartments/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show apartment') do
      tags 'apartments'
      # response(200, 'successful') do
        # after do |example|
        #   example.metadata[:response][:content] = {
        #     'application/json' => {
        #       example: JSON.parse(response.body, symbolize_names: true)
        #     }
        #   }
        # end
      #   let(:apartment) do
      #     user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
      #     Apartment.new(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1', rental: true,
      #                   favourite: true, rental_price: 30, house_price: 900, period: 3)
      #   end
      #   run_test!
      # end
    end

    response '404', 'invalid request' do
      schema type: :object,
             properties: {
               success: { type: :boolean },
               message: {
                 type: :array,
                 items: { type: :string }
               }
             }
    end

    delete('delete apartment') do
      tags 'apartments'
      # response(200, 'successful') do
      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   let(:apartment) do
      #     user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
      #     Apartment.new(user_id: user.id, name: 'Beach apartment', location: 'Thailand', description: 'apartment of yoru dreams', image1: 'image1', rental: true,
      #                   favourite: true, rental_price: 30, house_price: 900, period: 3)
      #   end
      #   run_test!
      # end
    end
  end
end

# rubocop:enable Metrics/BlockLength
