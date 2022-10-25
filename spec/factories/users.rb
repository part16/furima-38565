FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2)}
    email                 { Faker::Internet.free_email}
    password              { Faker::Internet.password(min_length: 6)}
    name_sei              { "田中"}
    name_mei              { "太郎"}
    name_furi             { "タナカ"}
    name_gana             { "タロウ"}
    birth_date            { "2000-01-01"}
    password_confirmation { password}
  end
end