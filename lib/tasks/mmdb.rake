require 'down'

namespace :mmdb do
  desc 'Fetch new MMDB files'
  task update: :environment do
    mmdb_dir_path = File.join(
      ENV.fetch('MMDB_DIR_PATH'),
      ENV.fetch('MMDB_PROVIDER')
    )

    FileUtils.mkdir_p(mmdb_dir_path)

    puts "===== #{DateTime.now.strftime('%Y-%m-%d %H:%M %:z')} ====="
    puts "↓ #{mmdb_dir_path}"

    case ENV.fetch('MMDB_PROVIDER')
    when 'dbip'
      Rake::Task['db_ip:fetch'].invoke(mmdb_dir_path)
    end
  end

  # https://maxmind.github.io/MaxMind-DB/#database-metadata
  task list: :environment do
    db_geo = MaxMind::DB.new(
      Checkip::Datasource::GEO_DB_FILE,
      mode: MaxMind::DB::MODE_MEMORY
    )
    db_asn = MaxMind::DB.new(
      Checkip::Datasource::ASN_DB_FILE,
      mode: MaxMind::DB::MODE_MEMORY
    )

    [db_geo, db_asn].each do |db|
      # rubocop:disable Layout/LineLength
      puts "===== #{db.metadata.database_type} ====="
      puts "Build:        #{Time.at(db.metadata.build_epoch).utc.to_datetime.strftime('%Y-%m-%d %H:%M:%S')} UTC"
      puts "Description:  #{db.metadata.description['en']}"
      puts "MMDB version: #{db.metadata.binary_format_major_version}.#{db.metadata.binary_format_minor_version}"
      puts "IP version:   IPv#{db.metadata.ip_version}"
      puts "Languages:    #{db.metadata.languages.join(',')}"
      puts "Node count:   #{db.metadata.node_count}"
      puts "Record size:  #{db.metadata.record_size}\n\n"
      # rubocop:enable Layout/LineLength
    end
  end
end
