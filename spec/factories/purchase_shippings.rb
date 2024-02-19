FactoryBot.define do
  factory :purchase_shipping do
    post_code                 { "123-4567" }
    prefecture_id             { 2 }
    municipalities            { "テスト" }
    street_address            { "テスト1-1-1"}
    telephone                 { "09011112222" }
    token                     { "tok_abcdefghijk00000000000000000" }
    association :user
    association :item
  end
end
