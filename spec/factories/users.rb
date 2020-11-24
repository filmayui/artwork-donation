FactoryBot.define do
  factory :user do
    
    nickname              { 'emma' }
    email                 { 'ab@cd' }
    password              { '1234abcd' }
    password_confirmation { password }
    last_name             { '山口' }
    first_name            { '光一' }
    last_name_kana        { 'ヤマグチ' }
    first_name_kana       { 'コウイチ' }
    birth_date            { '1930-01-01' }

  end
end
