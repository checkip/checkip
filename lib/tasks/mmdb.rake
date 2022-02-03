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
end
