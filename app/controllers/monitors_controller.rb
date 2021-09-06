class MonitorsController < ApplicationController
  def show
    respond_to do |format|
      format.json { render json: JSON.pretty_generate(health_check_hash) }
    end
  end

  private

    def format_db_version(db)
      Time.zone.at(db.metadata.build_epoch).strftime('%Y-%m-%d')
    end

    def health_check_hash
      health = { status: 'OK', geo_database: {}, asn_database: {} }

      health[:geo_database].merge!(if defined?(Checker::GEO_DB)
                                     {
                                       connected: true,
                                       version: format_db_version(Checker::GEO_DB)
                                     }
                                   else
                                     { connected: false }
                                   end)
      health[:asn_database].merge!(if defined?(Checker::ASN_DB)
                                     {
                                       connected: true,
                                       version: format_db_version(Checker::ASN_DB)
                                     }
                                   else
                                     { connected: false }
                                   end)

      health.compact
    end
end
