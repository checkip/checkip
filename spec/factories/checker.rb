FactoryBot.define do
  factory :checker do
    ip { Faker::Internet.public_ip_v4_address }

    factory :checker_ipv6 do
      ip { Faker::Internet.ip_v6_address }
    end

    factory :checker_invalid do
      ip { 'ip address' }
    end

    initialize_with { new(ip: ip) }
  end
end
