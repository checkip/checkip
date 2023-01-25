require 'down'

namespace :db_ip do
  desc 'Fetch new DB IP databases'
  task :fetch, [:mmdb_dir_path] => [:environment] do |_t, args|
    db_date = DateTime.now.strftime('%Y-%m')
    db_remote_path = 'https://download.db-ip.com/free'

    db_city_file = "dbip-city-lite-#{db_date}.mmdb.gz"
    db_city_file_max_size = 200 * 1024 * 1024

    db_asn_file = "dbip-asn-lite-#{db_date}.mmdb.gz"
    db_asn_file_max_size = 50 * 1024 * 1024

    if check_local(file_name: db_city_file, local_dir: args[:mmdb_dir_path])
      puts "— #{db_city_file}"
    elsif check_remote("#{db_remote_path}/#{db_city_file}")
      fetch_remote(
        remote_path: db_remote_path,
        file_name: db_city_file,
        file_max_size: db_city_file_max_size,
        local_dir: args[:mmdb_dir_path]
      )
    else
      puts "✗ #{db_remote_path}/#{db_city_file}"
    end

    if check_local(file_name: db_asn_file, local_dir: args[:mmdb_dir_path])
      puts "— #{db_asn_file}"
    elsif check_remote("#{db_remote_path}/#{db_asn_file}")
      fetch_remote(
        remote_path: db_remote_path,
        file_name: db_asn_file,
        file_max_size: db_asn_file_max_size,
        local_dir: args[:mmdb_dir_path]
      )
    else
      puts "✗ #{db_remote_path}/#{db_city_file}"
    end
  end

  private

    def check_local(file_name:, local_dir:)
      mmdb_file_path = File.join(
        local_dir,
        file_name.chomp('.gz')
      )

      File.exist?(mmdb_file_path)
    end

    def check_remote(remote_file_path)
      remote_file = Down.open(remote_file_path)
      remote_file.data[:status] == 200
    rescue Down::ResponseError
      false
    end

    def fetch_remote(
      remote_path:,
      file_name:,
      file_max_size:,
      local_dir:
    )
      file_local_path = File.join(local_dir, file_name)

      tempfile = Down.download(
        "#{remote_path}/#{file_name}",
        max_size: file_max_size
      )

      FileUtils.mv(tempfile.path, file_local_path)

      Zlib::GzipReader.open(file_local_path) do |gz|
        mmdb_file_path = File.join(
          local_dir,
          file_name.chomp('.gz')
        )
        File.binwrite(mmdb_file_path, gz.read)
        puts "✓ #{File.basename(mmdb_file_path)}"
      end

      FileUtils.rm(file_local_path)
    end
end
