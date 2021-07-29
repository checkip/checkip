require 'rails_helper'

RSpec.describe 'api/checkers GET #loc', type: :request do
  let(:user_ip) { '81.2.69.192' }

  it 'renders loc' do
    get loc_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "51.5142,-0.0931\n"
  end
end
