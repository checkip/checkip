class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found
  end
end
