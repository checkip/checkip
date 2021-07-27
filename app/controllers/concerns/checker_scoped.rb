module CheckerScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_checker
  end

  private

    def set_checker
      return unless Checker.new(ip: request.remote_ip).valid?

      checker = Checker.new(ip: request.remote_ip)

      checker_hash = {
        ip: checker.ip,
        hostname: checker.hostname
      }

      unless checker.geolocation.nil?
        checker_hash.merge!(
          {
            city: checker.geolocation.city.name,
            region: checker.geolocation.subdivisions.most_specific.name,
            country: checker.geolocation.country.iso_code,
            loc: format_loc(checker.geolocation.location)
          }
        )
      end

      checker_hash[:asn] = format_asn(checker.asn) unless checker.asn.nil?

      @checker = checker_hash.compact
    end

    def format_loc(location)
      return unless location.latitude && location.longitude

      "#{location.latitude},#{location.longitude}"
    end

    def format_asn(asn)
      return unless asn['autonomous_system_number']

      {
        asn: "AS#{asn['autonomous_system_number']}",
        name: asn['autonomous_system_organization'],
        route: asn['network']
      }.compact
    end
end
