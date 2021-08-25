require 'rails_helper'

RSpec.describe Checker, type: :model do
  let(:ipv4_cf) { described_class.new(ip: '1.1.1.1') }
  let(:ipv6_cf) { described_class.new(ip: '2606:4700:4700::64') }
  let(:ipv6_unk) { described_class.new(ip: '2a01:7e00::f03c:91ff:fed5:50d9') }
  let(:ipv4_london) { described_class.new(ip: '81.2.69.192') }
  let(:ipv4_dtag) { described_class.new(ip: '31.224.0.0') }

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

  describe 'hostname' do
    it 'is a hostname when resolve ipv4' do
      expect(ipv4_cf.hostname).to eq 'one.one.one.one'
    end

    it 'is a hostname when resolve ipv6' do
      expect(ipv6_cf.hostname).to eq 'dns64.cloudflare-dns.com'
    end

    it "is nil when can't resolve" do
      expect(ipv6_unk.hostname).to be_nil
    end
  end

  describe 'geolocation' do
    it 'includes city data' do
      expect(ipv4_london.geolocation['city']['names']['en']).to eq 'London'
    end

    it 'includes region data' do
      expect(ipv4_london.geolocation['subdivisions'][0]['names']['en']).to eq 'England'
    end

    it 'includes country data' do
      expect(ipv4_london.geolocation['country']['names']['en']).to eq 'United Kingdom'
    end

    it 'includes country code data' do
      expect(ipv4_london.geolocation['country']['iso_code']).to eq 'GB'
    end

    it 'includes continent data' do
      expect(ipv4_london.geolocation['continent']['names']['en']).to eq 'Europe'
    end

    it 'includes continent code data' do
      expect(ipv4_london.geolocation['continent']['code']).to eq 'EU'
    end
  end

  describe 'asn' do
    it 'includes autonomous system number' do
      expect(ipv4_dtag.asn[0]['autonomous_system_number']).to eq 3320
    end

    it 'includes autonomous system organization' do
      expect(ipv4_dtag.asn[0]['autonomous_system_organization']).to eq 'Deutsche Telekom AG'
    end
  end
end
