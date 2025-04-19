require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#app_name_footer' do
    before do
      stub_const('Checkip::Application::VERSION', '1.0')
    end

    it 'returns app name when version show disabled' do
      allow(ENV).to receive(:[]).with('CHECKIP_SHOW_VERSION').and_return('false')
      expect(helper.app_name_footer).to eq 'CheckIP'
    end

    it 'returns app name with version when version show enabled' do
      allow(ENV).to receive(:[]).with('CHECKIP_SHOW_VERSION').and_return('true')
      expect(helper.app_name_footer).to eq 'CheckIP v1.0'
    end
  end
end
