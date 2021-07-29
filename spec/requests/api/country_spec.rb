require 'rails_helper'

RSpec.describe 'api/checkers GET #country', type: :request do
  let(:user_ip) { '81.2.69.192' }

  it 'renders country' do
    get country_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "GB\n"
  end
end
