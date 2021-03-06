module CheckersHelper
  def checker_json(checker)
    checker_hash = {
      ip: checker.ip,
      hostname: checker.hostname,
      city: checker.geolocation.city.name,
      region: checker.geolocation.subdivisions.most_specific.name,
      country: checker.geolocation.country.iso_code,
      loc: format_loc(checker.geolocation.location),
      asn: format_asn(checker.asn)
    }
    JSON.pretty_generate(checker_hash.compact)
  end

  private

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
