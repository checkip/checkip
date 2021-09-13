module DocumentationsHelper
  def snippet_api_https
    response = ''
    response << "# curl example to get your IP address over HTTPS\n"
    response << "curl #{request.protocol + request.host_with_port}\n\n"
    response << "# curl example using `-L` option\n"
    response << "curl -L #{request.host_with_port}\n\n"
    response << "# wget example\n"
    response << "wget -qO- #{request.host_with_port}\n\n"
    response << "# HTTPie example\n"
    response << "http -Fb #{request.host_with_port}"

    response
  end

  def snippet_api_json(data)
    response = ''
    response << "# Get a complete JSON response\n"
    response << "curl -L #{request.host_with_port}/json\n"
    response << JSON.pretty_generate(data)

    response
  end

  def snippet_api_filter(data)
    response = ''
    data.each do |key, value|
      response << "# Get #{key}\n"
      response << "curl -L #{request.host_with_port}/#{key}\n"
      response << if key == :asn
                    "#{JSON.pretty_generate(value)}\n\n"
                  else
                    "=> #{value}\n\n"
                  end
    end

    response
  end
end
