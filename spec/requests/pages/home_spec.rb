require 'rails_helper'

RSpec.describe 'pages GET #home', type: :request do
  it 'renders the :home template' do
    get root_path
    expect(response.status).to eq 200
  end
end
