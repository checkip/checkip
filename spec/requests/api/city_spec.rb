require 'rails_helper'

RSpec.describe 'api/checkers GET #city', type: :request do
  let(:user_ip) { '81.2.69.192' }

  it 'renders city' do
    get city_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "London\n"
  end
end
