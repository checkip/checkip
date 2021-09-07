require 'rails_helper'

RSpec.describe 'monitors GET #show', type: :request do
  context 'when connected mmdb files' do
    it 'responds with json' do
      get health_path
      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        {
          status: 'OK',
          geo_database: {
            connected: true,
            version: '2020-12-29'
          },
          asn_database: {
            connected: true,
            version: '2020-12-29'
          }
        }
      )
    end
  end

  context 'when not connected mmdb files' do
    before do
      Checker.send(:remove_const, 'GEO_DB') if defined?(Checker::GEO_DB)
      Checker.send(:remove_const, 'ASN_DB') if defined?(Checker::ASN_DB)
    end

    it 'responds with json' do
      get health_path
      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        {
          status: 'OK',
          geo_database: {
            connected: false
          },
          asn_database: {
            connected: false
          }
        }
      )
    end
  end
end
