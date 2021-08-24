class MonitorsController < ApplicationController
  def show
    respond_to do |format|
      format.json do
        render json: {
          status: 'OK',
          geo_database: {
            connected: defined?(Checker::GEO_DB) ? true : false
          },
          asn_database: {
            connected: defined?(Checker::ASN_DB) ? true : false
          }
        }
      end
    end
  end
end
