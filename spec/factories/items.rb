FactoryBot.define do
  factory :item do
    item_name             { Faker::Lorem.word}
    item_discribe         { Faker::Lorem.sentence}
    item_price            { "12345"}  
    state_id              { "2"}
    category_id           { "2"}
    postage_id            { "2"}
    ship_id               { "2"}
    scheduled_day_id      { "2"}
    association :user


    
    


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
