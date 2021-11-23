require 'down'

namespace :db_ip do
  desc 'Fetch new DB IP databases'
  task fetch: :environment do
    puts "===== #{DateTime.now.strftime('%Y-%m-%d %H:%M %:z')} ====="
    puts "↓ #{ENV.fetch('DBIP_MMDB_PATH')}"

    tempfile_city_lite = Down.download(
      "https://download.db-ip.com/free/dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz",
      max_size: 250 * 1024 * 1024
    )

    city_lite_path = File.join(
      ENV.fetch('DBIP_MMDB_PATH'),
      "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz"
    )

    FileUtils.mv(
      tempfile_city_lite.path,
      city_lite_path
    )

    Zlib::GzipReader.open(city_lite_path) do |gz|
      mmdb_file_path = File.join(
        ENV.fetch('DBIP_MMDB_PATH'),
        "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
      )
      File.binwrite(mmdb_file_path, gz.read)
      puts "✓ #{File.basename(mmdb_file_path)}"
    end

    FileUtils.rm(city_lite_path)

    tempfile_asn_lite = Down.download(
      "https://download.db-ip.com/free/dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz",
      max_size: 50 * 1024 * 1024
    )

    asn_lite_path = File.join(
      ENV.fetch('DBIP_MMDB_PATH'),
      "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb.gz"
    )
    FileUtils.mv(
      tempfile_asn_lite.path,
      asn_lite_path
    )

    Zlib::GzipReader.open(asn_lite_path) do |gz|
      mmdb_file_path = File.join(
        ENV.fetch('DBIP_MMDB_PATH'),
        "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
      )
      File.binwrite(mmdb_file_path, gz.read)
      puts "✓ #{File.basename(mmdb_file_path)}"
    end

    FileUtils.rm(asn_lite_path)
  end
end
