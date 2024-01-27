FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname              { '山田' }
    firstname             { '太郎' }
    lastname_kana         { 'ヤマダ' }
    firstname_kana        { 'タロウ' }
    birthday              { '1990-01-01' }
  end
end
