class Checker
  require 'resolv'

  include ActiveModel::Model

  def initialize(ip:)
    @ip = ip
    geo = fetch_geo_data(ip)
    asn = fetch_asn_data(ip)

    @hostname = fetch_hostname(ip)
    @city = geo.city.name
    @region = geo.subdivisions.most_specific.name
    @country = geo.country.iso_code
    @loc = "#{geo.location.latitude},#{geo.location.longitude}"
    @asn = {
      asn: asn['autonomous_system_number'],
      name: asn['autonomous_system_organization'],
      route: asn['network']
    }
  end

  attr_accessor :ip
  attr_reader :hostname, :city, :region, :country, :loc, :asn

  validates :ip, presence: true, format: { with: Resolv::AddressRegex }

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
