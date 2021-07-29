require 'rails_helper'

RSpec.describe 'api/checkers GET #hostname', type: :request do
  let(:user_ip) { '1.1.1.1' }

  it 'renders hostname' do
    get hostname_path, headers: { REMOTE_ADDR: user_ip }
    expect(response.body).to eq "one.one.one.one\n"
  end
end
