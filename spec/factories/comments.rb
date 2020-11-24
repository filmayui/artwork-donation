FactoryBot.define do
  factory :comment do

    association :user
    association :artwork

    text { 'とても良い作品ですね!!!' }
    
  end
end
