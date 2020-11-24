FactoryBot.define do
  factory :artist do

    association :user
    association :donation_project

    artist_name { '岡本太郎' }
    affiliation { '現代美術' }
    personal_history { '「職業は人間」「芸術は爆発だ」「芸術は呪術だ」「グラスの底に顔があっても良いじゃないか」などと発言した事でも知られる' }
    reason_for_support_activities { 'ー日本人は爆発しなければならないー' }
    artist_message { '「芸術は爆発だ」' }

  end
end
