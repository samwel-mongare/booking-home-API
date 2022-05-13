require 'swagger_helper'

RSpec.describe 'api/v1/user_apartments', type: :request do
  path '/api/v1/user_apartments' do
    get('list user_apartments') do
      tags 'show apartments'
      # response(200, 'successful') do
      # after do |example|
      #   example.metadata[:response][:content] = {
      #     'application/json' => {
      #       example: JSON.parse(response.body, symbolize_names: true)
      #     }
      #   }
      # end
      #   run_test!
      # end
    end
  end
end
