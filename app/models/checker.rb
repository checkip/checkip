class Checker
  require 'resolv'

  include ActiveModel::Model

  attr_accessor :ip

  validates :ip, presence: true, format: { with: Resolv::AddressRegex }

  def fetch_hostname
    Resolv.new.getname(ip)
  rescue Resolv::ResolvError
    nil
  end
end
