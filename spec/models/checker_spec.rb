require 'rails_helper'

RSpec.describe Checker, type: :model do
  let(:ipv4_cf) { described_class.new(ip: '1.1.1.1') }
  let(:ipv6_cf) { described_class.new(ip: '2606:4700:4700::64') }
  let(:ipv6_unk) { described_class.new(ip: '2a01:7e00::f03c:91ff:fed5:50d9') }

  describe 'ip' do
    it 'is valid when IPv4' do
      expect(build(:checker)).to be_valid
    end

    it 'is valid when IPv6' do
      expect(build(:checker_ipv6)).to be_valid
    end

    it 'is invalid when empty' do
      expect(build(:checker, ip: '')).to be_invalid
    end

    it 'is invalid when nil' do
      expect(build(:checker, ip: nil)).to be_invalid
    end

    it 'is invalid when not an ip' do
      expect(build(:checker_invalid)).to be_invalid
    end
  end

  describe '#fetch_hostname' do
    it 'returns hostname for a given IPv4' do
      expect(ipv4_cf.fetch_hostname).to eq 'one.one.one.one'
    end

    it 'returns hostname for a given IPv6' do
      expect(ipv6_cf.fetch_hostname).to eq 'dns64.cloudflare-dns.com'
    end

    it 'returns nil for unknown hostname' do
      expect(ipv6_unk.fetch_hostname).to be_nil
    end
  end
end
