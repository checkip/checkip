module CheckerScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_checker
  end

  private

    def set_checker
      return unless Checker.new(ip: request.remote_ip).valid?

      checker = Checker.new(ip: request.remote_ip)

      geo_data = checker.geolocation
      asn_data = checker.asn

      checker_hash = {
        ip: checker.ip,
        hostname: checker.hostname
      }

      unless geo_data.nil?
        checker_hash.merge!(
          {
            city: geo_data['city']['names']['en'],
            region: geo_data['subdivisions'][0]['names']['en'],
            country: geo_data['country']['iso_code'],
            loc: format_loc(geo_data['location'])
          }
        )
      end

      checker_hash[:asn] = format_asn(asn_data, checker.ip) unless asn_data.nil?

      @checker = checker_hash.compact
    end

    def format_loc(location)
      "#{location['latitude']},#{location['longitude']}"
    end

    def format_asn(asn, ip)
      return unless asn[0]

      {
        asn: "AS#{asn[0]['autonomous_system_number']}",
        name: asn[0]['autonomous_system_organization'],
        route: construct_route(ip, asn[1])
      }.compact
    end

    def construct_route(ip, prefix)
      addr = "#{ip}/#{prefix}"
      "#{IPAddr.new(addr)}/#{prefix}"
    end
end
