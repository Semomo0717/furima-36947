FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 10)}
    email                 {Faker::Internet.free_email}
    password              {'mune0717'}
    first_name            { "山田"}
    first_kana_name       { "ヤマダ"}
    second_name           { "太郎"}
    second_kana_name      { "タロウ"}
    birthday              {"1932-02-03"}
  end
end