FactoryBot.define do
  factory :history_area do
    post_code { "123-4567" }
    ship_id { "2" }
    city { "東京都" }
    address { "1-1" }
    building { "東京ハイツ" }
    phone_number {"09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
