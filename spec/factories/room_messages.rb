FactoryBot.define do
  factory :room_message do

    association :artist
    association :donation_project_room

    text { '一緒に団結して頑張りましょう!!!' }
    
  end
end
