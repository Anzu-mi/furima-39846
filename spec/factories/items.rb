FactoryBot.define do
  factory :item do
    item_name            { 'test' }
    item_comment         { 'sample' }
    category_id          { 2 }
    itemsituation_id     { 2 }
    burden_id            { 2 }
    prefecture_id        { 2 }
    duration_id          { 2 }
    price                { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
