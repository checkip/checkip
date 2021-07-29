require 'rails_helper'

RSpec.describe 'api/checkers GET #ip', type: :request do
  let(:user_ip) { '1.1.1.1' }

  it 'renders ip' do
    get ip_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "1.1.1.1\n"
  end
end
