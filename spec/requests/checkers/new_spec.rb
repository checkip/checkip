require 'rails_helper'

RSpec.describe 'checkers GET #new', type: :request do
  let(:user_ip) { '1.1.1.1' }
  let(:gb_ip)   { '81.2.69.192' }
  let(:ua_curl) { 'curl/7.76.1' }
  let(:ua_wget) { 'Wget/1.21.1' }
  let(:ua_httpie) { 'HTTPie/2.4.0' }
  let(:ua_httpie_go) { 'httpie-go/0.7.0' }
  let(:ua_go_http_client) { 'Go-http-client/1.1' }

  it 'renders the :home template when html format' do
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

  it 'renders ip when go-http-client user-agent' do
    get root_path, headers: { HTTP_USER_AGENT: ua_go_http_client, REMOTE_ADDR: user_ip }
    expect(response.body).to eq "1.1.1.1\n"
  end

  it 'renders json when json format' do
    get json_path, headers: { REMOTE_ADDR: gb_ip, ACCEPT: 'application/json' }
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
end
