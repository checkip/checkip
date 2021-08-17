class Checker
  require 'resolv'

  include ActiveModel::Model

  GEO_DB_FILE = File.join(
    ENV.fetch('DBIP_MMDB_PATH'), "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
  )
  ASN_DB_FILE = File.join(
    ENV.fetch('DBIP_MMDB_PATH'), "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
  )

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
    File.exist?(GEO_DB_FILE)
  end

  def self.asn_db_connected?
    File.exist?(ASN_DB_FILE)
  end

  private

    def fetch_hostname(ip)
      Resolv.new.getname(ip)
    rescue Resolv::ResolvError
      nil
    end

    def fetch_geo_data(ip)
      return unless Checker.geo_db_connected?

      MaxMindDB.new(GEO_DB_FILE, MaxMindDB::LOW_MEMORY_FILE_READER).lookup(ip)
    end

    def fetch_asn_data(ip)
      return unless Checker.asn_db_connected?

      MaxMindDB.new(ASN_DB_FILE, MaxMindDB::LOW_MEMORY_FILE_READER).lookup(ip)
    end
end
