class Checker
  require 'resolv'

  include ActiveModel::Model

  def initialize(ip:)
    @ip = ip
    @hostname = fetch_hostname(ip)
  end

  attr_accessor :ip
  attr_reader :hostname

  validates :ip, presence: true, format: { with: Resolv::AddressRegex }

  # Geolocation
  def geolocation
    fetch_geo_data(ip)
  end

  # Autonomous System Number
  def asn
    fetch_asn_data(ip)
  end

  def self.geo_db_connected?
    geo_db_file = File.join(
      ENV.fetch('DBIP_MMDB_PATH'), "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
    )

    File.exist?(geo_db_file)
  end

  def self.asn_db_connected?
    asn_db_file = File.join(
      ENV.fetch('DBIP_MMDB_PATH'), "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
    )

    File.exist?(asn_db_file)
  end

  private

    def fetch_hostname(ip)
      Resolv.new.getname(ip)
    rescue Resolv::ResolvError
      nil
    end

    def fetch_geo_data(ip)
      geo_db_file = File.join(
        ENV.fetch('DBIP_MMDB_PATH'), "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
      )

      return unless File.exist?(geo_db_file)

      geo_db ||= MaxMindDB.new(geo_db_file)
      geo_db.lookup(ip)
    end

    def fetch_asn_data(ip)
      asn_db_file = File.join(
        ENV.fetch('DBIP_MMDB_PATH'), "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
      )

      return unless File.exist?(asn_db_file)

      asn_db ||= MaxMindDB.new(asn_db_file)
      asn_db.lookup(ip)
    end
end
