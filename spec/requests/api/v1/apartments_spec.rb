require 'swagger_helper'

RSpec.describe 'api/v1/apartments', type: :request do

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
            rental: { type: :boolean},
            favourite: { type: :boolean },
            rental_price: { type: :integer },
            house_price: { type: :integer},
            period: { type: :integer }
          }
        }
      },
        required: %w[name location description image1 rental favourite user_id]
      }
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
  end

  path '/api/v1/apartments/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show apartment') do
      tags 'apartments'
      response(200, 'successful') do
        let(:id) { '123' }

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
      response(200, 'successful') do
        let(:id) { '123' }

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
  end
end
