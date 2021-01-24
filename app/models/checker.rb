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

  private

    def fetch_hostname(ip)
      Resolv.new.getname(ip)
    rescue Resolv::ResolvError
      nil
    end

    def fetch_geo_data(ip)
      geo_db ||= MaxMindDB.new(
        File.join(
          ENV.fetch('DBIP_CITY_DB_PATH'), "dbip-city-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
        )
      )
      geo_db.lookup(ip)
    end

    def fetch_asn_data(ip)
      asn_db ||= MaxMindDB.new(
        File.join(
          ENV.fetch('DBIP_ASN_DB_PATH'), "dbip-asn-lite-#{DateTime.now.strftime('%Y-%m')}.mmdb"
        )
      )
      asn_db.lookup(ip)
    end
end
