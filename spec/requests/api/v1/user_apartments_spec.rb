require 'swagger_helper'

RSpec.describe 'api/v1/user_apartments', type: :request do
  path '/api/v1/user_apartments' do
    get('list user_apartments') do
      tags 'show apartments'
    end
  end
end
