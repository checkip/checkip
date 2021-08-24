require 'rails_helper'

RSpec.describe 'monitors GET #show', type: :request do
  it 'responds with json' do
    get health_path
    expect(response.body).to eq({
      status: 'OK',
      geo_database: {
        connected: true
      },
      asn_database: {
        connected: true
      }
    }.to_json)
  end
end
