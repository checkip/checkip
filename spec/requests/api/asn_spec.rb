require 'rails_helper'

RSpec.describe 'api/checkers GET #asn', type: :request do
  let(:user_ip) { '31.224.0.0' }

  it 'renders asn' do
    get asn_path, headers: { REMOTE_ADDR: user_ip }
    expect(JSON.parse(response.body, symbolize_names: true)).to eq(
      {
        asn: 'AS3320',
        name: 'Deutsche Telekom AG',
        route: '31.224.0.0/11'
      }
    )
  end
end
