require 'down'

namespace :db_ip do
  desc 'Fetch new DB IP databases'
  task fetch: :environment do
    tempfile_city_lite = Down.download(
      "https://download.db-ip.com/free/dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz",
      max_size: 250 * 1024 * 1024
    )

    city_lite_path = File.join(
      ENV.fetch('DBIP_CITY_DB_PATH'),
      "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz"
    )

    FileUtils.mv(
      tempfile_city_lite.path,
      city_lite_path
    )

    Zlib::GzipReader.open(city_lite_path) do |gz|
      IO.binwrite(
        File.join(
          ENV.fetch('DBIP_ASN_DB_PATH'),
          "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
        ),
        gz.read
      )
    end

    FileUtils.rm(city_lite_path)

    tempfile_asn_lite = Down.download(
      "https://download.db-ip.com/free/dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz",
      max_size: 50 * 1024 * 1024
    )

    asn_lite_path = File.join(
      ENV.fetch('DBIP_ASN_DB_PATH'),
      "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz"
    )
    FileUtils.mv(
      tempfile_asn_lite.path,
      asn_lite_path
    )

    Zlib::GzipReader.open(asn_lite_path) do |gz|
      IO.binwrite(
        File.join(
          ENV.fetch('DBIP_ASN_DB_PATH'),
          "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
        ),
        gz.read
      )
    end

    FileUtils.rm(asn_lite_path)
  end
end
