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

  describe '#app_geolocation_source' do
    context 'when dbip' do
      before do
        allow(ENV).to receive(:fetch).with('MMDB_PROVIDER').and_return('dbip')
      end

      it 'returns dbip data' do
        expect(helper.app_geolocation_source)
          .to eq({ 'name' => 'DB-IP', 'url' => 'https://db-ip.com' })
      end
    end

    context 'when other' do
      before do
        allow(ENV).to receive(:fetch).with('MMDB_PROVIDER').and_return('maxmind')
      end

      it 'returns nil' do
        expect(helper.app_geolocation_source).to be_nil
      end
    end
  end
end
