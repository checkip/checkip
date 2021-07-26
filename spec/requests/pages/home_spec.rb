require 'rails_helper'

RSpec.describe 'pages GET #home', type: :request do
  let(:user_ip) { '1.1.1.1' }
  let(:ua_curl) { 'curl/7.76.1' }
  let(:ua_wget) { 'Wget/1.21.1' }
  let(:ua_httpie) { 'HTTPie/2.4.0' }
  let(:ua_httpie_go) { 'httpie-go/0.7.0' }

  it 'renders the :home template' do
    get root_path
    expect(response.status).to eq 200
  end

  it 'renders ip when curl user-agent' do
    get root_path, headers: { HTTP_USER_AGENT: ua_curl, REMOTE_ADDR: user_ip }
    expect(response.body).to eq "1.1.1.1\n"
  end

  it 'renders ip when wget user-agent' do
    get root_path, headers: { HTTP_USER_AGENT: ua_wget, REMOTE_ADDR: user_ip }
    expect(response.body).to eq "1.1.1.1\n"
  end

  it 'renders ip when httpie user-agent' do
    get root_path, headers: { HTTP_USER_AGENT: ua_httpie, REMOTE_ADDR: user_ip }
    expect(response.body).to eq "1.1.1.1\n"
  end

  it 'renders ip when httpie-go user-agent' do
    get root_path, headers: { HTTP_USER_AGENT: ua_httpie_go, REMOTE_ADDR: user_ip }
    expect(response.body).to eq "1.1.1.1\n"
  end
end
