module DocumentationsHelper
  def snippet_api_https
    response = ''
    response << "# #{t('pages.documentation.api.snippet_curl')}\n"
    response << "curl #{request.protocol + request.host_with_port}\n\n"
    response << "# #{t('pages.documentation.api.snippet_curl_l')}\n"
    response << "curl -L #{request.host_with_port}\n\n"
    response << "# #{t('pages.documentation.api.snippet_wget')}\n"
    response << "wget -qO- #{request.host_with_port}\n\n"
    response << "# #{t('pages.documentation.api.snippet_httpie')}\n"
    response << "http -Fb #{request.host_with_port}"

    response.strip
  end

  def snippet_api_json(data)
    response = ''
    response << "# #{t('pages.documentation.api.snippet_json_response')}\n"
    response << "curl -L #{request.host_with_port}/json\n"
    response << "# #{t('pages.documentation.api.snippet_json_header')}\n"
    response << "curl -LH 'Accept: application/json' #{request.host_with_port}\n"
    response << JSON.pretty_generate(data)

    response.strip
  end

  def snippet_api_filter(data)
    response = ''
    data.each do |key, value|
      response << "# #{key}\n"
      response << "curl -L #{request.host_with_port}/#{key}\n"
      response << if key == :asn
                    "#{JSON.pretty_generate(value)}\n\n"
                  else
                    "=> #{value}\n\n"
                  end
    end

    response.strip
  end
end
