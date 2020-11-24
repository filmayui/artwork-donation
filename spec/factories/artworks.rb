FactoryBot.define do
  factory :artwork do

    association :artist

    title { 'モナリザ' }
    text { 'イタリアの美術家レオナルド・ダ・ヴィンチが描いた油彩画。上半身のみが描かれた女性の肖像画で、もっともパロディ作品が作られた美術作品」といわれている。' }
    size { 'h200cm ×　w500cm' }
    price { 30000 }
    category_id { 1 }
    main_color_id { 1 }
    motif_id { 1 }
    feeling_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
    
  end
end
