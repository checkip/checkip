require 'rails_helper'

RSpec.describe 'api/checkers GET #json', type: :request do
  let(:gb_ip) { '81.2.69.192' }
  let(:de_ip) { '31.224.0.0' }

  it 'renders json when geo data' do
    get json_path, headers: { REMOTE_ADDR: gb_ip }
    expect(JSON.parse(response.body, symbolize_names: true)).to eq(
      {
        ip: '81.2.69.192',
        hostname: '192.69.2.81.in-addr.arpa',
        city: 'London',
        region: 'England',
        country: 'GB',
        loc: '51.5142,-0.0931'
      }
    )
  end

  it 'renders json when asn data' do
    get json_path, headers: { REMOTE_ADDR: de_ip }
    expect(JSON.parse(response.body, symbolize_names: true)).to eq(
      {
        ip: '31.224.0.0',
        asn: {
          asn: 'AS3320',
          name: 'Deutsche Telekom AG',
          route: '31.224.0.0/11'
        }
      }
    )
  end
end
