class Checker
  require 'resolv'

  include ActiveModel::Model

  GEO_DB_FILE = File.join(
    ENV.fetch('DBIP_MMDB_PATH'), "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
  ).freeze
  ASN_DB_FILE = File.join(
    ENV.fetch('DBIP_MMDB_PATH'), "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
  ).freeze

  if File.exist?(GEO_DB_FILE)
    GEO_DB = MaxMind::DB.new(
      GEO_DB_FILE,
      mode: MaxMind::DB::MODE_MEMORY
    ).freeze
  end

  if File.exist?(ASN_DB_FILE)
    ASN_DB = MaxMind::DB.new(
      ASN_DB_FILE,
      mode: MaxMind::DB::MODE_MEMORY
    ).freeze
  end

  def initialize(ip:)
    @ip = ip
    @hostname = fetch_hostname(ip)
  end

  attr_accessor :ip
  attr_reader :hostname

  validates :ip, presence: true, format: { with: Resolv::AddressRegex }

  # Geolocation
  def geolocation
    return unless defined?(GEO_DB)

    GEO_DB.get(ip)
  end

  # Autonomous System Number
  def asn
    return unless defined?(ASN_DB)

    ASN_DB.get_with_prefix_length(ip)
  end

  private

    def fetch_hostname(ip)
      Resolv.new.getname(ip)
    rescue Resolv::ResolvError
      nil
    end
end
