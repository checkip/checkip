require 'rails_helper'

RSpec.describe 'api/checkers GET #region', type: :request do
  let(:user_ip) { '81.2.69.192' }

  it 'renders region' do
    get region_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "England\n"
  end
end
