require 'down'

namespace :db_ip do
  desc 'Fetch new DB IP databases'
  task :fetch, [:mmdb_dir_path] => [:environment] do |_t, args|
    db_date = DateTime.now.strftime('%Y-%m')
    db_remote_path = 'https://download.db-ip.com/free'

    db_city_file = "dbip-city-lite-#{db_date}.mmdb.gz"
    db_city_file_path = File.join(args[:mmdb_dir_path], db_city_file)
    db_city_file_max_size = 200 * 1024 * 1024

    db_asn_file = "dbip-asn-lite-#{db_date}.mmdb.gz"
    db_asn_file_path = File.join(args[:mmdb_dir_path], db_asn_file)
    db_asn_file_max_size = 50 * 1024 * 1024

    unless check_remote("#{db_remote_path}/#{db_city_file}")
      puts "✗ #{db_remote_path}/#{db_city_file}"
      next
    end

    tempfile_city_lite = Down.download(
      "#{db_remote_path}/#{db_city_file}",
      max_size: db_city_file_max_size
    )

    FileUtils.mv(tempfile_city_lite.path, db_city_file_path)

    Zlib::GzipReader.open(db_city_file_path) do |gz|
      mmdb_file_path = File.join(
        args[:mmdb_dir_path],
        db_city_file.chomp('.gz')
      )
      File.binwrite(mmdb_file_path, gz.read)
      puts "✓ #{File.basename(mmdb_file_path)}"
    end

    FileUtils.rm(db_city_file_path)

    unless check_remote("#{db_remote_path}/#{db_asn_file}")
      puts "✗ #{db_remote_path}/#{db_asn_file}"
      next
    end

    tempfile_asn_lite = Down.download(
      "#{db_remote_path}/#{db_asn_file}",
      max_size: db_asn_file_max_size
    )

    FileUtils.mv(tempfile_asn_lite.path, db_asn_file_path)

    Zlib::GzipReader.open(db_asn_file_path) do |gz|
      mmdb_file_path = File.join(
        args[:mmdb_dir_path],
        db_asn_file.chomp('.gz')
      )
      File.binwrite(mmdb_file_path, gz.read)
      puts "✓ #{File.basename(mmdb_file_path)}"
    end

    FileUtils.rm(db_asn_file_path)
  end

  private

    def check_remote(remote_file_path)
      remote_file = Down.open(remote_file_path)
      remote_file.data[:status] == 200
    rescue Down::ResponseError
      false
    end
end
