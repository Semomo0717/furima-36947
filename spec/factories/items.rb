FactoryBot.define do
  factory :item do
    association :user 
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/pictures/item-sample.png'))}
    title             {"商品名"}
    explanation       {"説明"}
    category_id       {'2'}
    situation_id      {'2'}
    shipingcost_id    {'2'}
    area_id           {'15'}
    timeship_id       {'2'}
    cost              {300000}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
