class MonitorsController < ApplicationController
  def show
    respond_to do |format|
      format.json do
        render json: {
          status: 'OK',
          geo_database: {
            connected: Checker.geo_db_connected?
          },
          asn_database: {
            connected: Checker.asn_db_connected?
          }
        }
      end
    end
  end
end
