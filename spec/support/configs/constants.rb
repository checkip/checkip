RSpec.configure do |config|
  config.before do
    stub_const(
      'Checker::GEO_DB',
      MaxMind::DB.new(
        'spec/fixtures/city-test-dummy.mmdb',
        mode: MaxMind::DB::MODE_MEMORY
      )
    )

    stub_const(
      'Checker::ASN_DB',
      MaxMind::DB.new(
        'spec/fixtures/asn-test-dummy.mmdb',
        mode: MaxMind::DB::MODE_MEMORY
      )
    )
  end
end
