require 'rails_helper'

RSpec.describe 'api/checkers GET #asn', type: :request do
  let(:user_ip) { '31.224.0.0' }

  it 'renders asn' do
    get asn_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "AS3320 Deutsche Telekom AG\n"
  end
end
