module Checkip
  class Datasource
    GEO_DB_FILE = case ENV.fetch('MMDB_PROVIDER')
                  when 'dbip'
                    File.join(
                      ENV.fetch('MMDB_DIR_PATH'),
                      ENV.fetch('MMDB_PROVIDER'),
                      "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
                    ).freeze
                  end

    ASN_DB_FILE = case ENV.fetch('MMDB_PROVIDER')
                  when 'dbip'
                    File.join(
                      ENV.fetch('MMDB_DIR_PATH'),
                      ENV.fetch('MMDB_PROVIDER'),
                      "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
                    ).freeze
                  end
  end
end
